;;------------------------------------------------------------------------------
;;Autocomplete
(require 'auto-complete)
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources
			   'ac-sources-c-headers)
  (add-to-list -achead:include-directories '"/usr/include/c++/5\
 /usr/include/x86_64-linux-gnu/c++/5\
 /usr/include/c++/5/backward\
 /usr/lib/gcc/x86_64-linux-gnu/5/include\
 /usr/local/include\
 /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed\
 /usr/include/x86_64-linux-gnu\
 /usr/include"
	       )
  )
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;------------------------------------------------------------------------------
;;Snippets
(require 'yasnippet)
(use-package yasnippet
  :ensure t)
(yas-global-mode 1)

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


(global-set-key (kbd "M-h")
                (lambda ()
                  (interactive)
                  (message "Hello from Emacs!")))

(defvar tedi-custom-keymap nil "my keymap..")

(setq tedi-custom-keymap (make-sparse-keymap))
(global-set-key (kbd "C-x M-j")  tedi-custom-keymap)

(define-key tedi-custom-keymap (kbd "s") 'clipboard-yank)
;;(define-key tedi-custom-keymap (kbd "t") 'twit)
;;(define-key tedi-custom-keymap (kbd "p") 'plan)

;;------------------------------------------------------------------------------
;;Generated
(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-a") 'kill-ring-save)
(global-set-key (kbd "C-C") 'kill-ring-save);;Does not work
(global-set-key (kbd "C-v") 'yank)

(global-set-key (kbd "C-d") 'forward-sentence)

(provide 'tedi-c_cpp_ide)
