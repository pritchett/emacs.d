;;; helpful --- Summary:
;;; Commentary:
;;; Code:
(use-package helpful
  :config (global-set-key (kbd "C-h f") 'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))
(provide 'utils-helpful)
;;; utils-helpful.el ends here
