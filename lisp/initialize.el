;;------------------------------------------------------------------------------
;;Packages mode
(require 'package);;start package.el
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("MELPA" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("MELPA Stable" . "http://stable.melpa.org/packages/") t)

(package-initialize);;initialize package.el
;;(package-refresh-contents)

;;TODO: http://nilsdeppe.com/posts/emacs-c++-ide

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;------------------------------------------------------------------------------
;;Workplace
(setq inhibit-startup-message t)                  ;;Do not shown start-up screen
(tool-bar-mode -1)                                ;;Remove toolbar
(scroll-bar-mode -1)                              ;;Remove scroll-bar
(desktop-save-mode 1)                             ;;Save session
(set-frame-parameter nil 'fullscreen 'fullboth)   ;;Make fullscreen
(menu-bar-mode -1)                                ;;Hide menu
(defalias 'yes-or-no-p 'y-or-n-p)                 ;;y and n instead of yes and no
(setq auto-save-default nil)                      ;;Remove auto-save #...#
;;(global-set-key (kbd "<f5>") 'menu-bar-mode)      ;;Toggle menu-bar;;No need as f10 by default
(global-set-key (kbd "M-g") 'goto-line)           ;;Got to line number
(global-set-key (kbd "C-x k") 'kill-this-buffer)  ;;Kill buffer in window without asking y/n

;;------------------------------------------------------------------------------
;;Editor
(global-linum-mode t)                             ;; Show line numbers <
(column-number-mode t)                            ;; Show the column number V
(global-set-key (kbd "RET") 'newline-and-indent)  ;; Automatically indent when press RET
(global-set-key (kbd "C-c w") 'whitespace-mode)   ;; View all whitespace characters

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
	  (lambda()
	    (interactive)
	    (setq show-trailing-whitespace 1)))

;;------------------------------------------------------------------------------
;;Calculator
(global-set-key (kbd "C-=") 'calc)                ;;Add calculator functionality
(use-package calc
  :defer t
  :config (setf calc-display-trail nil))          ;;Do not let calculator display a window

;;------------------------------------------------------------------------------
;;Fonts
(set-default-font "Source Code Pro" nil t)        ;;Default font
(set-face-attribute 'default nil :height 100)     ;;Default font size %

;;------------------------------------------------------------------------------
;;Visualize whitespace
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)


;;------------------------------------------------------------------------------
;;Coding style
;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq-default indent-tabs-mode t)                 ;;Indentation is tabs
(setq-default tab-width 8)                        ;;Tab is represented by 8 spaces.

(setq c-default-style "linux"                     ;;Coding style of linux
      c-basic-offset 8)                           ;;Change indentation of tab by 8 spaces.

;;------------------------------------------------------------------------------
;;Theme
(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))

;;(use-package zenburn-theme
;;  :ensure t
;;  :config (load-theme 'zenburn t))

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'tedi t)

;;------------------------------------------------------------------------------
;;Mode line theme
(display-time-mode)                               ;;Show time V
(use-package smart-mode-line
  :ensure t)
(require 'smart-mode-line)
;;(setq powerline-arrow-shape 'curve)
;;(setq powerline-default-separator-dir '(right . left))
;;(setq sml/theme 'powerline)
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'dark)
(setq sml/mode-width 0)
(setq sml/name-width 20)
(rich-minority-mode 1)
(setf rm-blacklist "")
(use-package smart-mode-line-powerline
  :ensure t)
(sml/setup)

;;------------------------------------------------------------------------------
;;Search
(use-package counsel;;counsel is requirement for swiper
  :ensure t)

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

;;------------------------------------------------------------------------------
;;Navigation
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(provide 'tedi-tests)

;;------------------------------------------------------------------------------
;;Iedit - Edit multiple regions simultaneously
(use-package iedit
  :ensure t)
(require 'iedit)
;;(define-key global-map (kbd "C-c ;") 'iedit-mode);;This is not a bug in linux(only Mac)

;;------------------------------------------------------------------------------
;;Let's you try packages without installing them
(use-package try
  :ensure t)

;;Brings up help on key combinations
(use-package which-key
  :ensure t
  :config (which-key-mode))

;;------------------------------------------------------------------------------
;;Windows
(winner-mode 1);;Remember old configuration
(windmove-default-keybindings);;Enables traversing througth windows with shift+arrow keys
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap-other-window] 'ace-window)
    ))

;;------------------------------------------------------------------------------
;;Buffers
;; using swiper so ido no longer needed
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

(defalias 'list-buffers 'ibuffer)                 ;;Change the name of the 'all buffer list'.

(provide 'tedi-initialize)
