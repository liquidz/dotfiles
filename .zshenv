# path {{{
PATH=$PATH:~/bin
PATH=$PATH:~/bin/git-tasukete
PATH=$PATH:/opt/local/bin
PATH=$PATH:~/.vim/bundle/vim-themis/bin
PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH
# }}}

alias ll='ls -l'
alias la='ls -a'

case "${OSTYPE}" in
darwin*)
    alias pwd='$HOME/src/github.com/liquidz/dotfiles/assets/iterm_wall_chg.sh ; pwd'
    ;;
esac

# history {{{
export HISTFILE=${HOME}/.zhistory
# max history count to register in memory
export HISTSIZE=1000
# max history count to register in file
export SAVEHIST=100000
# }}}

export TERM=screen-256color
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/uochan/app/cocos2d-x-3.3rc0/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/uochan/app/android-ndk-r10c
export PATH=$NDK_ROOT:$PATH
# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/ant/bin
export PATH=$ANT_ROOT:$PATH
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/uochan/app/adt-bundle-mac-x86_64-20140702/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

export CPLUS_INCLUDE_PATH="/Users/uochan/app/cocos2d-x-3.3rc0/cocos:/Users/uochan/app/./cocos2d-x-3.3rc0/external/glfw3/include/mac/"

# vim {{{
alias rebuild_vim='(cd /usr/local/src/vim && sudo ./rebuild.sh)'
alias bo='(cd ~/.vim/bundle && cd $(/bin/ls -1 | peco) && git browse)'
# }}}

# docker {{{
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

alias dl='docker ps -ql'
alias da='docker ps -qa'
alias di="docker images | grep -v 'REPOSITORY' | peco | awk '{print \$1}'"
alias dc="docker ps -a | grep -v 'CONTAINER ID' | peco | awk '{print \$1}'"
alias db='docker build --rm -t $(pwd | awk -F/ "{print \$(NF-1),\$NF}" | sed "s/ /\//g") .'
alias dr='docker run --rm -it DI /bin/bash'
alias docker-rm='docker rm $(dc)'
alias docker-start='docker start $(dc)'
alias docker-attach='docker attach $(dc)'
alias docker-rm-all='docker rm -f $(da)'
alias docker-rmi='docker rmi $(di)'
alias docker-stop-all='docker stop $(da)'
alias docker-rm-none-image='docker rmi $(docker images -f dangling=true -q)'
#alias dcc='docker-stop-all ; docker-rm-all ; docker-rm-none-image'
alias dcc='docker-rm-all ; docker-rm-none-image'

alias -g DL='$(dl)'
alias -g DA='$(da)'
alias -g DI='$(di)'
alias -g DC='$(dc)'
# }}}

# heroku {{{
export PATH=$PATH:/usr/local/heroku/bin
# }}}

# go {{{
export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# }}}

# ghq {{{
alias ghc='cd $(ghq list --full-path | peco)'
alias ghf='find $(git rev-parse --show-cdup) -type f | grep -v "/.git/" | peco'
alias gho='(cd $(ghq list --full-path | peco) && git browse)'
# }}}

# local bookmark {{{
alias bm='cd $(cat ~/.bookmark | peco)'
# }}}

# git {{{
if which hub > /dev/null 2>&1; then
    alias git=hub
fi
alias b='git branch -a | peco | sed "s/\* *//g"'
alias -g B='$(b)'
alias l='git log --oneline | peco | cut -d" " -f1'
alias -g L='$(l)'
alias s='git status -s | peco | cut -b 4-'
alias -g S='$(s)'
# }}}

# ssh {{{
alias ss='ssh $(grep "Host " ~/.ssh/config | cut -c6- | peco)'
alias sss='tmux split-window ss'
alias ssn='tmux new-window ss'
# }}}

# cakephp {{{
# To enable these aliases, you must export CAKE_PROJECT_ROOT in /etc/zshenv
if [[ "$CAKE_PROJECT_ROOT" != "" ]]; then
    alias apptest='$CAKE_PROJECT_ROOT/bin/cake test app --app $CAKE_PROJECT_ROOT/app $(find $CAKE_PROJECT_ROOT/app/Test/Case -name "*Test.php" | cut -b 36- | sed "s/Test.php//g" | peco)'
    alias Apptest="$CAKE_PROJECT_ROOT/bin/cake test app --app $CAKE_PROJECT_ROOT/app"
    alias alltest="$CAKE_PROJECT_ROOT/bin/cake test app AllTests --app $CAKE_PROJECT_ROOT/app"
    alias phpcs="phpcs --standard=CakePHP"
fi
# }}}

# my commands {{{
alias suteneko='docker run -it uochan/suteneko'
export BECOROOT=/Users/uochan/src/github.com/liquidz/beco
# }}}
