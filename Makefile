# Quick helpers for common tasks

clean:
	bundle exec jekyll clean

build: clean
	bundle exec jekyll build

run: clean
	bundle exec jekyll serve --incremental
