;;This is needed for Erlang mode setup
(setq erlang-root-dir "/p/lib/erlang")
(setq load-path (cons "/p/lib/erlang/lib/tools-2.6.4/emacs" load-path))
(setq exec-path (cons "/p/lib/erlang/bin" exec-path))
(require 'erlang-start)

;;This is needed for Distel setup
(let ((distel-dir "/Users/dfayram/.emacs.d/manual/distel/elisp"))
 (unless (member distel-dir load-path)
   ; Add distel-dir to the end of load-path
   (setq load-path (append load-path (list distel-dir)))))

(require 'distel)
(distel-setup)

;;Some Erlang customizations
(add-hook 'erlang-mode-hook
	  (lambda ()
	    ;; when starting an Erlang shell in Emacs, default in the node name
	    (setq inferior-erlang-machine-options '("-sname" "emacs"))
	    ;; add Erlang functions to an imenu menu
	    (imenu-add-to-menubar "imenu")
      (yas/minor-mode-on)
      (define-key erlang-mode-map [f5] 'compile)
      (define-key erlang-mode-map (kbd "\C-c\C-dM") 'erlang-man-function)))

;;A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)	
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind) 
    ("\M-*"      erl-find-source-unwind) 
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
	  (lambda ()
	    ;; add some Distel bindings to the Erlang shell
	    (dolist (spec distel-shell-keys)
	      (define-key erlang-shell-mode-map (car spec) (cadr spec)))))
(setq erlang-indent-level 2)