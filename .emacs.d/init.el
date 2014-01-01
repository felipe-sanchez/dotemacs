;; Stefano's init.el
;;
;; Some settings from https://github.com/magnars/.emacs.d/

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Start server to use Emacs GUI from command line
(server-start)

;; Appearance settings
(require 'my-appearance)
;; Loads and set up general settings (e.g. autocomplete, undo, etc.)
(require 'my-packages)

;; Language settings
(require 'my-c-mode)
(require 'my-org-mode)
(require 'my-web-mode)
(require 'my-r-mode)
(require 'my-js2-mode)
(require 'my-python-mode)
(require 'my-lua-mode)

;; Keybindings
(require 'my-keybindings)

(setq custom-file (expand-file-name "my-custom.el" user-emacs-directory))
(load custom-file)
