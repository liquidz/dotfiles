(require 'helm)
(require 'helm-types)
(require 'helm-projectile)

(defun my/helm-switch-other-window-vertically ()
  (interactive)
  (setq-local split-height-threshold nil)
  (setq-local split-width-threshold 0)
  (helm-ff-run-switch-other-window))

;; ctrlp の再現
(define-key evil-normal-state-map "\C-p"
  'helm-projectile-find-file)

(setq helm-swoop-use-fuzzy-match t)

(defun my/delete-current-line ()
  (interactive)
  (beginning-of-line)
  (kill-line))

(define-key helm-find-files-map "\C-u" 'my/delete-current-line)
(define-key helm-projectile-find-file-map "\C-u" 'my/delete-current-line)
(define-key helm-grep-map "\C-u" 'my/delete-current-line)

(defmacro helm-define-action-key (keymap key def)
  `(define-key ,keymap ,key
     (lambda ()
       (interactive)
       (with-helm-alive-p
         (helm-quit-and-execute-action ,def)))))

(defun my/find-file-right-action (filename)
  (interactive)
  (let ((new-buffer (find-file-noselect (expand-file-name filename)))
        (new-window (split-window-right)))
    (set-window-buffer new-window new-buffer)
    (select-window new-window)))

(defun my/find-file-below-action (filename)
  (interactive)
  (let ((new-buffer (find-file-noselect (expand-file-name filename)))
        (new-window (split-window-below)))
    (set-window-buffer new-window new-buffer)
    (select-window new-window)))

(helm-define-action-key helm-find-files-map "\C-v" 'my/find-file-right-action)
(helm-define-action-key helm-find-files-map "\C-s" 'my/find-file-below-action)
(helm-define-action-key helm-projectile-find-file-map "\C-v" 'my/find-file-right-action)
(helm-define-action-key helm-projectile-find-file-map "\C-s" 'my/find-file-below-action)
