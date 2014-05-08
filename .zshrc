autoload -U compinit; compinit

setopt auto_cd
# cd した先のディレクトリをディレクトリスタックに追加する
# `cd +<Tab>` でディレクトリの履歴を表示
setopt auto_pushd
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups
# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
setopt hist_ignore_all_dups

export LANG=ja_JP.UTF-8

# ビープ音を鳴らさないようにする
setopt NO_beep

export TERM=screen-256color

## lsの色付け
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export LT_HOME=/Users/uochan/LightTable

# alias
case $(uname) in
    *BSD|Darwin)
        alias ctags="ctags --langmap=Lisp:+.clj"
        ;;
esac
alias ll="ls -al"
alias la="ls -a"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -pi"

# =path
PATH=$PATH:~/bin
PATH=$PATH:~/bin/git-tasukete
PATH=$PATH:/opt/local/bin
PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

#if [ -f ~/.zsh/auto-fu.zsh ]; then
#    source ~/.zsh/auto-fu.zsh
#    function zle-line-init () {
#        auto-fu-init
#    }
#    zle -N zle-line-init
#    zstyle ':completion:*' completer _oldlist _complete
#fi

eval "$(rbenv init -)"
