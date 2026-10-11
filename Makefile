.PHONY: test audit style all

all: test

test:
	ruby test/test_tap.rb

audit:
	@for f in Formula/*.rb; do brew audit --formula "$$f"; done
	@for c in Casks/*.rb; do brew audit --cask "$$c"; done

style:
	brew style Formula/*.rb Casks/*.rb
