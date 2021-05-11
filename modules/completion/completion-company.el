;;; company.el --- Installs and Configures Company
;;; Commentary:
;;; Code:
(use-package company
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)
  (company-mode))

(use-package company-box)
;;; completion-company.el ends here
