;;; core-mod.el --- Setup Core Emacs Features
;;; Commentary:
;; This module changes some core behaviors of Emacs.
;; Things like backup files, autosave files, customize variables, etc.
;;; Code:
;("core-signatures.el")
(setq suggest-key-bindings 5)
(load "core-path.el")
;(load "core-customize.el")
;(load "core-autosaves.el")
;(load "core-backups.el")
;(global-set-key (kbd "C-x C-b") 'ibuffer)
;(setq default-directory "~")
;(setq-default indent-tabs-mode nil)
(provide 'core-mod)
;;; core-mod.el ends here
