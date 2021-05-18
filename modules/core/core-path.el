;;; core-path.el --- Configures How to Set Path in Emacs
;;; Commentary:
;;; Code:
(use-package exec-path-from-shell
  :demand
  :config
  (when (or (memq window-system '(mac ns x)) (daemonp))
    (exec-path-from-shell-initialize)))
;;; core-path.el ends here
