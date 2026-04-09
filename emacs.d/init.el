;;; init.el --- Unified config -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; Improve startup speed
(setq gc-cons-threshold (* 50 1000 1000))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Initialize package system
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; ====================
;;; UI CONFIGURATION
;;; ====================

;; File encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; Disable UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode 1)
(show-paren-mode 1)
;; (global-whitespace-mode 1)

;; Clean whitespace before saving
(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; Line numbers
(global-display-line-numbers-mode t)

;; Font (Windows-friendly)
(set-face-attribute 'default nil :font "Consolas-14")

;; Stop saving backup files
(setq make-backup-files nil)

;;; ====================
;;; PACKAGES
;;; ====================

(use-package magit)

;; Theme (optional)
;; (use-package gruber-darker-theme
;;   :config
;;   (load-theme 'gruber-darker t))

(use-package emacs
  :config
  (setq-default fill-column 80)
  (add-hook 'prog-mode-hook #'display-fill-column-indicator-mode))

;;; ====================
;;; KEYBINDINGS
;;; ====================

;; Better defaults
(global-set-key (kbd "C-x k") #'kill-this-buffer)

;; Ivy / search (optional)
;; (global-set-key (kbd "C-s") #'swiper)
;; (global-set-key (kbd "M-x") #'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") #'counsel-find-file)

;; Magit
(global-set-key (kbd "C-c m s") #'magit-status)
(global-set-key (kbd "C-c m l") #'magit-log)

;; Window navigation
(windmove-default-keybindings)

;;; init.el ends here