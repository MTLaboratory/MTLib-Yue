#!/usr/bin/make -f

default: compile
clean:
	rm -rfv *.lua mtlib/*.lua MTLib-Yue.zip
compile: clean
	yue -l mtlib/*.yue *.yue
test: compile
	yue -e test.yue
debug: compile
	yue -e debug.yue
release: compile
	yue -m mtlib/*.yue *.yue
	@ rm -rfv MTLib-Yue.zip
	7z a -tzip MTLib-Yue.zip mtlib/*.lua mtlib.lua