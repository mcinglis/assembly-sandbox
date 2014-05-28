.intel_syntax
.intel_mnemonic

.text
.globl main
main:
    sub %rsp, 8

    mov %rdi, 42     # exit( 42 );
    call exit

