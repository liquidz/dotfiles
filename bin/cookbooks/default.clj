(defn home [& [path]]
  (cond-> (dad/env :home)
    path (str "/" path)))

(defn install-dir [& [path]]
  (cond-> (home "src/github.com/liquidz/dotfiles")
    path (str "/" path)))

;; git clone
(git {:path (install-dir)
      :url "https://github.com/liquidz/dotfiles"})

;; 必要なディレクトリを作成
(doseq [dir '[.tags .lein .config/nvim]]
  (directory (home dir)))

;; dotfiles のシンボリックリンクを貼る
(doseq [file '[.vim .vimrc .tmux.conf .zshenv .zshrc .zshrc.antigen
               .ctags .gemrc .rubocop.yml .gitconfig.common .w3m
               .cheatrc .lein/profiles.clj .boot/profile.boot .joker .xkb]]
  (link {:path (home file)
         :to (install-dir file)}))

;; vim の設定
(doseq [dir '[.vim/backup .vim/memo .vim/autoload]]
  (directory (home dir)))
(download {:path (home ".vim/autoload/plug.vim")
           :url "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"})

; {
;  '.config/nvim/init.vim
;  }


(comment
  (help "download")
  )
