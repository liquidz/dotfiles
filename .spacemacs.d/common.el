;; bind <C-h> as Backspace
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd"<F1>") help-map)

;; https://github.com/syl20bnr/spacemacs/pull/9547
;; https://github.com/syl20bnr/spacemacs/issues/9549
(require 'helm-bookmark)

;; vim-textobj-line 互換
(require 'evil-textobj-line)

;; magit
(setq-default git-magit-status-fullscreen t)

;; evil-snipe
;; clever-f と同じような挙動を提供してくれる
(require 'evil-snipe)
(evil-snipe-override-mode 1)

;; 環境毎の設定
(cond
 ;; for Windows
 ((eq system-type 'windows-nt))
 ;; for Mac
 ((eq system-type 'darwin))
 ;; for Linux
 ((eq system-type 'gnu/linux)
  (load-file "~/.spacemacs.d/linux.el")))
