;; mega-simple bbcode mode (font-lock only) by Azundris, 2009/05/10

(provide 'bbcode)

(defun bbcode-mode ()
  "Major mode for editing bbcode."
  (interactive)

  (kill-all-local-variables)

  (setq major-mode 'bbcode-mode)
  (setq mode-name "bbcode")

  (setq truncate-lines nil)
  (customize-set-variable (quote truncate-lines) truncate-lines)

  (setq font-lock-keywords
                 '(
                   ("\\[\\/?\\([^]]+\\)\\]"      0 font-lock-keyword-face t)
                   ("\\[i\\]\\(.*?\\)\\[\\/i\\]" 1 italic t)
                   ("\\[b\\]\\(.*?\\)\\[\\/b\\]" 1 bold t)
                   ("\\[u\\]\\(.*?\\)\\[\\/u\\]" 1 underline t)
                   ("\\[quote\\(=[^]]*\\)?\\]\\(.*?\\)\\[\\/quote\\]" 0 font-lock-doc-string-face    t)
                   ("\\[url\\(=[^]]*\\)?\\]\\(.*?\\)\\[\\/url\\]" 0 font-lock-reference-face    t)

                   ("[\t ]+$"           0 whitespace-visual-blank-face t)
                   ("[\t]+"             0 whitespace-visual-tab-face   t)
                   ))

  (require 'flyspell)
; (flyspell-mode 0)   ;; disable, we do some magic of our own!
  (flyspell-mode 1)

  (font-lock-mode 1)

; (local-set-key (kbd   "H-q") 'unfill-paragraph-mush)

  (run-hooks 'bbcode-mode-hook))

;; ends
