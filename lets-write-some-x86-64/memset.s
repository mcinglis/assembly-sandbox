.intel_syntax
.intel_mnemonic

.data
answer:
    .asciz "Current byte: %d\n"

.text
.globl main
main:
    sub %rsp, 8

    sub %rsp, 16            # acquire 16 bytes
    lea %rdi, [%rsp]
    mov %rsi, 42
    mov %rdx, 16
    call memset             # memset( &rsp, 42, 16 );

    lea %rdi, answer
    mov %rsi, 0
    mov %sil, [%rsp]        # equivalent to: `movzql %esi, [%rsp]`
    mov %al, 0
    call printf             # printf( answer, rsp[0] );

    incq [%rsp]             # rsp[0]++;

    lea %rdi, answer
    mov %rsi, 0
    mov %sil, [%rsp]
    mov %al, 0
    call printf             # printf( answer, rsp[0] );

    lea %rdi, answer
    mov %rsi, 0
    mov %sil, [%rsp + 1]
    mov %al, 0
    call printf             # printf( answer, rsp[1] );

    add %rsp, 16            # clean up the stack

    mov %rdi, 0
    call exit

