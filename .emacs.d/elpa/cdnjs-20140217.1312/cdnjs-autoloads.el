;;; cdnjs-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "cdnjs" "cdnjs.el" (21677 45277 0 0))
;;; Generated autoloads from cdnjs.el

(autoload 'cdnjs-install-gocdnjs "cdnjs" "\
Install `gocdnjs' command to `cdnjs/gocdnjs-bin-dir'.

wget and unzip commands are required to use this function.

\(fn)" t nil)

(autoload 'cdnjs-list-packages "cdnjs" "\
List packages that are retrieved from cdnjs.com.

\(fn)" t nil)

(autoload 'cdnjs-describe-package "cdnjs" "\
Describe the PACKAGE information.

\(fn)" t nil)

(autoload 'cdnjs-insert-url "cdnjs" "\
Insert URL of a JavaScript or CSS package.

\(fn)" t nil)

(autoload 'cdnjs-select-and-insert-url "cdnjs" "\
Select version and file of a JavaScript or CSS package, then insert URL.

\(fn)" t nil)

(autoload 'cdnjs-update-package-cache "cdnjs" "\
Update the package cache file.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; cdnjs-autoloads.el ends here
