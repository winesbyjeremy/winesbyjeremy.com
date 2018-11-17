# Makefile to help out
SHELL := /bin/bash
BUNDLE := bundle
JEKYLL := $(BUNDLE) exec jekyll
HTMLPROOF := $(BUNDLE) exec htmlproofer

PROJECT_DEPS := Gemfile
.DEFAULT_GOAL := build

install: $(PROJECT_DEPS)
	$(BUNDLE) check || $(BUNDLE) install --jobs=4 --retry=3

clean: install
	$(JEKYLL) clean

build: install
	$(JEKYLL) build

update: $(PROJECT_DEPS)
	$(BUNDLE) update

run: install
	$(JEKYLL) serve --incremental

test: build
	$(HTMLPROOF) _site \
		--allow-hash-href \
		--check-favicon  \
		--check-html \
		--disable-external

publish: test
	.circleci/deploy-ghpages.sh _site
