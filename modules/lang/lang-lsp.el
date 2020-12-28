;;; lang-lsp --- Install and configure integration with language server protocol
;;; Commentary:
;;; Code:

(defvar lsp-keymap-prefix)
(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode
  :hook  (scala-mode . lsp)
         (lsp-mode . lsp-lens-mode)
         (lsp-mode . lsp-enable-which-key-integration)
	 :commands lsp
	 :bind-keymap ("C-c l" . lsp-command-map)
	
  )

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)


;;; lang-lsp.el ends here

