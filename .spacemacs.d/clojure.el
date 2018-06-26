(require 'clojure-mode)

(dolist (mode-name '(clojure-mode clojurescript-mode clojurec-mode))
  ;; eval inner list
  (spacemacs/set-leader-keys-for-minor-mode
    mode-name "ei"
    'eval-sexp-fu-cider-eval-sexp-inner-list)

  ;; eval outer list
  ;; 元々の ,ef が慣れないのでエイリアス
  (spacemacs/set-leader-keys-for-minor-mode
    mode-name "et"
    'cider-eval-defun-at-point))

;; paredit
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojurescript-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

;; aggressive indent
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojurescript-mode-hook #'aggressive-indent-mode)
(add-hook 'cider-repl-mode-hook #'aggressive-indent-mode)

;;  (define-clojure-indent
;;    (go-loop-sub 3))

(define-clojure-indent (core-let 1))

;;(setq cider-cljs-lein-repl
;;      (concat
;;        "" ;; cider-cljs-lein-repl
;;        "(do (require 'figwheel-sidecar.repl-api)
;;         (figwheel-sidecar.repl-api/start-figwheel!)
;;         (figwheel-sidecar.repl-api/cljs-repl))"))

;; toggle src/test code rapidly
(defun my/toggle-src-test-file ()
  (interactive)
  (let ((ns (cider-current-ns)))
    (let ((toggled-ns (if (string-match "-test$" ns)
                          (replace-regexp-in-string "-test$" "" ns)
                        (format "%s-test" ns))))
      (message "DEBUG: %s" toggled-ns)
      ;; (cider-find-ns "" toggled-ns)
      )))

(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "gt" 'my/toggle-src-test-file)

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

(defun my/go ()
  (interactive)
  (with-current-buffer (cider-current-connection "clj")
    (cider-interactive-eval "(go)")))

(defun my/reset ()
  (interactive)
  (with-current-buffer (cider-current-connection "clj")
    (save-some-buffers)
    (cider-interactive-eval "(reset)")))

(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "go" 'my/go)
(spacemacs/set-leader-keys-for-minor-mode
  'clojure-mode "gO" 'my/reset)
