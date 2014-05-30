# Assembly Sandbox

This repository contains my forays into x86-64 assembly programming, and C disassembly. The code is based on examples at:

- <http://cs.lmu.edu/~ray/notes/gasexamples/>
- <https://nickdesaulniers.github.io/blog/2014/04/18/lets-write-some-x86-64/>
- <https://blogs.oracle.com/ksplice/entry/hello_from_a_libc_free>

The code in this repository compiled and worked (seemingly) for me, on Fedora 20 with an Intel i7-2620M, with GNU as 2.23.2 and GCC 4.8.2.

If you could suggest an improvement, please [create an issue](https://github.com/mcinglis/assembly-sandbox/issues).

Things to try with the object files and executables:

- Run `objdump -s example` to display the content of an object file's sections.
- Run `objdump -d example` to disassemble the object code, displaying the instructions represented by the executable sections.
- Run `readelf -s example` to display the entries in the symbol table of the (ELF) object file.
- Run `readelf -S example` to display the information in the section headers of the (ELF) object file.
- Run `strip -R .comment example` to remove the `.comment` section, which just contains the compiler information.
- Run `strace ./example` to watch the system calls made by the program.

Check out the Makefile of `libc-free-world`, which is designed to produce a very lightweight binary.


## Notes

### Useful documents

- [AMD64 Programmer's Manual - Volume 1: Application Programming](http://amd-dev.wpengine.netdna-cdn.com/wordpress/media/2012/10/24592_APM_v11.pdf)
- [AMD64 System V Application Binary Interface](http://www.x86-64.org/documentation/abi.pdf)

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

The `c-to-assembly` directory contains some C code and a Makefile to generate corresponding assembly files in AT&T syntax, Intel syntax, and Intel syntax under `-O2`.

