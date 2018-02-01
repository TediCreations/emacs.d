;;------------------------------------------------------------------------------
;;Test that all is working
(global-set-key (kbd "<f5>")
                (lambda ()
                  (interactive)
                  (message "Works!")))
