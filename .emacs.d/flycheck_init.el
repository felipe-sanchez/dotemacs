
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)
(setq-default cursor-type 'box)


;; Support for more advanced HTML editing
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; Autocomplete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)


;; Saner defaults for Emacs
(require 'graphene)
;; Loads ESS; use M-x R to start R shell
(require 'ess-site)
;; Loads magit; use M-x magit-status
(require 'magit)

;; Smartscan, jump between instances of symbol at cursor
;; use M-n M-p to jump forward/backward
(require 'smartscan)
(global-smartscan-mode 1)


;; Add some custom key-binding for Mac OS X
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-[") 'previous-buffer)
(global-set-key (kbd "s-]") 'next-buffer)
(global-set-key (kbd "s-r") 'replace-string)
(global-set-key (kbd "s-.") 'imenu-anywhere)
(global-set-key (kbd "s-\\") 'magit-status)
(global-set-key [C-tab] 'other-window)

;; Start server to use emacs GUI from command line
(server-start)

;; Use js2-mode as default javascript mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(defvar js2-my-global-externs '("it" "loadFixtures" "expect" "describe" "beforeEach" "spyOn" "jasmine"
                            "$" "$j" "Mustache" "jQuery" "_" "qcloud" "Nulogy" "qc" "Backbone" "JST"
                            "afterEach" "setFixtures" "require" "Handlebars" "exports" "todo" "setTimeout"
                            "clearTimeout" "setInterval" "clearInterval" "runs" "waits" "module" "Marionette"
                            "Ember" "angular" "process" "__dirname" "define" "sinon" "before" "after" "chai"
                            "moment" "location"))
(require 'ac-js2)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Activate tramp; C-x C-f /ssh:user@server etc.
(require 'tramp)

(package-initialize)

;; Enables python mode
(elpy-enable)
;; Uses ipython as shell. C-c C-z to switch to shell; C-c C-c to run current file
(elpy-use-ipython)

;; Enable EIN; M-x notebook-list
(require 'ein)
(setq ein:use-auto-complete t)


;; Projectile; use together with project-persist (C-c P f)
(require 'projectile)
(projectile-global-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (graphene)))
 '(custom-safe-themes (quote ("5a1a016301ecf6874804aef2df36ca8b957443b868049d35043a02a0c1368517" default)))
 '(elpy-rpc-backend "jedi")
 '(flycheck-clang-include-path (quote ("/opt/local/include")))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(graphene-default-font "Menlo-14")
 '(js2-global-externs js2-my-global-externs)
 '(save-place t nil (saveplace))
 '(sr-speedbar-auto-refresh t)
 '(sr-speedbar-delete-windows t)
 '(sr-speedbar-right-side t)
 '(tool-bar-mode nil)
 '(user-mail-address "stefano.meschiari@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Menlo")))))



