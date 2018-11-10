# Quick helpers for common tasks

.DEFAULT_GOAL := build

clean:
	bundle exec jekyll clean

build: clean
	bundle exec jekyll build

run: clean
	bundle exec jekyll serve --incremental
