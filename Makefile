ifndef BASE
BASE=2
endif

ifndef NELTS
NELTS=10
endif

BASELINE=./test_files/baseline.$(BASE).$(NELTS)
TESTFILE=./test_files/out.$(BASE).$(NELTS)

.PHONY: test
test: $(BASELINE)
	node test_files/test_standalone.js $(BASE) $(NELTS) > $(TESTFILE)
	diff $(BASELINE) $(TESTFILE)

.PHONY: mocha
mocha: $(BASELINE)
	mocha -R spec

.PHONY: baseline
baseline $(BASELINE):
	bash test_files/generate_baseline.sh $(BASE) $(NELTS) > $(BASELINE)

.PHONY: all
all:
	bash test_files/make.sh

.PHONY: clean
clean:
	rm -f test_files/out.*

.PHONY: clean-base
clean-base: clean
	rm -f test_files/baseline.*
