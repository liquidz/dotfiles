;; https://github.com/syl20bnr/spacemacs/pull/9547
;; https://github.com/syl20bnr/spacemacs/issues/9549
(require 'helm-bookmark)

;; vim-textobj-line 互換
(require 'evil-textobj-line)

;; magit
(setq-default git-magit-status-fullscreen t)

;; ウインドウ分割後のフォーカスをデフォルトにする
(define-key evil-window-map "v" 'split-window-right-and-focus)
(define-key evil-window-map "V" 'split-window-right)
(define-key evil-window-map "s" 'split-window-below-and-focus)
(define-key evil-window-map "S" 'split-window-below)

(setq my-translation-map
      '(("1" . "!") ("2" . "@") ("3" . "#") ("4" . "$") ("5" . "%")
        ("6" . "^") ("7" . "&") ("8" . "*") ("9" . "(") (";" . ":")))

(dolist (pair my-translation-map)
  (let ((from-key (kbd (car pair)))
        (to-key (kbd (cdr pair)))
        )
    (define-key key-translation-map from-key to-key)
    (define-key key-translation-map to-key from-key)))

;; evil-snipe
;; clever-f と同じような挙動を提供してくれる
(require 'evil-snipe)
(evil-snipe-override-mode 1)

;; magit
;; デフォルトの status が "gs" でちょっと押しづらいので
(spacemacs/set-leader-keys "gg" 'magit-status)

;; 環境毎の設定
(cond
 ;; for Windows
 ((eq system-type 'windows-nt))
 ;; for Mac
 ((eq system-type 'darwin))
 ;; for Linux
 ((eq system-type 'gnu/linux)
  (load-file "~/.spacemacs.d/linux.el")))
