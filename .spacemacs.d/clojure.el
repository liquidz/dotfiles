;; eval inner list
(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "ei"
  'eval-sexp-fu-cider-eval-sexp-inner-list)

;; eval outer list
;; 元々の ,ef が慣れないのでエイリアス
(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "et"
  'cider-eval-defun-at-point)

;; paredit
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

;; zou
;; (setq my/zoufu-prefixes '(handler view service))

;; (defun my/zoufu--select-prefix ()
;;   (helm :sources
;;         (helm-build-sync-source "zoufu prefixes"
;;           :candidates my/zoufu-prefixes)
;;         :buffer
;;         "*zoufu prefixes*"))


;; (defun my/replace-namespace (ns prefix)
;;   (if (string-match "^\\([^.]+\\)\.\\([^.]+\\)\.\\(.+\\)$" ns)
;;       (let ((head (match-string 1 ns))
;;             (tail (match-string 3 ns)))
;;         (format "%s.%s.%s" head prefix tail))))

;; (defun my/namespace-to-path (ns)
;;   (format "%s%s.clj"
;;           (projectile-project-root)
;;           (replace-regexp-in-string "\\." "/" ns))
;;   )

;; (projectile-project-root)
;; ;; (setq s "foo.handler.iizuka")
;; ;; (my/replace-namespace "foo.handler.iizuka" "view")
;; (my/namespace-to-path "foo.handler.iizuka")

;; (defun my/zoufu-switch-files ()
;;   (interactive)
;;   (let ((prefix (my/zoufu--select-prefix)))
;;     (message "[%s]"
;;              (my/namespace-to-path
;;               (my/replace-namespace
;;                (cider-current-ns) prefix)))
;;     )
;;   )

(defun my/zoufu-go ()
  (interactive)
  (with-current-buffer (cider-current-connection "clj")
    (if current-prefix-arg
        (progn
          (save-some-buffers)
          (cider-interactive-eval "(zou.framework.repl/reset)"))
      (cider-interactive-eval "(zou.framework.repl/go)"))))

(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "zo" 'my/zoufu-go)
