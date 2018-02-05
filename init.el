;;------------------------------------------------------------------------------
;;Initialize Emacs
(load "~/.emacs.d/lisp/initialize" )
(require 'tedi-initialize)

;;C/C++ IDE
(load "~/.emacs.d/lisp/c_cpp_ide" )
(require 'tedi-c_cpp_ide)

;;Tests
;;(load "~/.emacs.d/lisp/tests" )
;;(require 'tedi-tests)

;;------------------------------------------------------------------------------
;;Check that all is working
(global-set-key (kbd "<f7>")
                (lambda ()
                  (interactive)
                  (message "Works!")))

;;------------------------------------------------------------------------------
;;Generated
