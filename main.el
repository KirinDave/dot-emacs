;;; Dave Fayram's Emacs setup.
;;; ~/.emacs -> (load "~/.emacs.d/main.el)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/manual")

(defun edit-my-preferences ()
  "Edits my local preferences."
  (interactive)
  (find-file 
   (expand-file-name "~/.emacs.d/main.el")))

(defun run-setup (setup-sym)
  "Loads a file in .emacs.d named \"symbol-setup.el\"."
  (let* ((sstr  (symbol-name setup-sym))
	 (fname (concat sstr "-setup.el")))
    (message (concat "Loading setup for " sstr))
    (load (expand-file-name fname "~/.emacs.d/"))))

(defconst my-setup-files
  '(theme lisp erlang org))

(dolist (s my-setup-files)
  (run-setup s))


; Some odds and ends that don't fit anywhere else
(define-key global-map "\C-xP" 'edit-my-preferences)
(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR.
  The CHAR is replaced and the point is put before CHAR."
  (insert char)
  (forward-char -1))

(require 'ido)
(ido-mode t)

