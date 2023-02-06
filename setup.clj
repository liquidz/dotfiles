(ns setup
  (:require
   [babashka.pods :as pods]))

(pods/load-pod "dad")
(require '[pod.liquidz.dad :as dad])

(defn home
  [& [path]]
  (cond-> (System/getenv "HOME")
    path (str "/" path)))

(defn install-dir
  [& [path]]
  (cond-> (home "src/github.com/liquidz/dotfiles")
    path (str "/" path)))

(def git-user
  {:name "liquidz"
   :email "liquidz.uo@gmail.com"})

;; git clone
(dad/git {:path (install-dir)
          :url "https://github.com/liquidz/dotfiles"
          :revision "master"})

;; 必要なディレクトリを作成
(doseq [dir [".boot"
             ".config/nvim"
             ".lein"
             ".tags"
             ".config/karabiner/assets/complex_modifications"
             ".newsboat"]]
  (dad/directory {:path (home dir)}))

;; dotfiles のシンボリックリンクを貼る
(doseq [file [".boot/profile.boot"
              ".cheatrc"
              ".config/alacritty"
              ".config/efm-langserver"
              ".config/karabiner/assets/complex_modifications/mine.json"
              ".config/zeno"
              ".config/fd"
              ".ctags"
              ".gemrc"
              ".joker"
              ".lein/profiles.clj"
              ".newsboat/config"
              ".newsboat/urls"
              ".newsboat/newsboat-bookmark.clj"
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
  (dad/link {:path (home file)
             :source (install-dir file)}))


;; vim の設定
(doseq [dir '[.vim/autoload .vim/backup .vim/memo]]
  (dad/directory {:path (home dir)}))

(dad/download {:path (home ".vim/autoload/plug.vim")
               :url "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"})

;; neovim の設定
(doseq [[k v] {".config/nvim/init.vim" ".vimrc"
               ".config/nvim/after" ".vim/after"
               ".config/nvim/ftplugin" ".vim/ftplugin"
               ".config/nvim/coc-settings.json" ".vim/coc-settings.json"}]
  (dad/link {:path (home k)
             :source (install-dir v)}))

;; zsh の設定
;;;; git 補完
(doseq [[k v] {".zsh/_git"                "git-completion.zsh"
               ".zsh/git-completion.bash" "git-completion.bash"}]
  (dad/download
   {:path (home k)
    :url (str "https://raw.githubusercontent.com/git/git/master/contrib/completion/" v)}))


;; zinit
(dad/directory {:path (home ".zinit")})
(dad/git {:path (home ".zinit/bin")
          :url "https://github.com/zdharma-continuum/zinit"
          :revision "master"})

;; tmux の設定
(dad/git {:path (home ".tmux/plugins/tpm")
          :url "https://github.com/tmux-plugins/tpm"
          :revision "master"})

;; git config
(dad/execute
  {:command [(str "git config --global include.path " (install-dir ".gitconfig.common"))
             (str "git config --global core.excludesfile " (install-dir ".gitignore_global"))
             (str "git config --global user.name    " (:name git-user))
             (str "git config --global user.email   " (:email git-user))
             (str "git config --global commit.template " (install-dir ".gitmessage"))]
   :pre-not (str "test $(git config user.name) = " (:name git-user))})

;; Only for Mac
;; defaults write -g InitialKeyRepeat -int 15
;; defaults write -g KeyRepeat -int 2

(def ^:private tailwindcss-intellisense-version "0.9.1")
(let [url (format "https://github.com/tailwindlabs/tailwindcss-intellisense/releases/download/v%s/vscode-tailwindcss-%s.vsix"
                  tailwindcss-intellisense-version
                  tailwindcss-intellisense-version)]
  (dad/download {:path (home "bin") :url url}))
