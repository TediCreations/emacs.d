;;------------------------------------------------------------------------------
;;Syntax check with cpplint.py
(defun my:flymake-google-init()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;;------------------------------------------------------------------------------
;; Tags for code navigation
(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1))))
  )

;;------------------------------------------------------------------------------
;;Test

;;CEDET
(semantic-mode 1);;Turn on semantic
;;Add semantic as a suggestion to autocomplete
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(provide 'tedi-tests)

;;------------------------------------------------------------------------------
;;Test
;;(set-face-attribute 'default nil :font "OCR A Extended" )
;;(set-frame-font "OCR A Extended" nil t)

;;(global-set-key (kbd "<f5>") (expose #'revert-buffer nil t))
