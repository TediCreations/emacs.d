;;------------------------------------------------------------------------------
;; This is the emacs home directory

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(setq user-emacs-directory "~/.emacs.d/")

;;------------------------------------------------------------------------------
;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p (concat user-emacs-directory "config.org") )
  (org-babel-load-file (expand-file-name (concat user-emacs-directory "config.org"))))

;;------------------------------------------------------------------------------
;; End of init.el
;;
