# Quick helpers for common tasks

.DEFAULT_GOAL := build

clean:
	bundle exec jekyll clean

install:
	BUNDLE_PATH=./vendor/bundle \
	NOKOGIRI_USE_SYSTEM_LIBRARIES=true \
	bundle check || bundle install --jobs=4 --retry=3

build: clean
	bundle exec jekyll build

run: clean
	bundle exec jekyll serve --incremental

test: build
	bundle exec htmlproofer _site \
		--allow-hash-href \
		--check-favicon  \
		--check-html \
		--disable-external

publish: test
	.circleci/deploy-ghpages.sh _site
