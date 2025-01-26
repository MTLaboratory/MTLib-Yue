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
# FIXME
#clean:
#	$(RM) $(call FixPath, mtlib/*.lua)
#	$(RM) $(call FixPath, mtlib/*.moon)
#	$(RM) $(call FixPath, *.lua)
#	$(RM) $(call FixPath, *.moon)
compile:
	@ echo compiling MTLib...
	yue mtlib/*.yue *.yue
test: compile
	yue -e test.yue
debug:
	yue -e debug.yue