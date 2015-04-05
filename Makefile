all:
	bash bin/setup.sh

.PHONY: test
test:
	env TEST_ROOT="`pwd`/test" bats/bin/bats --tap test/suites
