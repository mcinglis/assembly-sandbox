# Writes "Hola, mundo" to the console using libc.
# Based on code at: <http://cs.lmu.edu/~ray/notes/gasexamples/>


.intel_syntax
.intel_mnemonic


.section .rodata

message:
    .asciz "Hola, mundo"



.section .text

.global main
.type main, @function
main:                           # Called by libc's startup code
    lea %rdi, message           # Load address of `message` into first arg
    call puts                   # puts( &message )
    xor %eax, %eax              # Return value 0
    ret                         # Return to libc to exit

