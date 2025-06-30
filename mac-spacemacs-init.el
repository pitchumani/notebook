;;; Begin initialization
;; Turn off mouse interface early in startup to avoid momentary display
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; set case insensitive search
(setq case-fold-search t)
;; enable y for yes in the prompts
(fset 'yes-or-no-p 'y-or-n-p)
(global-display-line-numbers-mode 1)
;; expand tab to 4 spaces
(setq-default tab-width 4 indent-tabs-mode nil)
;;; highlight the matching paranthesis
(show-paren-mode 1)

;; set indent of 4 spaces for C and C++ source files
(setq c-default-style "linux"
      c-basic-offset 4)

;;; Set up package
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "http://elpa.gnu.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)
(setq package-check-signature nil)

;; packages to be installed
;; - counsel, evil, general, magit, projectile

(unless (package-installed-p 'general)
  (package-refresh-contents)
  (package-install 'general))
(require 'general)

;;; Personal information
(setq user-full-name "John Doe"
      user-mail-address "john.doe@example.com")

;;; Install evil - vim like key bindings
(use-package evil
  :ensure t)
(evil-mode 1)

;; display available key mappings in the minibuffer
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode +1))

;; map M-x to counsel-M-x which will list available commands
(global-set-key (kbd "M-x") 'counsel-M-x)

;; function to open bash shell
(defun shell-bash ()
  (interactive)
  (let ((default-directory "~/code/")
        (explicit-shell-file-name "/usr/local/bin/bash"))
    (shell "bash shell")))

; Define the shortcut keys
(general-define-key
 :states '(normal visual emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "w <left>" 'evil-window-left
 "w <right>" 'evil-window-right
 "w <up>" 'evil-window-up
 "w <down>" 'evil-window-down
 "w|" 'evil-window-vsplit
 "w-" 'evil-window-split
 "wd" 'evil-window-delete
 "/"  'swiper-isearch
 "ff" 'counsel-find-file
 "fo" 'open-org-agenda-file
 "fr" 'revert-buffer
 "bb" 'ivy-switch-buffer
 "bd" 'kill-current-buffer
 "bp" 'evil-prev-buffer
 "bn" 'evil-next-buffer
 "oa" 'org-agenda
 "oi" 'org-clock-in
 "oo" 'org-clock-out
 "ot" 'org-todo
 "oc" 'org-evaluate-time-range
 "oL" 'org-agenda-log-mode
 "or" 'org-analyzer-start
 "gs" 'magit-status
 "ss" 'shell-bash
 "tf" 'toggle-frame-fullscreen
 "tn" 'display-line-numbers-mode
 "td" 'text-scale-decrease
 "ti" 'text-scale-increase
 "pg" 'projectile-grep
 "pk" 'projectile-kill-buffers)

;; need to install solarized-theme package
;; (load-theme 'solarized-dark t)

(load-theme 'leuven-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(counsel evil general magit projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
