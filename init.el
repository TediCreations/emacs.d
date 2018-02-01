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
;;Test that all is working
(global-set-key (kbd "<f5>")
                (lambda ()
                  (interactive)
                  (message "Works!")))


;;------------------------------------------------------------------------------
;;Test
;;(set-face-attribute 'default nil :font "OCR A Extended" )
;;(set-frame-font "OCR A Extended" nil t)
