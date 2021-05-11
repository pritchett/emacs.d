;;; scala.el --- Setup scala with metals
;;; Commentary:
;;; Code:
; Enable defer and ensure by default for use-package
;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
(defvar use-package-always-defer)
(defvar use-package-always-ensure)
(setq use-package-always-defer t
      use-package-always-ensure t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;; Enable scala-mode for highlighting, indentation and motion commands
(defvar lsp-metals-show-inferred-type)
(use-package scala-mode
  :hook (scala-mode . yas-minor-mode)
  (scala-mode . company-box-mode)
  (scala-mode . linum-mode)
  :config (setq lsp-metals-show-inferred-type t)
  :bind ("s-i" . lsp-ui-imenu)
  :interpreter
    ("scala" . scala-mode))

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
)

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :init (global-flycheck-mode))

;; Add metals backend for lsp-mode
(use-package lsp-metals
  :config (setq lsp-metals-treeview-show-when-views-received nil)) ;; Setting nil here because of a bug

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
;;; lang-scala.el ends here
