;; eval inner list
(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "ei"
  'eval-sexp-fu-cider-eval-sexp-inner-list)

;; paredit
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

;; zou
(defun my/zou-go ()
  (interactive)
  (with-current-buffer (cider-current-connection "clj")
    (if current-prefix-arg
        (progn
          (save-some-buffers)
          (cider-interactive-eval "(zou.framework.repl/reset)"))
      (cider-interactive-eval "(zou.framework.repl/go)"))))

(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "zo" 'my/zou-go)
