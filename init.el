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


(server-start)
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
(require 'core-mod)
(require 'lang-mod)
(require 'projects-mod)
(require 'vc-mod)
(require 'utils-mod)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-mode nil)
 '(package-selected-packages
   '(sicp makefile-executor kubel csv-mode yaml-mode company-box company-lsp yasnippet lsp-ui lsp-metals lsp-mode flycheck sbt-mode scala-mode which-key counsel use-package monokai-theme diminish))
 '(sql-connection-alist
   '(("geomancer-sandbox"
      (sql-product 'postgres)
      (sql-user "geomancer_reader")
      (sql-database "geomancer_app")
      (sql-server "localhost"))))
 '(sql-postgres-login-params
   '((user :default "bpritchett")
     (database :default "bpritchett" :completion
	       #[771 "\211\242\302=\206
 \211\303=?\2053 r\301\204 p\202( \304 \305!\203% \306!\202& p\262q\210\307\300!$)\207"
		     [#[257 "\300 \207"
			    [sql-postgres-list-databases]
			    2 "

(fn _)"]
		      nil boundaries metadata minibuffer-selected-window window-live-p window-buffer complete-with-action]
		     8 "

(fn STRING PRED ACTION)"]
	       :must-match confirm)
     server))
 '(sql-postgres-options '("-P" "pager=off" "-p 5431")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

