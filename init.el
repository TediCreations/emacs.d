;; ---------------------------------------------------------------------------

(setq init-el-directory user-emacs-directory)
(setq user-emacs-directory "~/.cache/emacs")

;; ---------------------------------------------------------------------------
;; Set the garbage collection early to load faster.
;; We will set it back at the end of the init.el
(setq gc-cons-threshold (* 50 1000 1000))

;; ---------------------------------------------------------------------------
;; Show startup time in minibuffer

(defun my/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'my/display-startup-time)

;; ---------------------------------------------------------------------------
;; Install Elpaca Package manager

(defvar elpaca-installer-version 0.5)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

;; Block until current queue processed.
(elpaca-wait)

;; ----------------------------------------------------------------------------

;; NOTE: If you want to move everything out of the ~/.emacs.d folder
;; reliably, set `user-emacs-directory` before loading no-littering!

(use-package no-littering
  :config
  ;; no-littering doesn't set this by default so we must place
  ;; auto save files in the same path as it uses for sessions
  (setq auto-save-file-name-transforms
	`((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

;;------------------------------------------------------------------------------

;; We need to load org early because we use it with org-babel
(use-package org
  :ensure t)

;; Block until current queue processed.
(elpaca-wait)

;;------------------------------------------------------------------------------

(defun my/load-custom-config (&optional config-file)
  "Load a custom Emacs configuration file.

  This function takes the name of a custom configuration file (e.g., 'config.org')
  and loads it using Org Babel's `org-babel-load-file`. The file is expected
  to be located in the user's Emacs configuration directory.

  Args:
  - CONFIG-FILE (optional): The name of the custom configuration file (e.g., 'config.org').
    If not provided, it defaults to 'config.org'.

  The `init-el-directory` variable specifies the location of the user's Emacs
  configuration directory. The function checks if the specified configuration
  file exists and is readable before loading it.
  "
  (interactive)
  (let ((default-config-file "config.org")
        (custom-config-file (expand-file-name
                             (or config-file default-config-file) init-el-directory)))
    (when (file-readable-p custom-config-file)
      (org-babel-load-file custom-config-file))))

;; Load the main function
(my/load-custom-config "config.org")

;; ----------------------------------------------------------------------------
;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

;;------------------------------------------------------------------------------
;; End of init.el
;;
