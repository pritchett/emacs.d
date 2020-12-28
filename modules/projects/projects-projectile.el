;;; projects-projectile.el --- Install and Configure Projectile Packages
;;; Commentary:
;;; Code:
(use-package projectile
  :init (projectile-mode 1)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package counsel-projectile
  :after (projectile)
  :config   (counsel-projectile-mode)
  )

;;; projects-projectile.el ends here
