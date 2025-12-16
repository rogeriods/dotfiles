;; ----------------------------
;; Package system
;; ----------------------------
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ----------------------------
;; LSP (Java, YAML, Spring)
;; ----------------------------
(use-package lsp-mode
  :commands lsp
  :hook ((java-mode . lsp)
         (yaml-mode . lsp))
  :config
  (setq lsp-java-save-action-organize-imports t
        lsp-java-format-enabled t))

(use-package lsp-java)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-treemacs)

;; ----------------------------
;; YAML
;; ----------------------------
(use-package yaml-mode)

;; ----------------------------
;; Maven
;; ----------------------------
(use-package mvn)

;; ----------------------------
;; Theme
;; ----------------------------
(use-package gruber-darker-theme
  :config
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'gruber-darker t))

;; ----------------------------
;; Completion
;; ----------------------------
(use-package company
  :hook (after-init . global-company-mode))

;; ----------------------------
;; C programming
;; ----------------------------
(setq c-default-style "linux"
      c-basic-offset 4
      indent-tabs-mode nil)

(defun my-c-build ()
  (interactive)
  (compile "gcc -Wall -Wextra -g main.c -o main -lm"))

(defun my-c-run ()
  (interactive)
  (shell-command "./main"))

(add-hook 'c-mode-hook
          (lambda ()
            (local-set-key (kbd "<f5>") #'my-c-build)
            (local-set-key (kbd "<f6>") #'my-c-run)
            (c-set-offset 'substatement-open 0)))

;; ----------------------------
;; Editor behavior
;; ----------------------------
(show-paren-mode 1)
(setq kill-whole-line t)
(setq make-backup-files nil)

;; Auto indent & column guide
(setq-default fill-column 80)
(setq-default display-fill-column-indicator-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)

;; ----------------------------
;; Whitespace
;; ----------------------------
(use-package whitespace
  :config
  (setq whitespace-style '(face spaces tabs space-mark tab-mark)
        whitespace-display-mappings
        '((space-mark ?\  [?·])
          (tab-mark ?\t [?» ?\t])))
  (global-whitespace-mode 1))

;; ----------------------------
;; Line numbers
;; ----------------------------
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; ----------------------------
;; UI cleanup
;; ----------------------------
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(menu-bar-mode 1)

(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; ----------------------------
;; Font
;; ----------------------------
(set-face-attribute 'default nil :height 140)

;; ----------------------------
;; Custom (leave as-is)
;; ----------------------------
(custom-set-variables
 '(package-selected-packages '(gruber-darker-theme)))

(custom-set-faces)
