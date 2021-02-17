.PHONY: repl run test outdated pom uberjar jar install clean

PLATFORM = $(shell uname -s)
ifeq ($(PLATFORM), Darwin)
	GRAAL_EXTRA_OPTION :=
else
	GRAAL_EXTRA_OPTION := "--static"
endif

repl:
	iced repl -A:dev

run:
	clj -M -m __dummy__.core

test:
	clojure -M:dev:test

lint:
	cljstyle check
	clj-kondo --lint src:test

outdated:
	clojure -M:outdated

pom:
	clojure -Spom

target/__dummy__-standalone.jar: pom
	clojure -X:depstar uberjar :jar $@ :aot true :main-class __dummy__.core
uberjar: clean target/__dummy__-standalone.jar

target/__dummy__.jar: pom
	clojure -X:depstar jar :jar $@
jar: clean target/__dummy__.jar

install: clean target/__dummy__.jar
	clj -M:deploy install target/__dummy__.jar

coverage:
	clojure -M:coverage:dev --src-ns-path=src --test-ns-path=test --codecov

native-image: uberjar
	$(GRAALVM_HOME)/bin/native-image \
		-jar target/__dummy__-standalone.jar \
		-H:Name=target/__dummy__ \
		-H:+ReportExceptionStackTraces \
		-J-Dclojure.spec.skip-macros=true \
		-J-Dclojure.compiler.direct-linking=true \
		--initialize-at-build-time  \
		--report-unsupported-elements-at-runtime \
		-H:Log=registerResource: \
		--verbose \
		--no-fallback \
		--no-server \
		$(GRAAL_EXTRA_OPTION) \
		"-J-Xmx3g"

clean:
	rm -rf target
