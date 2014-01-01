;; Stefano's my-org-mode
;;

;; Open .org files in org-mode automatically

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Org-mode keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(provide 'my-org-mode)

