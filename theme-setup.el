(add-to-list 'load-path "~/.emacs.d/manual/color-theme")
(require 'color-theme)
(eval-after-load 'color-theme
  (progn (color-theme-initialize)
	 (color-theme-charcoal-black)))