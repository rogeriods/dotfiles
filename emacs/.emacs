(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(package-initialize)

;; Gruber Darker theme
(unless (package-installed-p 'gruber-darker-theme)
  (package-refresh-contents)
  (package-install 'gruber-darker-theme))

(mapc #'disable-theme custom-enabled-themes)
(load-theme 'gruber-darker t)

;; Autocomplete and syntax help for C
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))

(add-hook 'after-init-hook 'global-company-mode)

;; C programing basics
(setq c-default-style "linux"
      c-basic-offset 4)

;; One-key to build and run C
(defun my-c-build ()
  (interactive)
  (compile "gcc -Wall -Wextra -g main.c -o main -lm"))

(defun my-c-run ()
  (interactive)
  (shell-command "./main"))

(add-hook 'c-mode-hook
          (lambda ()
            (local-set-key (kbd "<f5>") #'my-c-build)
            (local-set-key (kbd "<f6>") #'my-c-run)))

;; Highlight matching parentheses
(show-paren-mode 1)

;; Disable the not-so-useful tool and scroll bars
(tool-bar-mode 0)
(menu-bar-mode 1)
(scroll-bar-mode 0)

;; Set default font
(set-face-attribute 'default nil
                    :height 140)

;; Show relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Line numbers better look for gruber darker theme
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Clean startup
(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Auto-indent on Enter
(add-hook 'c-mode-hook
 (lambda ()
   (setq indent-tabs-mode nil)
   (c-set-offset 'substatement-open 0)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(gruber-darker-theme)))
