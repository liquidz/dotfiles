(defun my/copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard")
        (call-interactively 'clipboard-kill-ring-save))
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel --clipboard --input")
          (message "Yanked region to xsel")
          (deactivate-input-method)))))

(defun my/paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (clipboard-yank)
    (insert (shell-command-to-string "xsel --clipboard --output"))))

;; mozc setting
;; C-\ で mozc モード
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'echo-area)
;; これがあると一部のファイルで文字化けする
;; c.f. https://masutaka.net/chalow/2009-07-09-1.html
;; (set-language-environment  "Japanese")

;; clipboard setting
(evil-leader/set-key "o y" 'my/copy-to-clipboard)
(evil-leader/set-key "o p" 'my/paste-from-clipboard)
