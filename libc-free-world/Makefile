
CFLAGS += -std=c11 -nostdlib -fno-asynchronous-unwind-tables
LDFLAGS += --build-id=none

hello: start.o hello.o
	ld $(LDFLAGS) $^ -o $@
	strip -R .comment $@

start.o: start.s
	as --warn $< -o $@

.PHONY: clean
clean:
	rm -f hello hello.o start.o

