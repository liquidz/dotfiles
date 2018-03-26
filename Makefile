.PHONY: all test lint xkb clean

all:
	bash bin/setup.sh

.PHONY: test
test:
	shelltest test/*.shelltest

lint:
	beco vint .vimrc
	beco vint .vim/ftplugin/*.vim
	beco vint .vim/conf.d/*.vim

xkb:
	bash bin/xkb.sh

clean:
	\rm -rf .vim/.dein .vim/cache_vim .vim/merged .vim/state_vim.vim .vim/temp .vim/rollbacks
