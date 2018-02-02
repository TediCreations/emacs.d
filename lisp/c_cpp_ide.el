;;------------------------------------------------------------------------------
;;Snippets
(use-package yasnippet
  :ensure t)
(require 'yasnippet)
(yas-global-mode 1)

;;------------------------------------------------------------------------------
;;Autocomplete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (require 'auto-complete)
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



(provide 'tedi-c_cpp_ide)
