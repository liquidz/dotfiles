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
    # full モードで設定されるものがないこと
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
    [ -d "$TEST_PREFIX/.vim/bundle/neobundle.vim" ]
    [ -d "$TEST_PREFIX/.tmux/plugins/tpm" ]
    [ -L "$TEST_PREFIX/.zsh" ]
    [ -e "$TEST_PREFIX/.zsh/_tmpl" ]
    [ -e "$TEST_PREFIX/.zsh/_git" ]
    [ -e "$TEST_PREFIX/.zsh/git-completion.bash" ]
    [ -d "$TEST_PREFIX/src/github.com/zsh-users/antigen" ]
    [ -d "$TEST_PREFIX/src/github.com/liquidz/beco" ]
    [ -L "$TEST_PREFIX/bin/beco" ]
    [ -L "$TEST_PREFIX/.zsh/_beco" ]
}
