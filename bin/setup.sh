#!/usr/bin/env bash

#   ____   __  ____  ____  __  __    ____  ____ 
#  (    \ /  \(_  _)(  __)(  )(  )  (  __)/ ___)
#   ) D ((  O ) )(   ) _)  )( / (_/\ ) _) \___ \
#  (____/ \__/ (__) (__)  (__)\____/(____)(____/
#
# ==================================================

INSTALL_DIR=~/src/github.com/liquidz/dotfiles
DOT_FILES=( \
    ".vimrc" ".tmux.conf"               \
    ".zshenv" ".zshrc" ".zshrc.antigen" \
    ".ctags" ".gemrc" ".rubocop.yml"    \
    ".gitconfig.common" ".w3m"          \
    ".cheatrc"                          \
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
cecho $yellow " * dotfiles"
if [[ ! -e $INSTALL_DIR ]]; then
    git clone https://github.com/liquidz/dotfiles.git $INSTALL_DIR > /dev/null 2>&1
else
    cecho $blue "   pulling origin master"
    (cd $INSTALL_DIR && git pull origin master > /dev/null 2>&1)
fi

## dotfiles のシンボリックリンクを貼る
cecho $yellow " * symbolic links to dotfiles"
for file in ${DOT_FILES[@]}; do
    cecho $blue "   $file"
    ln -sfn $INSTALL_DIR/$file ~/$file
done
cecho $yellow " * symbolic links to .lein/profiles.clj"
if [[ ! -e "~/.lein" ]]; then
    mkdir -p ~/.lein
fi
ln -sfn $INSTALL_DIR/.lein/profiles.clj ~/.lein/profiles.clj

## full モードなら全設定のセットアップ
if [[ "$MODE" == "full" ]]; then
    ## vim の設定
    cecho $yellow " * initializing vim"
    ln -sfn $INSTALL_DIR/.vim ~/.vim
    mkdir -p ~/.vim/backup
    mkdir -p ~/.tags

    ## neovimの設定
    cecho $yellow " * symbolic links to .config/nvim"
    if [[ ! -e "~/.config" ]]; then
        mkdir -p ~/.config
    fi
    ln -sfn $INSTALL_DIR/nvim ~/.config

    cecho $yellow " * setting up vim memo"
    if [[ -e ~/Dropbox/vim/memo ]] && [[ "$IS_TEST" = "" ]]; then
        cecho $blue "   link to dropbox"
        ln -sfn ~/Dropbox/vim/memo ~/.vim/memo
    else
        cecho $blue "  * touch plain text"
        mkdir -p ~/.vim/memo
        touch ~/.vim/memo/default.md
    fi

    cecho $yellow " * setting up vim-plug"
    #PLUG_VIM=$INSTALL_DIR/nvim/autoload/plug.vim
    PLUG_VIM=$INSTALL_DIR/.vim/autoload/plug.vim
    if [ ! -e $PLUG_VIM ]; then
        cecho $blue "   installing vim-plug"
        curl -sfLo $PLUG_VIM --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    mkdir -p $INSTALL_DIR/nvim/autoload
    \cp -pf $INSTALL_DIR/.vim/autoload/plug.vim \
            $INSTALL_DIR/nvim/autoload/

    ## tmux の設定
    #cecho $yellow " * cloning tpm"
    #DIR="~/.tmux/plugins/tpm"
    #if [[ ! -e $DIR ]]; then
    #    git clone https://github.com/tmux-plugins/tpm $DIR > /dev/null 2>&1
    #else
    #    cecho $blue "   pulling origin master"
    #    (cd $DIR && git pull origin master > /dev/null 2>&1)
    #fi

    ## zsh の設定
    cecho $yellow " * initializing zsh"
    DIR=~/.zsh
    ln -sfn $INSTALL_DIR/.zsh $DIR
    cecho $yellow " * zsh git-completion"
    curl -s -o "$DIR/_git" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
    curl -s -o "$DIR/git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

    cecho $yellow " * zsh antigen"
    DIR=~/src/github.com/zsh-users/antigen
    if [[ ! -e $DIR ]]; then
        git clone https://github.com/zsh-users/antigen.git $DIR > /dev/null 2>&1
    else
        cecho $blue "   pulling origin master"
        (cd $DIR && git pull origin master > /dev/null 2>&1)
    fi

    ## beco
    cecho $yellow " * beco"
    DIR=~/src/github.com/liquidz/beco
    if [[ ! -e $DIR ]]; then
        git clone https://github.com/liquidz/beco.git $DIR > /dev/null 2>&1
    else
        cecho $blue "   pulling origin master"
        (cd $DIR && git pull origin master > /dev/null 2>&1)
    fi
    mkdir -p ~/bin && ln -sfn $DIR/bin/beco ~/bin/beco
    ln -sfn $DIR/zsh/_beco ~/.zsh/_beco

    ## git config
    cecho $yellow " * git config"
    git config --global include.path ~/.gitconfig.common

    git config --get user.name > /dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        cecho $blue "   setting user.name and user.email"
        git config --global user.name liquidz
        git config --global user.email liquidz.uo@gmail.com
    fi

    ## cheat
    cecho $yellow " * cheat config"
    ln -sfn $INSTALL_DIR/.cheatsheets ~/.cheatsheets
fi

cecho $green "Done"

exit 0
