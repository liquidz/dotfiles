.PHONY: repl run test outdated pom uberjar jar clean

PLATFORM = $(shell uname -s)
ifeq ($(PLATFORM), Darwin)
	GRAAL_EXTRA_OPTION :=
else
	GRAAL_EXTRA_OPTION := "--static"
endif

repl:
	iced repl -A:dev

run:
	clj -m __dummy__.core

test:
	clojure -R:dev -A:test

outdated:
	clojure -A:outdated

pom:
	clojure -Spom

uberjar: pom
	clojure -A:depstar -m hf.depstar.uberjar target/__dummy__-standalone.jar -C -m __dummy__.core

jar: pom
	clojure -A:depstar -m hf.depstar.jar target/__dummy__.jar

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
