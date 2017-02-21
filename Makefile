#! /bin/make
builddir?=src

main?=${builddir}/main

generated_files?=\
 ${main} \
 src/config.h \
 #eol

default: demo
	@echo "# $@: $^"

rule/build: SConstruct
	@echo "#{ $@: $^"
	scons
	@echo "#} $@: $^"

all: rule/build
	@echo "# $@: $^"

${main}: all
	@echo "# $@: $^"

run: ${main}
	@echo "#{ $@: $^"
	${<D}/${<F}
	@echo "#} $@: $^"

clean:
	rm -f *.o *~ .*~


distclean: clean
	rm -f ${generated_files}
	rm -rfv .scons*

srcs?=SConscript SConstruct Makefile
srcs+=src/main.c
srcs+=src/config.h.in 

sources: ${srcs}
	@echo "#{ $@: $^"
	more $^ | cat
	@echo "#} $@: $^"

demo: distclean sources run
	@echo "# $@: $^"
