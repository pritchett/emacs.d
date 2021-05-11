;;; lang-lsp --- Install and configure integration with language server protocol
;;; Commentary:
;;; Code:

(defvar lsp-keymap-prefix)
(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode
  :hook  (lsp-mode . lsp-lens-mode)
         (lsp-mode . lsp-enable-which-key-integration)
	 :commands lsp
	 :bind-keymap ("C-c l" . lsp-command-map)
	
  )



;; Enable nice rendering of documentation on hover
(use-package lsp-ui)

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)


;;; lang-lsp.el ends here

