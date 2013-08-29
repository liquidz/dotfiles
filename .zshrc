# autoload -U colors; colors
export LANG=ja_JP.UTF-8

# ビープ音を鳴らさないようにする
setopt NO_beep

export TERM=xterm-256color

## lsの色付け
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# alias
case $(uname) in
    *BSD|Darwin)
        alias ctags="/opt/local/bin/ctags --langmap=Lisp:+.clj"
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
export PATH

#if [ -f ~/.zsh/auto-fu.zsh ]; then
#    source ~/.zsh/auto-fu.zsh
#    function zle-line-init () {
#        auto-fu-init
#    }
#    zle -N zle-line-init
#    zstyle ':completion:*' completer _oldlist _complete
#fi

eval "$(rbenv init -)"
