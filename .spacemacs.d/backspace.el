;;; 特定のキーバインドで Backspace を再現する設定
(setq my/bs-key "\C-h")

(global-set-key my/bs-key 'delete-backward-char)
(global-set-key (kbd"<F1>") help-map)

;; / での検索時
(define-key isearch-mode-map my/bs-key 'isearch-delete-char)

;; helm
(require 'helm)
(define-key helm-map my/bs-key 'delete-backward-char)

;; Company
;; 補完候補が表示されている場合
(require 'company)
(define-key company-active-map my/bs-key 'delete-backward-char)
(define-key company-search-map my/bs-key 'delete-backward-char)
