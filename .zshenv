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
export DOCKER_HOST=tcp://localhost:2375
alias dl='docker ps -ql'
alias da='docker ps -qa'
alias di="docker images | grep -v 'REPOSITORY' | peco | awk '{print \$3}'"
alias dc="docker ps -a | grep -v 'CONTAINER ID' | peco | awk '{print \$1}'"
alias docker-run='docker run -v /vagrant:/src -i -t $(di)'
alias docker-rm='docker rm $(dc)'
alias docker-start='docker start $(dc)'
alias docker-attach='docker attach $(dc)'
alias docker-rm-all='docker rm $(da)'
alias docker-rmi='docker rmi $(di)'

alias -g DL='$(dl)'
alias -g DA='$(da)'
alias -g DI='$(di)'
alias -g DC='$(dc)'

# heroku {{{1
export PATH=$PATH:/usr/local/heroku/bin

# go {{{1
export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# ghq {{{1
alias ghc='cd $(ghq list --full-path | peco)'
alias ghf='find $(git rev-parse --show-cdup) -type f | grep -v "/.git/" | peco'
alias gho='gh-open $(ghq list --full-path | peco)'

# local bookmark {{{1
alias bm='cd $(cat ~/.bookmark | peco)'

# git {{{1
alias b='git branch -a | peco | sed "s/\* *//g"'
alias -g B='$(b)'
alias l='git log --oneline | peco | cut -d" " -f1'
alias -g L='$(l)'
alias s='git status -s | peco | cut -b 4-'
alias -g S='$(s)'
