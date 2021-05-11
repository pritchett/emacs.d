;;; projects-treemacs.el --- Install and Configure Treemacs Packages
;;; Commentary:
;;; Code:
(use-package treemacs
  :ensure t
  :bind (:map global-map ([f8] . treemacs)
	      ("C-<f8>" . treemacs-select-window))
  :config (setq treemacs-is-never-other-window t)
  )

(use-package treemacs-all-the-icons)

(use-package lsp-treemacs
  :after (treemacs)
  :config (setq lsp-treemacs-sync-mode t)
  )

(use-package treemacs-projectile
  :after projectile
  )

(use-package treemacs-magit
  :after magit
  )

(use-package treemacs-icons-dired
  :after treemacs dired
  :config (treemacs-icons-dired-mode)
  )
;;; projects-treemacs.el ends here
