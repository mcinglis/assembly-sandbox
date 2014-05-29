

asm_sources = $(wildcard *.s)
c_sources = $(wildcard *.c)
sources = $(asm_sources) $(c_sources)

objects = $(asm_sources:.s=.o) $(c_sources:.c=.o)

executables = \
    hello \
    hola \
    fib \
    max-of-three \
    print-args \
    power \
    sum


.PHONY: all
all: $(executables)


.PHONY:
clean:
	rm -f $(objects) $(executables)


# Override the built-in rule for compiling binaries from source.
%: %.s
# To be replaced with:
%: %.o
	cc $^ -o "$@"
# We use cc to link, because it handles linking with crt and libc. Doing that
# with ld is a pain:
#
# 	ld /usr/lib64/crt1.o /usr/lib64/crti.o hola.o -lc \
# 	   /usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtend.o \
# 	   /usr/lib64/crtn.o -o hola -I /lib64/ld-linux-x86-64.so.2
#
# You can use `gcc -print-file-name` to avoid hardcoding the paths, but it's
# still a pain.


# Don't delete object files after compilation.
.PRECIOUS: %.o

%.o: %.s
	as --warn "$<" -o "$@"


# Exceptions to the above general rules:


# Because hello doesn't use libc, we can link it on its own:
hello: hello.o
	ld "$@.o" -o "$@"


# `max-of-three` also depends on:
max-of-three: max-of-three-call.o


# `sum` also depends on:
sum: sum-call.o


