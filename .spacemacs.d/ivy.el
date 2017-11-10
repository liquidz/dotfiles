(require 'ivy)
(require 'counsel-projectile)

(define-key evil-normal-state-map "\C-p" 'counsel-projectile-find-file)

;; fuzzy matching
;; c.f. https://oremacs.com/2016/01/06/ivy-flx/
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

(defun my/delete-current-line ()
  (interactive)
  (beginning-of-line)
  (kill-line))

(define-key ivy-minibuffer-map "\C-u" 'my/delete-current-line)

(defun my/find-file-right (filename)
  (let ((new-buffer (find-file-noselect (expand-file-name filename)))
        (new-window (split-window-right)))
    (set-window-buffer new-window new-buffer)
    (select-window new-window)))

(defun my/find-file-below (filename)
  (let ((new-buffer (find-file-noselect (expand-file-name filename)))
        (new-window (split-window-below)))
    (set-window-buffer new-window new-buffer)
    (select-window new-window)))

(defun my/projectile-find-file-right (file)
  (let ((filename (projectile-expand-root file)))
    (my/find-file-right filename)
    (run-hooks 'projectile-find-file-hook)))

(defun my/projectile-find-file-below (file)
  (let ((filename (projectile-expand-root file)))
    (my/find-file-below filename)
    (run-hooks 'projectile-find-file-hook)))

(ivy-set-actions
 'counsel-projectile-find-file
 '(("v" my/projectile-find-file-right "split right")
   ("s" my/projectile-find-file-below "split below")))

(ivy-add-actions
 'find-file
 '(("v" my/find-find-right "split right")
   ("s" my/find-find-below "split below")))

(define-key ivy-minibuffer-map "\C-v" (kbd "M-o v"))
(define-key ivy-minibuffer-map "\C-s" (kbd "M-o s"))
