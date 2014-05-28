
sources = $(wildcard *.s)
objects = $(sources:.s=.o)
executables = $(sources:.s=)

# Generic rule:
# $< is the first dependency name
# $@ is the target filename
%.o: %.s
	as --warn "$<" -o "$@"

.PHONY: all
all: $(objects)
	for exe in $(executables); do \
	    gcc "$$exe.o" -o "$$exe"; \
	done

.PHONY: clean
clean:
	rm -f $(objects)
	rm -f $(executables)

