
# An x86-64 program that prints each of its command-line arguments on a
# new line.

# Based on code at: <http://cs.lmu.edu/~ray/notes/gasexamples/>


.intel_syntax
.intel_mnemonic


.section .text

.global main
.type main, @function
main:
    # int argc (%edi), char ** argv (%rsi) ==> int (%eax)

    push    %r12                    # Save these registers for the callee, as
    push    %r13                    # per ABI conventions.
    sub     %rsp, 8                 # Align the stack pointer.

    mov     %r12d, %edi
    mov     %r13, %rsi

loop:
    mov     %rdi, QWORD PTR [%r13]
    call    puts                    # puts( *argv )
    add     %r13, 8                 # argv++
    dec     %r12d                   # argc--
    jnz     loop                    # loop if argc != 0

    add     %rsp, 8                 # Un-align the stack pointer, and restore
    pop     %r13                    # the callee's registers.
    pop     %r12

    xor     %eax, %eax              # return 0
    ret


