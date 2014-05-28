
sources = $(wildcard *.s)
objects = $(sources:.s=.o)
executables = $(sources:.s=)


.PHONY: all
all: hello


.PHONY:
clean:
	rm -f $(objects) $(executables)


hello: hello.s
	as --warn "$<" -o "$@.o"
	ld "$@.o" -o "$@"

