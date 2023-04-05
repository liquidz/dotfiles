#export PATH="/opt/homebrew/bin:$PATH"

# vi キーバインド
bindkey -v

# 自動補完を有効
fpath=(~/.zsh $fpath)
autoload -U compinit &&  compinit -u
if which hub > /dev/null 2>&1; then
    compdef hub=git
fi

# https://book.babashka.org/#_terminal_tab_completion
_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb

autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz edit-command-line

# c.f. color codes
# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

# autoload -Uz vcs_info
# setopt prompt_subst
# zstyle ':vcs_info:*'     enable            git
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr         "!"
# zstyle ':vcs_info:git:*' unstagedstr       "+"
# zstyle ':vcs_info:*'     formats           "%b%c%u"
# zstyle ':vcs_info:*'     actionformats     '%b(%a)%c%u'

# vim では画像ファイルは扱わない
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.png' '*.jpg' '*.jpeg' '*.pdf'
zstyle ':completion:*:*:view:*:*files' ignored-patterns '*.png' '*.jpg' '*.jpeg' '*.pdf'

precmd () {
    psvar=()
    #LANG=en_US.UTF-8 vcs_info
    #[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    LANG=en_US.UTF-8
}

PROMPT="%K{237} %F{032}%2~%f %F{243}(%*)%f %? %k
$ "

# cd 先をディレクトリスタックに追加
setopt auto_pushd
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# ビープ音を鳴らさない
setopt NO_beep
# コマンドが間違った場合には修正する
setopt correct

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを共有
setopt share_history
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?.fasl'

# ls に色を付ける
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
case "${OSTYPE}" in
darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls='ls -F --color'
  ;;
esac

# ヒストリーサーチ時にカーソルを末尾にする
# Look for a command that started like the one starting on the command line.
# taken from: http://www.xsteve.at/prg/zsh/.zshrc (not sure of original source)
function history-search-end {
    integer ocursor=$CURSOR

    if [[ $LASTWIDGET = history-beginning-search-*-end ]]; then
        # Last widget called set $hbs_pos.
        CURSOR=$hbs_pos
    else
        hbs_pos=$CURSOR
    fi

    if zle .${WIDGET%-end}; then
        # success, go to end of line
        zle .end-of-line
    else
        # failure, restore position
        CURSOR=$ocursor
        return 1
    fi
}
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# 先頭マッチのヒストリーサーチ
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
# ヒストリーのインクリメンタルサーチ
bindkey '^R' history-incremental-search-backward

if hash ig 2>/dev/null; then
    function interactive-git () {
        BUFFER=$(ig -d)
        zle accept-line
    }
    zle -N interactive-git
    bindkey '^g' interactive-git
fi

# cd したら ls する
function cd() {
   builtin cd $@ && ls;
}

# 入力中のコマンドを vim で編集する
export EDITOR=vim
zle -N edit-command-line
bindkey '^e'  edit-command-line

# generate template
function tmpl() {
    if [[ $# -ne 2 ]]; then
        echo "invalid arity"
    else
        FROM=$1
        TO=$2
        echo "copying $FROM template to $TO ..."
        cp -pir $HOME/src/github.com/liquidz/dotfiles/templates/$FROM $TO
        if [[ -e $HOME/src/github.com/liquidz/dotfiles/templates/$FROM/setup.sh ]]; then
            echo "setting up $TO ..."
            (cd $TO && ./setup.sh "$TO")
            \rm -f $TO/setup.sh
            if [[ $(find $TO -type f | wc -l) = 0 ]]; then
                rmdir $TO
            fi
        fi
    fi
}

function dad-repl() {
    rm -f /tmp/dadf; mkfifo /tmp/dadf
    cat /tmp/dadf | /usr/local/bin/dad ~/src/github.com/liquidz/cookbooks/nodes/$(hostname).clj --no-color --repl 2>&1 | nc -lk 0.0.0.0 5555 > /tmp/dadf
}

if [[ -e ~/.dircolors ]]; then
    eval $(dircolors ~/.dircolors)
fi

[ -f ~/.glam/scripts/glam.sh ] && source ~/.glam/scripts/glam.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# # tmux
# if [[ ! -n $TMUX && $- == *l* ]]; then
#     # get the IDs
#     ID="$(tmux list-sessions)"
#     if [[ -z "$ID" ]]; then
#         tmux new-session
#     fi
#
#     create_new_session="Create New Session"
#     ID="$ID\n${create_new_session}:"
#     ID="$(echo $ID | fzf | cut -d: -f1)"
#     if [[ "$ID" = "${create_new_session}" ]]; then
#         tmux new-session
#     elif [[ -n "$ID" ]]; then
#         tmux attach-session -t "$ID"
#     else
#       :  # Start terminal normally
#     fi
# fi

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# # cf. https://mollifier.hatenablog.com/entry/20090728/p1
# function zshaddhistory() {
#     local line=${1%%$'\n'}
#     local cmd=${line%% *}
#
#     # 以下の条件をすべて満たすものだけをヒストリに追加する
#     # 5文字未満
#     [[ ${#line} -ge 5
#         && ${cmd} != (l[sal])
#         && ${cmd} != (cd)
#         && ${cmd} != (man)
#     ]]
# }
zshaddhistory() {
   local line cmd fullpath
   line=${1%%$'\n'}
   cmd=${line%% *}
   [[ "$(command -v $cmd)" != '' ]]
}

# https://zenn.dev/ymotongpoo/articles/20220802-osc-133-zsh
# zshでOSC 133に対応する
_prompt_executing=""
function __prompt_precmd() {
    local ret="$?"
    if test "$_prompt_executing" != "0"
    then
      _PROMPT_SAVE_PS1="$PS1"
      _PROMPT_SAVE_PS2="$PS2"
      PS1=$'%{\e]133;P;k=i\a%}'$PS1$'%{\e]133;B\a\e]122;> \a%}'
      PS2=$'%{\e]133;P;k=s\a%}'$PS2$'%{\e]133;B\a%}'
    fi
    if test "$_prompt_executing" != ""
    then
       printf "\033]133;D;%s;aid=%s\007" "$ret" "$$"
    fi
    printf "\033]133;A;cl=m;aid=%s\007" "$$"
    _prompt_executing=0
}
function __prompt_preexec() {
    PS1="$_PROMPT_SAVE_PS1"
    PS2="$_PROMPT_SAVE_PS2"
    printf "\033]133;C;\007"
    _prompt_executing=1
}
preexec_functions+=(__prompt_preexec)
precmd_functions+=(__prompt_precmd)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.zinit/bin/zinit.zsh ] ; then
    source "$HOME/.zinit/bin/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    # Load a few important annexes, without Turbo
    # (this is currently required for annexes)
    zinit light-mode for \
        zdharma-continuum/z-a-rust \
        zdharma-continuum/z-a-as-monitor \
        zdharma-continuum/z-a-patch-dl \
        zdharma-continuum/z-a-bin-gem-node

    zinit light-mode for \
        zsh-users/zsh-autosuggestions \
        zdharma-continuum/fast-syntax-highlighting \
        Aloxaf/fzf-tab

    # .zshでないファイルをcompletionファイルとして認識させつつバルクロード
    zinit wait lucid is-snippet as"completion" for \
        OMZP::docker/_docker \
        OMZP::docker-compose/_docker-compose
fi

if which github-copilot-cli > /dev/null 2>&1; then
    eval "$(github-copilot-cli alias -- "$0")"
fi
