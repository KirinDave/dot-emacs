(require 'paredit)
(setq scheme-mode-hook
      '(lambda () (paredit-mode +1)))
(setq emacs-lisp-mode-hook
      '(lambda () (paredit-mode +1)))

(setq clojure-mode-hook
      '(lambda ()
         (paredit-mode +1)))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'clojure-mode)
(setq clojure-inferior-lisp-program "clojure")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode)
                              '("\\.clj$" . slime-mode))