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
(doseq [dir [".boot" ".config/nvim" ".lein" ".tags" ".config/karabiner/assets/complex_modifications"]]
  (directory (home dir)))

;; dotfiles のシンボリックリンクを貼る
(doseq [file [".boot/profile.boot"
               ".cheatrc" ".config/efm-langserver" ".ctags"
               ".gemrc" ".gitconfig.common"
               ".joker"
               ".lein/profiles.clj"
               ".rubocop.yml"
               ".spacemacs.d"
               ".tmux.conf"
               ".vim" ".vimrc"
               ".w3m"
               ".xkb"
               ".zsh" ".zshenv" ".zshrc" ".zshrc.antigen"
               ".config/karabiner/assets/complex_modifications/mine.json"]]
  (link {:path (home file)
         :to (install-dir file)}))

;; vim の設定
(doseq [dir '[.vim/autoload .vim/backup .vim/memo]]
  (directory (home dir)))

(download {:path (home ".vim/autoload/plug.vim")
           :url "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"})

;; neovim の設定
(doseq [[k v] {".config/nvim/init.vim" ".vimrc"
               ".config/nvim/ftplugin" ".vim/ftplugin"}]
  (link {:path (home k) :to (install-dir v)}))

;; zsh の設定
;;;; git 補完
(doseq [[k v] {".zsh/_git"                "git-completion.zsh"
               ".zsh/git-completion.bash" "git-completion.bash"}]
  (download
    {:path (home k)
     :url (str "https://raw.githubusercontent.com/git/git/master/contrib/completion/" v)}))

;;;; antigen
(git {:path (home "src/github.com/zsh-users/antigen")
      :url "https://github.com/zsh-users/antigen"})

;; git config
(execute
  {:command [(str "git config --global include.path " (home ".gitconfig.common"))
             (str "git config --global user.name    " (:name git-user))
             (str "git config --global user.email   " (:email git-user))]
   :pre-not (str "test $(git config user.name) = " (:name git-user))})
