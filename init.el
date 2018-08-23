;;------------------------------------------------------------------------------

;;Initialize Emacs

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/lisp/initialize" )
(require 'tedi-initialize)

;;C/C++ IDE
(load "~/.emacs.d/lisp/c_cpp_ide" )
(require 'tedi-c_cpp_ide)

;;Tests
;;(load "~/.emacs.d/lisp/tests" )
;;(require 'tedi-tests)

;;Visiting the configuration
;;Quickly edit ~/.emacs.d/config.org
(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

;;Reloading the configuration
;;Simply pressing =Control-c r= will reload this file, very handy.
;;You can also manually invoke =config-reload=.
(defun config-reload ()
  "Reloads ~/.emacs.d/config.org at runtime"
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

;------------------------------------------------------------------------------
;;Check that all is working
(global-set-key (kbd "<f5>")
                (lambda ()
                  (interactive)
                  (message "Works!")))

;;------------------------------------------------------------------------------
;;Generated
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (linum-relative magit mark-multiple helm switch-window symon fancy-battery spaceline htmlize pretty-mode org-bullets projectile yasnippet which-key use-package try smart-mode-line pkg-info monokai-theme iedit counsel auto-complete ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
