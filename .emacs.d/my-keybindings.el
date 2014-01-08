;; Stefano's my-keybindings
;;
;; Declare some useful keybindings

;; Add some custom key-binding for Mac OS X
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-[") 'previous-buffer)
(global-set-key (kbd "s-]") 'next-buffer)
(global-set-key (kbd "s-r") 'replace-string)
(global-set-key (kbd "s-.") 'imenu-anywhere)
(global-set-key (kbd "s-\\") 'magit-status)
(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "s-_") 'text-scale-decrease)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "s-F") 'anything-occur)
(global-set-key (kbd "s-X") 'smex)
(global-set-key (kbd "<s-left>") 'beginning-of-visual-line)
(global-set-key (kbd "<s-right>") 'end-of-visual-line)
(global-set-key (kbd "<s-up>") 'beginning-of-buffer)
(global-set-key (kbd "<s-down>") 'end-of-buffer)
(global-set-key (kbd "s-w") 'kill-default-buffer)

;; Don't open dialogs on Mac OS X
(global-set-key (kbd "s-o") 'ido-find-file)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-S") 'ido-write-file)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'my-keybindings)

