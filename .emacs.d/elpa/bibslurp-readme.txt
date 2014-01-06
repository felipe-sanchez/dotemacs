Provides a function `bibslurp-query-ads', which reads a search
string from the minibuffer, sends the query to NASA ADS
(http://adswww.harvard.edu/), and displays the results in a new
buffer called "ADS Search Results".

The "ADS Search Results" buffer opens in `bibslurp-mode', which
provides a few handy functions.  Typing the number preceding an
abstract and hitting RET calls `bibslurp-slurp-bibtex', which
fetches the bibtex entry corresponding to the abstract and saves it
to the kill ring.  Typing 'a' instead pulls up the abstract page.
At anytime, you can hit 'q' to quit bibslurp-mode and restore the
previous window configuration.

Example usage:

add an entry to a bibtex buffer:
  M-x bibslurp-query-ads RET ^Quataert 2008
  1 RET
  q
  C-y

For more examples and information see the project page at
http://astro.berkeley.edu/~mkmcc/software/bibslurp.html

Notes about the implementation:

1. As far as I know, ADS doesn't have an API for searching its
  database, and emacs doesn't have functionality to parse html.
  Since I don't want to implement a browser in emacs lisp, that
  leaves me parsing the html pages with regexps.  While that would
  be a terrible idea under ordinary circumstances, the ADS pages
  are all automatically generated, so they should conform to a
  pretty regular format.  That gives me some hope...

2. There are many ways you can customize the behaviour of biblurp.
   I define font-lock faces at the beginning of the file so you can
   add these to your color theme.  I also run a mode hook at the
   end of `bibslurp-mode', so you can inject your own code at that
   point.

Installation:

Use package.el. You'll need to add MELPA to your archives:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

Alternatively, you can just save this file and do the standard
(add-to-list 'load-path "/path/to/bibslurp.el")
(require 'bibslurp)
