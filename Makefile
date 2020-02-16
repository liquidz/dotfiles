.PHONY: setup test lint xkb clean

PWD=$(shell pwd)

setup:
	bash bin/setup.sh

test:
	docker run --rm -v $(PWD):/root/dotfiles uochan/ubuntu bash /root/dotfiles/test/run.sh

test_container:
	docker run --rm -v $(PWD):/root/dotfiles -it ubuntu:latest bash

lint:
	beco vint .vimrc
	beco vint .vim/ftplugin/*.vim
	beco vint .vim/conf.d/*.vim

xkb:
	bash bin/xkb.sh

clean:
	\rm -rf bin/dad .vim/cache_vim .vim/merged .vim/state_vim.vim .vim/temp .vim/rollbacks
