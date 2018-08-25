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

;;------------------------------------------------------------------------------
;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

;;------------------------------------------------------------------------------
;;Check that all is working
(global-set-key (kbd "<f5>")
                (lambda ()
                  (interactive)
                  (message "Works!")))

;;------------------------------------------------------------------------------
;;Generated
