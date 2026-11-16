.PHONY: help test audit style ci all
.DEFAULT_GOAL := help

help:
	@echo "Available targets:"
	@echo "  test   - Run tap unit tests"
	@echo "  audit  - Audit formulae and casks"
	@echo "  style  - Check formula and cask style"
	@echo "  ci     - Run all local checks (test + style)"
	@echo "  help   - Show this help message"

ci: test style

all: test

test:
	ruby test/test_tap.rb

audit:
	@for f in Formula/*.rb; do brew audit --formula "$$f"; done
	@for c in Casks/*.rb; do brew audit --cask "$$c"; done

style:
	brew style Formula/*.rb Casks/*.rb
