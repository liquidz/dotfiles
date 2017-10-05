(defun copy-to-clipboard ()
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

(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (clipboard-yank)
    (insert (shell-command-to-string "xsel --clipboard --output"))))

;; mozc setting
;; C-\ で mozc モード
(set-language-environment  "Japanese")
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'echo-area)

;; clipboard setting
(evil-leader/set-key "o y" 'copy-to-clipboard)
(evil-leader/set-key "o p" 'paste-from-clipboard)
