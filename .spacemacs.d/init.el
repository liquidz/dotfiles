;; -*- mode: emacs-lisp -*-
(setq my-user-configs
      '("common" "clojure" "backspace"))

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.

   dotspacemacs-configuration-layers '(
                                       japanese
                                       javascript
                                       ruby
                                       helm
                                       auto-completion
                                       ;; better-defaults
                                       emacs-lisp
                                       git
                                       markdown
                                       plantuml
                                       org
                                       (shell :variables
                                              shell-default-height 30
                                              shell-default-position 'bottom)
                                       ;;spell-checking
                                       syntax-checking
                                       version-control
                                       clojure
                                       )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      sourcerer-theme
                                      mozc
                                      evil-snipe
                                      quickrun
                                      migemo
                                      perspeen
                                      hydra
                                      (evil-textobj-line :location (recipe :fetcher github :repo "syohex/evil-textobj-line"))
                                      )


   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only
   ))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(
                         ;spacemacs-dark
                         sourcerer
                         )
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '(
                               "Source Han Code JP R" :size 12
                               ;"Cica" :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ";"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5

   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always

   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90

   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t

   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  )

(defmacro ilambda (bindings &rest body)
  "lambda with (interactive)"
  `(lambda ,bindings
     (interactive) ,@body))

(defun dotspacemacs/user-config ()
  (dolist (name my-user-configs)
    (load-file
     (format "~/.spacemacs.d/%s.el" name)))

  ;; perspeen
  (defun my/create-tab ()
    (interactive)
    ;; MARKER に 0 をセットすることで、ウインドウ分割している状態でも
    ;; タブを作った際にウインドウの分割状態が新しいタブに引き継がれない
    ;; なぜかはよくわからない
    (perspeen-tab-create-tab (current-buffer) 0))

  (use-package perspeen
    :ensure t
    :init (setq perspeen-use-tab t)
    :config (progn
              (perspeen-mode)
              (define-prefix-command 'my/perspeen-tab-map)
              (define-key my/perspeen-tab-map "n" 'my/create-tab)
              (define-key my/perspeen-tab-map "l" 'perspeen-tab-next)
              (define-key my/perspeen-tab-map "h" 'perspeen-tab-prev)
              (define-key my/perspeen-tab-map "q" 'perspeen-tab-del)
              (define-key evil-normal-state-map "t" 'my/perspeen-tab-map)))

  ;; (defun my/mark-word ()
  ;;   (evil-inner-symbol)
  ;;   )

  ;; hydra
  ;; vim-submode 的なことができる
  (require 'hydra)
  (defhydra hydra-control-window ()
    "control window"
    ("l" evil-window-right)
    ("h" evil-window-left)
    ("k" evil-window-up)
    ("j" evil-window-down)
    (">" (ilambda () (evil-window-increase-width 5)))
    ("<" (ilambda () (evil-window-decrease-width 5)))
    ("+" (ilambda () (evil-window-increase-height 5)))
    ("-" (ilambda () (evil-window-decrease-height 5))))
  ;; C-w C-w でウインドウ操作モード
  (define-key evil-window-map "\C-w" 'hydra-control-window/body)

  ;(buffer-list)
  ;(current-buffer)

  ;(cider-switch-to-repl-buffer)
  ;(cider--swi)

  ;(defhydra hydra-zoom (global-map "<f2>")
  ;  "zoom"
  ;  ("k" text-scale-increase "in")
  ;  ("j" text-scale-decrease "out")
  ;  )


  ;; Disable mouse control
  ;(dolist (mouse '("<down-mouse-1>" "<mouse-1>"))
  ;  (global-unset-key (kbd mouse)))

  ;; helm
  (require 'helm)
  (require 'helm-types)
  (require 'helm-projectile)

  ;; (defun my/helm-switch-other-window-vertically ()
  ;;   (interactive)
  ;;   (with-helm-alive-p
  ;;     (helm-exit-and-execute-action
  ;;      (lambda (candidate)
  ;;        (let ((split-height-threshold nil)
  ;;              (split-width-threshold 0))
  ;;          (helm-find-files-other-window candidate))))))

  (defun my/helm-switch-other-window-vertically ()
    (interactive)
    (setq-local split-height-threshold nil)
    (setq-local split-width-threshold 0)
    (helm-ff-run-switch-other-window))

  ; ctrlp の再現
  (define-key evil-normal-state-map "\C-p"
    'helm-projectile-find-file)
  (define-key helm-find-files-map "\C-w"
    'my/helm-switch-other-window-vertically)

  (define-key helm-projectile-find-file-map "\C-w"
    'my/helm-switch-other-window-vertically)
  ;(define-key helm-buffer-map (kbd "C-w")
  ;  'helm-buffer-switch-other-window)
  ; swoop
  (setq helm-swoop-use-fuzzy-match t)
  ;(defun my/clear-line ()
  ;  (goto-char 1)
  ;  ;; (delete-region (line-beginning-position) (line-end-position))
  ;  )
  ;;(define-key helm-map (kbd "C-u") 'my/clear-line)

  ;; (defun my/do-something (filename)
  ;;   (interactive "Foo Bar: ")
  ;;   (shell-command (format "stat %s" (shell-quote-argument filename))
  ;;                  "*Stat*"))
  ;; (setq helm-type-file-actions
  ;;       (append helm-type-file-actions '(("Stat" . my/do-something))))

  ;; (setq my/zoufu-prefixes '(handler view service))
  ;; (defn my/switch-zoufu-files ()
  ;;   )
  ;; (helm :sources
  ;;       (helm-build-sync-source "test1"
  ;;         :candidates '(aaa bbb ccc ddd))
  ;;       :buffer
  ;;       "*helm sync source test*")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(open-junk-file-format "/home/uochan/.emacs.d/.cache/junk/%Y/%m/%d." t)
 '(package-selected-packages
   (quote
    (xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help flycheck-pos-tip pos-tip flycheck plantuml-mode evil-textobj-line perspeen avy-migemo pangu-spacing japanese-holidays evil-tutor-ja ddskk cdb ccc migemo quickrun evil-snipe org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter evil-magit magit magit-popup git-commit with-editor diff-hl mozc web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text mmm-mode markdown-toc markdown-mode macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gh-md fuzzy flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree elisp-slime-nav dumb-jump f dash diminish define-word company-statistics company column-enforce-mode clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit s peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup sourcerer-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#c2c2b0" :background "#222222"))))
 '(perspeen-tab--header-line-active ((t (:inherit default :background "deep sky blue" :foreground "black")))))
