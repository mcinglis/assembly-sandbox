# An x86-64 program that writes the first 90 Fibonacci numbers.

.intel_syntax
.intel_mnemonic


.section .rodata

num_format_str:
    .asciz "%20ld\n"


.section .text

.global main
.type main, @function
main:
    push    %r12                # Save these registers for the callee, as per
    push    %r13                # ABI conventions. These three pushes align
    push    %r14                # the stack to a 16-byte boundary.

    mov     %r12b, 90           # n = 90    -- how many numbers left
    xor     %r13, %r13          # a = 0     -- the current Fibonacci number
    mov     %r14, 1             # b = 1     -- the next Fibonacci number

loop:
    lea     %rdi, num_format_str
    mov     %rsi, %r13
    xor     %al, %al            # Calling printf with 0 non-integer varargs.
    call    printf              # printf( &format, a )

    dec     %r12b               # n--
    jz      done                # break if n == 0

    mov     %rax, %r13          # tmp = a   -- save the current number
    mov     %r13, %r14          # a = b     -- next number is now the current
    add     %r14, %rax          # b += tmp  -- calculate the new next number
    jmp     loop                # Print the next number.

done:
    pop     %r14                # Restore the callee's register values.
    pop     %r13
    pop     %r12

    xor     %rax, %rax          # return 0
    ret

