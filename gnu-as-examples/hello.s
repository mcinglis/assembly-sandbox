
# Writes "Hello, world" to the console using only Linux system calls.
# Based on code at: <http://cs.lmu.edu/~ray/notes/gasexamples/>


.intel_syntax
.intel_mnemonic


.section .rodata

message:
    .ascii "Hello, world\n"
.set message_size, . - message



.section .text

.global _start
_start:

    # sys_write( 1, message, 13 )
    mov %rax, 1             # System call #1 is sys_write.
    mov %rdi, 1             # 1st argument: file descriptor 1 (stdout).
    lea %rsi, message       # 2nd argument: &message
    mov %rdx, message_size  # 3rd argument: sizeof message
    syscall                 # invoke operating system

    # sys_exit( 0 )
    mov %rax, 60            # system call 60 is exit
    xor %rdi, %rdi          # zero rdi, so first argument is 0
    syscall


