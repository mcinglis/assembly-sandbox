
# Based on code at: <http://cs.lmu.edu/~ray/notes/gasexamples/>


.intel_syntax
.intel_mnemonic


.section .rodata

usage_str:
    .ascii "Usage: %s x y\n"
    .ascii " Calculates and prints x^y.\n"
    .asciz " The exponent can't be negative."

answer_fmt_str:
    .asciz "%lld\n"



.section .text

.global main
.type main, @function
main:
    # %edi = argc, %rsi = argv

    push    %r12                    # Points to argv.
    push    %r13                    # Stores the base.
    push    %r14                    # Stores the exponent.
    # By pushing three registers, the stack pointer is aligned for calls.

    cmp     %edi, 3                 # Must have exactly two arguments.
    jne     usage

    mov     %r12, %rsi              # Save argv.

    mov     %rdi, [%r12 + 8]
    call    atol
    mov     %r13, %rax              # base = atol( argv[ 1 ] )

    mov     %rdi, [%r12 + 16]
    call    atol
    cmp     %rax, 0                 # Exponent can't be negative.
    jl      usage
    mov     %r14, %rax              # exp = atol( argv[ 2 ] )

    mov     %rsi, 1                 # answer = 1
loop:
    test    %r14, %r14              # if exp == 0:
    jz      print_answer            #   print answer
    imul    %rsi, %r13              # answer *= base
    dec     %r14                    # exp--
    jmp     loop

print_answer:
    lea     %rdi, answer_fmt_str
    # %rsi already stores the answer
    xor     %rax, %rax
    call    printf

    xor     %eax, %eax              # return value = 0

exit:
    pop     %r14
    pop     %r13
    pop     %r12
    ret

usage:
    lea     %rdi, usage_str
    call    puts
    mov     %eax, 1                 # return value = 1
    jmp     exit


