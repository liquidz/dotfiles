# vi キーバインド
bindkey -v

# 自動補完を有効
autoload -U compinit &&  compinit

autoload -U promptinit && promptinit
autoload -U colors && colors

PROMPT="%n%{$fg[yellow]%}@%{$reset_color%}%m %{$fg[magenta]%}%1~%{$reset_color%} %?: "
RPROMPT="%{$fg[yellow]%}%~%{$reset_color%}"

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

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ls に色を付ける
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
case "${OSTYPE}" in
darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls='ls -F --color'
  ;;
esac

# 先頭マッチのヒストリーサーチ
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
# ヒストリーのインクリメンタルサーチ
bindkey '^R' history-incremental-search-backward
