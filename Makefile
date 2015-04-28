all:
	bash bin/setup.sh

.PHONY: test
test:
	env TEST_ROOT="`pwd`" bats/bin/bats --tap test/suites

lint:
	beco vint .vimrc
	beco vint .vim/ftplugin/*.vim
	beco vint .vim/conf.d/*.vim
