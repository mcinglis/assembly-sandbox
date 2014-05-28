# Let's Write Some x86\_64

<https://nickdesaulniers.github.io/blog/2014/04/18/lets-write-some-x86-64/>

Compile each `.s` source file with:

``` sh
$ as example.s -o example.o     # compile the assembly into object code
$ gcc example.o -o example      # link the object code with libc
```

Useful discussions:

- <https://pay.reddit.com/r/programming/comments/24gpqp/lets_write_some_x8664/>
- <https://news.ycombinator.com/item?id=7680706>

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

