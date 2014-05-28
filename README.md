# Assembly Sandbox

This repository contains my forays into assembly programming.

Things to try with the object files and executables:

- Run `objdump -s example` to display the content of an object file's sections.
- Run `objdump -d example` to disassemble the object code, displaying the instructions represented by the executable sections.
- Run `readelf -s example` to display the entries in the symbol table of the (ELF) object file.
- Run `readelf -S example` to display the information in the section headers of the (ELF) object file.
- Run `strip -R .comment example` to remove the `.comment` section, which just contains the compiler information.
- Run `strace ./example` to watch the system calls made by the program.

Check out the Makefile of `libc-free-world`, which is designed to produce a very lightweight binary.


## Notes

### Suffix convetion for numerous instructions

- `b` for 1 byte ("b" for "byte")
- `w` for 2 bytes ("w" for "word")
- `l` for 4 bytes ("l" for "long")
- `q` for 8 bytes ("q" for "quad word")

Leaving off the suffix, the assembler with derive the instruction from its operands, but this can lead to obscure bugs.


### Compiling high-level languages into assembly

Run `gcc -S -masm=intel -fno-asynchronous-unwind-tables` to compile a high-level language (e.g. C) source file into readable Intel-syntax assembly for the GNU Assembler.

- GCC and Clang generate AT&T syntax by default. Intel syntax is easier to read than AT&T syntax.
- `-fno-asynchronous-unwind-tables` means the assembly won't have a ton of CFI directives for building the DWARF unwind tables; this is metadata that doesn't affect code generation.

