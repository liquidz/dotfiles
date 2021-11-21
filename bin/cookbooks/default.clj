(defn home
  [& [path]]
  (cond-> (dad/env :home)
    path (str "/" path)))

(defn install-dir
  [& [path]]
  (cond-> (home "src/github.com/liquidz/dotfiles")
    path (str "/" path)))

(def git-user {:name "liquidz" :email "liquidz.uo@gmail.com"})

;; git clone
(git {:path (install-dir)
      :url "https://github.com/liquidz/dotfiles"})

;; 必要なディレクトリを作成
(doseq [dir [".boot"
             ".config/nvim"
             ".lein"
             ".tags"
             ".config/karabiner/assets/complex_modifications"]]
  (directory (home dir)))

;; dotfiles のシンボリックリンクを貼る
(doseq [file [".boot/profile.boot"
              ".cheatrc"
              ".config/alacritty"
              ".config/efm-langserver"
              ".config/karabiner/assets/complex_modifications/mine.json"
              ".config/zeno"
              ".ctags"
              ".gemrc"
              ;; ".gitconfig.common"
              ;; ".gitignore_global"
              ".joker"
              ".lein/profiles.clj"
              ".rubocop.yml"
              ".spacemacs.d"
              ".tmux.conf"
              ".vim"
              ".vimrc"
              ".w3m"
              ".xkb"
              ".zsh"
              ".zshenv"
              ".zshrc"]]
  (link {:path (home file)
         :to (install-dir file)}))

;; vim の設定
(doseq [dir '[.vim/autoload .vim/backup .vim/memo]]
  (directory (home dir)))

(download {:path (home ".vim/autoload/plug.vim")
           :url "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"})

;; neovim の設定
(doseq [[k v] {".config/nvim/init.vim" ".vimrc"
               ".config/nvim/ftplugin" ".vim/ftplugin"
               ".config/nvim/coc-settings.json" ".vim/coc-settings.json"}]
  (link {:path (home k) :to (install-dir v)}))

;; zsh の設定
;;;; git 補完
(doseq [[k v] {".zsh/_git"                "git-completion.zsh"
               ".zsh/git-completion.bash" "git-completion.bash"}]
  (download
   {:path (home k)
    :url (str "https://raw.githubusercontent.com/git/git/master/contrib/completion/" v)}))

;;;; antigen
;; (git {:path (home "src/github.com/zsh-users/antigen")
;;       :url "https://github.com/zsh-users/antigen"})
;; zinit
(directory (home ".zinit"))
(git {:path (home ".zinit/bin")
      :url "https://github.com/zdharma-continuum/zinit"})


;; tmux の設定
(git {:path (home ".tmux/plugins/tpm")
      :url "https://github.com/tmux-plugins/tpm"})

;; git config
(execute
  {:command [(str "git config --global include.path " (install-dir ".gitconfig.common"))
             (str "git config --global core.excludesfile " (install-dir ".gitignore_global"))
             (str "git config --global user.name    " (:name git-user))
             (str "git config --global user.email   " (:email git-user))
             (str "git config --global commit.template " (install-dir ".gitmessage"))]
   :pre-not (str "test $(git config user.name) = " (:name git-user))})
