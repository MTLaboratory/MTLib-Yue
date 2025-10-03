#!/usr/bin/make -f

ifdef OS
	RM = del /Q
	FixPath = $(subst /,\,$1)
else
	ifeq ($(shell uname), Linux)
		RM = rm -f
		FixPath = $1
	endif
endif

default: compile
compile:
	yue -l mtlib/*.yue *.yue
test: compile
	yue -e test.yue
debug: compile
	yue -e debug.yue
release: compile
	yue -m mtlib/*.yue *.yue
	@ rm -rfv MTLib-Yue.zip
	7z a -tzip MTLib-Yue.zip mtlib/*.lua mtlib.lua