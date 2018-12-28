.PHONY: native-image install uninstall repl run test ancient clean

native-image:
	mkdir -p target && clojure -A:native-image

install:
	\cp -pi target/__dummy__ /usr/local/bin

uninstall:
	\rm -f /usr/local/bin/__dummy__

repl:
	iced repl -A:dev

run:
	clj -m __dummy__.core

test:
	clojure -R:dev -A:test

ancient:
	clojure -A:ancient

clean:
	\rm -rf target
