.PHONY: setup test lint xkb clean

PWD=$(shell pwd)

setup:
	bash bin/setup.sh

test:
	shelltest test/*.shelltest

test_container:
	docker run --rm -v $(PWD):/root/dotfiles -it ubuntu:latest bash

lint:
	beco vint .vimrc
	beco vint .vim/ftplugin/*.vim
	beco vint .vim/conf.d/*.vim

xkb:
	bash bin/xkb.sh

clean:
	\rm -rf .vim/.dein .vim/cache_vim .vim/merged .vim/state_vim.vim .vim/temp .vim/rollbacks
