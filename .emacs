(setq inferior-lisp-program "sbcl")
(add-to-list 'load-path "/home/noselasd/slime")
(set-variable 'scheme-program-name "scheme48")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Switch to interactive Scheme buffer." t)
(prefer-coding-system 'utf-8-unix)
(transient-mark-mode t)
(put 'erase-buffer 'disabled nil)
(global-set-key "\C-q" 'ucs-insert)

(defun enable-paren-key ()
  (global-set-key "%" 'match-paren)
  (defun match-paren (arg)
    "Go to the matching paren if on a paren; otherwise insert %."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	  ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	  (t (self-insert-command (or arg 1))))))

(defun my-lisp-mode ()
  (enable-paren-key))

(defun my-start-slime ()
  (require 'slime)  
  (slime-setup)
  (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
  (define-key slime-mode-map [f1] 'slime-hyperspec-lookup)
  (define-key slime-repl-mode-map [f1] 'slime-hyperspec-lookup)
  (define-key slime-mode-map [f8] 'slime-eval-buffer)
  (define-key slime-mode-map [f9] 'slime-eval-last-expression-display-output)
					;(define-key slime-mode-map [f11] (lambda () (interactive) (insert "(")))
  ;;(define-key slime-mode-map [f12] (lambda () (interactive) (insert ")")))
  (define-key slime-mode-map [C-return] 'slime-close-all-sexp)
  (my-lisp-mode))
  

(add-hook 'scheme-mode-hook
	  '(lambda () (my-lisp-mode)))
