
CABAL=cabal-dev

all: build run

run:
	$(CABAL) run

build:
	$(CABAL) build

install:
	$(CABAL) install -j

.PHONY: all
