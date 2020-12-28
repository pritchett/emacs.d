;;; core-path.el --- Configures How to Set Path in Emacs
;;; Commentary:
;;; Code:
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  (when (daemonp)     (exec-path-from-shell-initialize)))

;;; core-path.el ends here
