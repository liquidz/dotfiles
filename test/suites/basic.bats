#!/usr/bin/env bats

load ../default
setup () {
    export_default_env
    initialize
}

@test "minimal setup test" {
    env MODE=min $SETUP > /dev/null 2>&1; RET=$?
    [ $RET -eq 0 ]
    [ -d "$TEST_PREFIX/src/github.com/liquidz/dotfiles" ]
    [ -L "$TEST_PREFIX/.vimrc" ]
    [ -L "$TEST_PREFIX/.tmux.conf" ]
    [ -L "$TEST_PREFIX/.zshenv" ]
    [ -L "$TEST_PREFIX/.zshrc" ]
    [ -L "$TEST_PREFIX/.zshrc.antigen" ]
    [ -L "$TEST_PREFIX/.peco" ]
    [ -L "$TEST_PREFIX/.ctags" ]
    [ -L "$TEST_PREFIX/.gemrc" ]
    [ -L "$TEST_PREFIX/.rubocop.yml" ]
    [ -L "$TEST_PREFIX/.lein/profiles.clj" ]
    # full $B%b!<%I$G@_Dj$5$l$k$b$N$,$J$$$3$H(B
    [ ! -L "$TEST_PREFIX/.vim" ]
}

@test "full setup test" {
    $SETUP > /dev/null 2>&1; RET=$?
    [ $RET -eq 0 ]
    [ -L "$TEST_PREFIX/.vim" ]
    [ -d "$TEST_PREFIX/.vim/bundle" ]
    [ -d "$TEST_PREFIX/.vim/backup" ]
    [ -e "$TEST_PREFIX/.vim/memo" ]
    [ -d "$TEST_PREFIX/.tags" ]
    [ -e "$TEST_PREFIX/.vim/autoload/plug.vim" ]
    [ -d "$PREFIX/.tmux/plugins/tpm" ]
    [ -d "$PREFIX/src/github.com/zsh-users/antigen" ]
}