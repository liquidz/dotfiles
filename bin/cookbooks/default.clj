(defn home [& [path]]
  (cond-> (dad/env :home)
    path (str "/" path)))

(defn install-dir [& [path]]
  (cond-> (home "src/github.com/liquidz/dotfiles")
    path (str "/" path)))

(def git-user {:name "liquidz" :email "liquidz.uo@gmail.com"})

;; git clone
(git {:path (install-dir)
      :url "https://github.com/liquidz/dotfiles"})

;; 必要なディレクトリを作成
(doseq [dir '[.tags .lein .config/nvim .zsh]]
  (directory (home dir)))

;; dotfiles のシンボリックリンクを貼る
(doseq [file '[.vim .vimrc .tmux.conf .zshenv .zshrc .zshrc.antigen
               .ctags .gemrc .rubocop.yml .gitconfig.common .w3m
               .cheatrc .lein/profiles.clj .boot/profile.boot .joker .xkb
               .spacemacs.d .zsh]]
  (link {:path (home file)
         :to (install-dir file)}))

;; vim の設定
(doseq [dir '[.vim/backup .vim/memo .vim/autoload]]
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

(help "execute")
;; git config
(execute
  {:command [(str "git config --global include.path " (home ".gitconfig.common"))
             (str "git config --global user.name    " (:name git-user))
             (str "git config --global user.email   " (:email git-user))]
   :pre-not (str "test $(git config user.name) = " (:name git-user))})
