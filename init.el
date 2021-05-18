;;; init.el --- Emacs setup entry point
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)

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

(setq use-package-always-ensure t
      use-package-always-defer t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(load-theme 'monokai t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (global-linum-mode 1) ; Switch to line number mode
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

(require 'server)
(unless (server-running-p) (server-start))
;;; init.el ends here

(use-package nnreddit)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" default))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(magit-diff-use-overlays nil)
 '(nnreddit-python-command "python3")
 '(package-selected-packages
   '(helpful solarized-theme forge nnreddit treemacs-icons-dired treemacs-magit treemacs-projectile treemacs-all-the-icons god-mode makefile-executor kubel magit counsel-projectile projectile csv-mode lsp-metals flycheck sbt-mode scala-mode lsp-treemacs lsp-ivy lsp-ui lsp-mode exec-path-from-shell yasnippet-snippets yasnippet which-key counsel company-box company-lsp company use-package monokai-theme diminish))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
