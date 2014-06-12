# path {{{1
PATH=$PATH:~/bin
PATH=$PATH:~/bin/git-tasukete
PATH=$PATH:/opt/local/bin
PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH

export TERM=screen-256color

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# lighttable {{{1
export LT_HOME=/Users/uochan/LightTable

# docker {{{1
export DOCKER_HOST=tcp://localhost:4243
alias dl='docker ps -ql'
alias da='docker ps -qa'

# heroku {{{1
export PATH=$PATH:/usr/local/heroku/bin

# go {{{1
export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# ghq {{{1
alias ghc='cd $(ghq list --full-path | peco)'
alias ghf='find $(git rev-parse --show-cdup) -type f | grep -v "/.git/" | peco'
