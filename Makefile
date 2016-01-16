LIB=vdc
REQS=
ADDONS=
AUXTARGETS=

ULIB=$(shell echo $(LIB) | tr a-z A-Z)
DEPS=
TARGET=$(LIB).js

.PHONY: all
all: $(TARGET) $(AUXTARGETS)

$(TARGET) $(AUXTARGETS): %.js : %.flow.js
	node -e 'process.stdout.write(require("fs").readFileSync("$<","utf8").replace(/^\s*\/\*:[^*]*\*\/\s*(\n)?/gm,"").replace(/\/\*:[^*]*\*\//gm,""))' > $@

.PHONY: clean
clean: clean-baseline
	rm -f $(TARGET)

.PHONY: test mocha
test mocha: test.js $(TARGET)
	mocha -R spec -t 20000

.PHONY: lint
lint: $(TARGET) $(AUXTARGETS)
	jshint --show-non-errors $(TARGET) $(AUXTARGETS)
	jshint --show-non-errors package.json
	jscs $(TARGET) $(AUXTARGETS)

.PHONY: flow
flow: lint
	flow check --all --show-all-errors

.PHONY: baseline clean-baseline
baseline:
	./misc/make_baseline.sh

clean-baseline:
	rm -f test_files/*.*
