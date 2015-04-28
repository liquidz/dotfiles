#!/usr/bin/env bash

#   ____   __  ____  ____  __  __    ____  ____ 
#  (    \ /  \(_  _)(  __)(  )(  )  (  __)/ ___)
#   ) D ((  O ) )(   ) _)  )( / (_/\ ) _) \___ \
#  (____/ \__/ (__) (__)  (__)\____/(____)(____/
#
# ==================================================

if [[ "$PREFIX" = "" ]]; then
    PREFIX="$HOME"
fi
INSTALL_DIR=$PREFIX/src/github.com/liquidz/dotfiles
DOT_FILES=(".vimrc"                     \
    ".tmux.conf"                        \
    ".zshenv" ".zshrc" ".zshrc.antigen" \
    ".peco" ".ctags"                    \
    ".gemrc" ".rubocop.yml"             \
    )
# colors {{{
red=31
green=32
yellow=33
blue=34
# }}}
cecho() { # {{{
    color=$1
    shift
    echo -e "\033[${color}m$@\033[m"
} # }}}

## git が未インストールなら終了
if [[ ! -x "`which git`" ]]; then
    cecho $red "Error: git is not installed"
    exit 1
fi

## インストールモードの確認
## full モード以外では dotfiles のシンボリックリンクのみ貼る
if [[ "$MODE" = "min" ]]; then
    MODE="minimal"
else
    MODE="full"
fi
cecho $green "Start: ${MODE} setup"

## dotfiles レポジトリの clone
cecho $yellow " * cloning dotfiles"
if [[ ! -e $INSTALL_DIR ]]; then
    git clone https://github.com/liquidz/dotfiles.git $INSTALL_DIR > /dev/null 2>&1
else
    cecho $blue "   pulling origin master"
    (cd $INSTALL_DIR && git pull origin master > /dev/null 2>&1)
fi

## dotfiles のシンボリックリンクを貼る
cecho $yellow " * create symbolic links to dotfiles"
for file in ${DOT_FILES[@]}; do
    ln -sfn $INSTALL_DIR/$file $PREFIX/$file
done
cecho $yellow " * create symbolic links to .lein/profiles.clj"
if [[ ! -e "$PREFIX/.lein" ]]; then
    mkdir -p $PREFIX/.lein
fi
ln -sfn $INSTALL_DIR/.lein/profiles.clj $PREFIX/.lein/profiles.clj

## full モードなら全設定のセットアップ
if [[ "$MODE" == "full" ]]; then
    ## vim の設定
    cecho $yellow " * initializing vim"
    ln -sfn $INSTALL_DIR/.vim $PREFIX/.vim
    mkdir -p $PREFIX/.vim/bundle
    mkdir -p $PREFIX/.vim/backup
    mkdir -p $PREFIX/.tags

    cecho $yellow " * setting up vim memo"
    if [[ -e ~/Dropbox/vim/memo ]] && [[ "$IS_TEST" = "" ]]; then
        cecho $blue "   link to dropbox"
        ln -sfn ~/Dropbox/vim/memo $PREFIX/.vim/memo
    else
        cecho $blue "  * touch plain text"
        mkdir -p $PREFIX/.vim/memo
        touch $PREFIX/.vim/memo/default.md
    fi

    cecho $yellow " * cloning neobundle.vim"
    DIR="$PREFIX/.vim/bundle/neobundle.vim"
    if [ ! -e $DIR ]; then
        git clone https://github.com/Shougo/neobundle.vim.git $DIR > /dev/null 2>&1
    else
        cecho $blue "   pulling origin master"
        (cd $DIR && git pull origin master > /dev/null 2>&1)
    fi

    ## tmux の設定
    cecho $yellow " * cloning tpm"
    DIR="$PREFIX/.tmux/plugins/tpm"
    if [[ ! -e $DIR ]]; then
        git clone https://github.com/tmux-plugins/tpm $DIR > /dev/null 2>&1
    else
        cecho $blue "   pulling origin master"
        (cd $DIR && git pull origin master > /dev/null 2>&1)
    fi

    ## zsh の設定
    cecho $yellow " * initializing zsh"
    DIR="$PREFIX/.zsh"
    ln -sfn $INSTALL_DIR/.zsh $DIR
    cecho $yellow " * downloading zsh git-completion"
    curl -s -o "$DIR/_git" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
    curl -s -o "$DIR/git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

    cecho $yellow " * cloning antigen"
    DIR="$PREFIX/src/github.com/zsh-users/antigen"
    if [[ ! -e $DIR ]]; then
        git clone https://github.com/zsh-users/antigen.git $DIR > /dev/null 2>&1
    else
        cecho $blue "   pulling origin master"
        (cd $DIR && git pull origin master > /dev/null 2>&1)
    fi

    ## beco
    cecho $yellow " * cloning beco"
    DIR="$PREFIX/src/github.com/liquidz/beco"
    if [[ ! -e $DIR ]]; then
        git clone https://github.com/liquidz/beco.git $DIR > /dev/null 2>&1
    else
        cecho $blue "   pulling origin master"
        (cd $DIR && git pull origin master > /dev/null 2>&1)
    fi
    mkdir -p $PREFIX/bin && ln -sfn $DIR/bin/beco $PREFIX/bin/beco

    cecho $yellow " * git config"
    git config --global ghq.root ~/src
    git config --global github.user liquidz
    git config --global push.default current
fi

cecho $green "Done"

exit 0
