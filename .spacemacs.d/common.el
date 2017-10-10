;; bind <C-h> as Backspace
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "<F1>") help-map)

;(global-set-key (kbd "C-p") 'helm-projectile-find-file)
;(global-set-key (kbd "<F2>") 'evil-paste-pop)

;; magit
(setq-default git-magit-status-fullscreen t)

;; evil-snipe
;; clever-f と同じような挙動を提供してくれる
(require 'evil-snipe)
(evil-snipe-override-mode 1)

;; migemo
;; これをいれると日本語の文字化けがなぜか直る
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(migemo-init)
