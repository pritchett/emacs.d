;;; core-mod.el --- Setup Core Emacs Features
;;; Commentary:
;; This module changes some core behaviors of Emacs.
;; Things like backup files, autosave files, customize variables, etc.
;;; Code:
;("core-signatures.el")
(setq suggest-key-bindings 5)
(load "core-path.el")

(use-package all-the-icons)

(when (equal system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

(when (member "Hack" (font-family-list))
  (add-to-list 'initial-frame-alist '(font . "Hack-12"))
  (add-to-list 'default-frame-alist '(font . "Hack-12")))
  ;; (when (member "Fira Code" (font-family-list))
  ;;   (add-to-list 'initial-frame-alist '(font . "Fira Code-14"))
  ;;   (add-to-list 'default-frame-alist '(font . "Fira Code-14")))
  ;; (set-fontset-font t 'symbol (font-spec :family "Apple Symbols") nil 'prepend)
  ;; (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend))
;(load "core-customize.el")
;(load "core-autosaves.el")
;(load "core-backups.el")
;(global-set-key (kbd "C-x C-b") 'ibuffer)
;(setq default-directory "~")
;(setq-default indent-tabs-mode nil)
(provide 'core-mod)
;;; core-mod.el ends here
