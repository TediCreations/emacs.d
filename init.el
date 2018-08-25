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

;;------------------------------------------------------------------------------
;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

;;------------------------------------------------------------------------------
;;Generated
