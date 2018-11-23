
PREFIX ?= /usr/local
CD_VERSION ?= 1.0.18

install: npm-diff
	cp $< $(PREFIX)/bin/$<

uninstall:
	rm -f $(PREFIX)/bin/npm-diff

.PHONY: install uninstall

colordiff:
	wget https://www.colordiff.org/colordiff-$(CD_VERSION).tar.gz
	tar -xzf colordiff-$(CD_VERSION).tar.gz
	cd colordiff-$(CD_VERSION)/ && make install
	rm -rf colordiff-$(CD_VERSION)/
	rm colordiff-$(CD_VERSION).tar.gz