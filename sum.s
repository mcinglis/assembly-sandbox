
# Based on code at: <http://cs.lmu.edu/~ray/notes/gasexamples/>


.intel_syntax
.intel_mnemonic


.section .text

.global sum
.type sum, @function
sum:
    # double[] xs (%rdi), unsigned int n (%rsi) ==> double (%xmm0)

    xorpd   %xmm0, %xmm0            # sum = 0
    cmp     %rsi, 0                 # special case for length = 0
    je      done

loop:
    addsd   %xmm0, [%rdi]           # sum += *xs
    add     %rdi, 8                 # xs++
    dec     %rsi                    # n--
    jnz     loop                    # loop if n != 0

done:
    ret                             # return value already in %xmm0

