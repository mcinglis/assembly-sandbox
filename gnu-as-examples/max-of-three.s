
# Based on code at: <http://cs.lmu.edu/~ray/notes/gasexamples/>

.intel_syntax
.intel_mnemonic

.section .text

.global max_of_three
.type max_of_three, @function
max_of_three:
    # int64 x (%rdi), int64 y (%rsi), int64 z (%rdx) -> int64 (%rax)
    # Returns the maximum of x, y and z.

    mov     %rax, %rdi      # Let %rax = %rdi.
    cmp     %rax, %rsi
    cmovl   %rax, %rsi      # If %rax < %rsi, let %rax = %rsi.
    cmp     %rax, %rdx
    cmovl   %rax, %rdx      # If %rax < %rdx, let %rax = %rdx.
    ret

