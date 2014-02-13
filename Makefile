
PREFIX ?= /usr/local

install: npm-diff
	cp $< $(PREFIX)/bin/$<

uninstall:
	rm -f $(PREFIX)/bin/npm-diff

.PHONY: install uninstall

