# =path
PATH=$PATH:~/bin
PATH=$PATH:~/bin/git-tasukete
PATH=$PATH:/opt/local/bin
PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH

export TERM=screen-256color

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# =lighttable
export LT_HOME=/Users/uochan/LightTable

# =docker
export DOCKER_HOST=tcp://localhost:4243

## heroku
export PATH=$PATH:/usr/local/heroku/bin

## go
export GOROOT=/usr/local/go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
