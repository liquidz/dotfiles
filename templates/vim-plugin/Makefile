PLUGIN_NAME = foo
VITAL_MODULES = System.Filepath \
				Process \
				Underscore

.PHONY: all
all:
	vim -c "Vitalize . --name=$(PLUGIN_NAME) $(VITAL_MODULES)" -c q

.PHONY: test
test:
	themis

.PHONY: lint
lint:
	find . -name "*.vim" | grep -v vital | xargs beco vint

.PHONY: clean
clean:
	/bin/rm -rf autoload/vital*

