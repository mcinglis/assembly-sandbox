
sources = $(wildcard *.c)

att_asm       = $(sources:.c=.att.s)
intel_asm     = $(sources:.c=.intel.s)
intel_opt_asm = $(sources:.c=.intel.opt.s)
executables   = $(sources:.c=)

output = $(att_asm) $(intel_asm) $(intel_opt_asm) $(executables)


CFLAGS += -std=c11 \
	  -Wall -Wextra \
	  -fno-asynchronous-unwind-tables


.PHONY: all
all: $(output)


.PHONY: clean
clean:
	rm -f $(output)


%.att.s: %.c
	$(CC) -S -masm=att $(CFLAGS) "$<" -o "$@"


%.intel.s: %.c
	$(CC) -S -masm=intel $(CFLAGS) "$<" -o "$@"


%.intel.opt.s: %.c
	$(CC) -S -masm=intel -O2 $(CFLAGS) "$<" -o "$@"


