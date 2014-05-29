
.intel_syntax
.intel_mnemonic


.section .data
hello: .asciz "hello world %d\n"


.section .text
.global main
main:
    sub %rsp, 8

    lea %rdi, hello
    mov %rsi, 42
    mov %al, 1
    call printf

    mov %rdi, 0
    call exit

