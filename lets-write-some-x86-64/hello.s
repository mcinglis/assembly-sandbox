.intel_syntax
.intel_mnemonic

.data
hello:
    .asciz "hello world %d\n"

.text
.globl main
main:
    sub %rsp, 8

    mov %al, 1
    lea %rdi, hello
    mov %rsi, 42
    call printf

    mov %rdi, 0
    call exit

