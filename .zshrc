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

# heroku
export PATH="/usr/local/heroku/bin:$PATH"
# docker
export DOCKER_HOST=tcp://localhost:4243

# cd した時に遷移先ディレクトリの ls を表示する
chpwd() {
    ls_abbrev
}
# ファイル数が多い場合に省略表示してくれる ls
ls_abbrev() {
    if [[ ! -r $PWD ]]; then
        return
    fi
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-aCF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}


function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls_abbrev
    #if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    #    echo
    #    echo -e "\e[0;33m--- git status ---\e[0m"
    #    git status -sb
    #fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter



eval "$(rbenv init -)"
