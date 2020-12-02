;;; init.el --- Emacs setup entry point
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-mode nil)
 '(package-selected-packages
   '(company-lsp yasnippet lsp-ui lsp-metals lsp-mode sbt-mode use-package flycheck scala-mode which-key monokai-theme magit))
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'monokai t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;;(setq inhibit-startup-message t
;; inhibit-startup-echo-area-message t)
;; (define-key global-map (kbd "RET") 'newline-and-indent)
(which-key-mode 1)
(global-flycheck-mode)

;; Add Modules and Subdirs to Load Path
(defvar modules-dir)
(setq modules-dir (concat user-emacs-directory (convert-standard-filename "modules/")))
(let ((default-directory modules-dir))
  (normal-top-level-add-subdirs-to-load-path))


(require 'lang-mod)
;;; init.el ends here
