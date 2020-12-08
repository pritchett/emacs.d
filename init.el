;;; init.el --- Emacs setup entry point
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if not already installed
(defvar package-list)
(setq package-list '(diminish monokai-theme use-package))

(dolist (p package-list)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p)))
(require 'use-package)
(require 'diminish)

(setq use-package-always-ensure t)
(load-theme 'monokai t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1) ; Switch to line number mode
(setq visible-bell t)
;(ido-mode 1)
(setq inhibit-startup-message t)
;(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)
;;(setq inhibit-startup-message t
;; inhibit-startup-echo-area-message t)
;; (define-key global-map (kbd "RET") 'newline-and-indent)

;; Add Modules and Subdirs to Load Path
(defvar modules-dir)
(setq modules-dir (concat user-emacs-directory (convert-standard-filename "modules/")))
(let ((default-directory modules-dir))
  (normal-top-level-add-subdirs-to-load-path))

(require 'completion-mod)
(require 'lang-mod)
(require 'vc-mod)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-lsp yasnippet lsp-ui lsp-metals lsp-mode flycheck sbt-mode scala-mode which-key counsel use-package monokai-theme diminish)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
