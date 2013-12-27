
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
(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "s-_") 'text-scale-decrease)


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

(require 'smooth-scroll)

;; Projectile; use together with project-persist (C-c P f)
(require 'projectile)
(projectile-global-mode)

;; Recentf; use with C-x f
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'anything-recentf)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(ansi-term-color-vector [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"])
 '(background-color "white")
 '(background-mode dark)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cursor-color "#cccccc")
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "e58e9052d5380946ef7397f0248563ccd69a467362f513765d4afd2c2f5aafe6" "7dd17c354cfb6b46a70eeb19e1e64f8bdaec474c64f890617b6e76f0d8665514" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "cea6d15a8333e0c78e1e15a0524000de69aac2afa7bb6cf9d043a2627327844e" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "a30d5f217d1a697f6d355817ac344d906bb0aae3e888d7abaa7595d5a4b7e2e3" "e49b9cfa39ce92b424a30cbd74386a5fcb854195cf1a8e18536388cbc2179bf6" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "70fecb7e435889b7d0df23246b4c94343b7ed03bca0367e8e50787a8f85866d7" "2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" "65ae93029a583d69a3781b26044601e85e2d32be8f525988e196ba2cb644ce6a" "710446afa9aea3758320ed972d79195bb13c45a11bbf407b5b577d0e7eda0ca3" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "86f4407f65d848ccdbbbf7384de75ba320d26ccecd719d50239f2c36bec18628" "fc2782b33667eb932e4ffe9dac475f898bf7c656f8ba60e2276704fabb7fa63b" "91b5a381aa9b691429597c97ac56a300db02ca6c7285f24f6fe4ec1aa44a98c3" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "29a4267a4ae1e8b06934fec2ee49472daebd45e1ee6a10d8ff747853f9a3e622" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "e80a0a5e1b304eb92c58d0398464cd30ccbc3622425b6ff01eea80e44ea5130e" "0d553fda3eaa6ba8d831aabbb389d6ae0b32f1c83769296ee74d7140493be2f1" "821af11eb274545d40c3a6cd5a43f37099e720889c39e398e5e4b0c84648d398" "70cf411fbf9512a4da81aa1e87b064d3a3f0a47b19d7a4850578c8d64cac2353" "8eef22cd6c122530722104b7c82bc8cdbb690a4ccdd95c5ceec4f3efa5d654f5" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "5a1a016301ecf6874804aef2df36ca8b957443b868049d35043a02a0c1368517" default)))
 '(elpy-rpc-backend "jedi")
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#eee8d5")
 '(flycheck-clang-include-path (quote ("/opt/local/include")))
 '(foreground-color "#cccccc")
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(graphene-default-font "Consolas-16")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(js2-global-externs js2-my-global-externs)
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(powerline-color1 "#3d3d68")
 '(powerline-color2 "#292945")
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(smooth-scroll-mode t)
 '(sr-speedbar-auto-refresh t)
 '(sr-speedbar-delete-windows t)
 '(sr-speedbar-right-side t)
 '(syslog-debug-face (quote ((t :background unspecified :foreground "#2aa198" :weight bold))))
 '(syslog-error-face (quote ((t :background unspecified :foreground "#dc322f" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#859900"))))
 '(syslog-info-face (quote ((t :background unspecified :foreground "#268bd2" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#b58900"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#d33682"))))
 '(syslog-warn-face (quote ((t :background unspecified :foreground "#cb4b16" :weight bold))))
 '(tool-bar-mode nil)
 '(user-mail-address "stefano.meschiari@gmail.com")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#CF4F1F") (60 . "#C26C0F") (80 . "#b58900") (100 . "#AB8C00") (120 . "#A18F00") (140 . "#989200") (160 . "#8E9500") (180 . "#859900") (200 . "#729A1E") (220 . "#609C3C") (240 . "#4E9D5B") (260 . "#3C9F79") (280 . "#2aa198") (300 . "#299BA6") (320 . "#2896B5") (340 . "#2790C3") (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#FFFFFF" :foreground "#333333" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "apple" :family "Menlo")))))

(set-cursor-color "black")













