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

;;------------------------------------------------------------------------------
;;Clipboard
;; Do sensible clipboard things, please
;;(setf select-enable-clipboard nil
;;      select-enable-primary t
;;      mouse-drag-copy-region t
;;      mouse-yank-at-point t)

;;------------------------------------------------------------------------------
;; Tabs
(defun toggle-tab-width ()
  (interactive)
  (let* ((loop [8 4 2])
         (match (or (cl-position tab-width loop) -1)))
    (setf tab-width (aref loop (mod (1+ match) (length loop))))))
(global-set-key (kbd "C-h t") 'toggle-tab-width)  ;;Switch tabs size

;;------------------------------------------------------------------------------
;;Backups
(setf backup-inhibited t)                       ;;Enable buffer back-ups.

;;(setf auto-save-default nil)
;(setf auto-save-list-file-prefix (locate-user-emacs-file "local/saves"))
;(setf wdired-allow-to-change-permissions t)
(setf echo-keystrokes 0.1)                        ;;Display keystrokes
                                                  ;;  immediately.
;;(setf delete-active-region nil)
;;(setf disabled-command-function nil)
;;(setf custom-file (make-temp-file "emacs-custom"))
;;(setf large-file-warning-threshold 536870911)
;;(setf gc-cons-threshold (* 1024 1024 32))

;;(setf ring-bell-function (lambda ()))             ;;Turn-off alarms
