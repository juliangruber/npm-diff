
PREFIX ?= /usr/local
SO := $(shell uname)

install: npm-diff
	cp $< $(PREFIX)/bin/$<

uninstall:
	rm -f $(PREFIX)/bin/npm-diff

.PHONY: install uninstall

colordiff_linux:
	apt-get install colordiff --allow-unauthenticated -y

colordiff_mac:
	brew install colordiff

colordiff:
ifeq ($(SO), Linux)
	make colordiff_linux
else
	make colordiff_mac
endif