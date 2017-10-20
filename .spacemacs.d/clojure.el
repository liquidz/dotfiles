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
(setq my/zoufu-prefixes '(handler view service schema view))
(defun my/zoufu-select-prefix ()
  (helm :sources
        (helm-build-sync-source "zoufu prefixes"
          :candidates my/zoufu-prefixes)
        :buffer
        "*zoufu prefixes*"))

(defun my/replace-namespace (ns prefix)
  (if (string-match "^\\([^.]+\\)\.\\([^.]+\\)\.\\(.+\\)$" ns)
      (let ((head (match-string 1 ns))
            (tail (match-string 3 ns)))
        (format "%s.%s.%s" head prefix tail))))

(defun my/zoufu-switch-files ()
  (interactive)
  (let ((prefix (my/zoufu-select-prefix)))
    (cider-find-ns "" (my/replace-namespace (cider-current-ns) prefix))))

;; (defun my/zoufu-go ()
;;   (interactive)
;;   (with-current-buffer (cider-current-connection "clj")
;;     (if current-prefix-arg
;;         (progn
;;           (save-some-buffers)
;;           (cider-interactive-eval "(zou.framework.repl/reset)"))
;;       (cider-interactive-eval "(zou.framework.repl/go)"))))


(defun my/zoufu-go ()
  (interactive)
  (with-current-buffer (cider-current-connection "clj")
    (cider-interactive-eval "(zou.framework.repl/go)")))

(defun my/zoufu-reset ()
  (interactive)
  (with-current-buffer (cider-current-connection "clj")
    (save-some-buffers)
    (cider-interactive-eval "(zou.framework.repl/reset)")))

(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "zo" 'my/zoufu-go)
(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "zO" 'my/zoufu-reset)

(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "zz" 'my/zoufu-switch-files)

(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "rsn" 'clojure-sort-ns)
