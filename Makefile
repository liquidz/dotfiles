all:
	bash bin/setup.sh

.PHONY: test
test:
	shelltest test/*.shelltest

lint:
	beco vint .vimrc
	beco vint .vim/ftplugin/*.vim
	beco vint .vim/conf.d/*.vim
