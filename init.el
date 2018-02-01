;;------------------------------------------------------------------------------
;;Initialize Emacs
(load "~/.emacs.d/lisp/initialize" )
(require 'tedi-initialize)

;;C/C++ IDE
;;(load "~/.emacs.d/lisp/c_cpp_ide" )
;;(require 'tedi-c_cpp_ide)

;;Tests
(load "~/.emacs.d/lisp/tests" )
(require 'tedi-tests)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)



;;------------------------------------------------------------------------------
;;Test
;;(set-face-attribute 'default nil :font "OCR A Extended" )
;;(set-frame-font "OCR A Extended" nil t)
