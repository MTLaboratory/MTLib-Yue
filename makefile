#!/usr/bin/make -f

default: compile
clean:
	rm -rfv *.lua mtlib/*.lua MTLib-Yue.zip
compile: clean
	yue -l .
test: compile
	yue -e test.yue
debug: compile
	yue -e debug.yue
release: clean
	yue -m .
	7z a -tzip MTLib-Yue.zip mtlib/*.lua mtlib/lovely/*.lua mtlib.lua