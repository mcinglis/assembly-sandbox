
# Writes "Hello, world" to the console using only system calls. Runs on 64-bit
# Linux only. To assemble and run:
#
#     gcc -c hello.s && ld hello.o && ./a.out
#
# or
#
#     gcc -nostdlib hello.s && ./a.out


.intel_syntax
.intel_mnemonic


.data

message:
    .ascii "Hello, world\n"


.text

.global _start
_start:
    # sys_write( 1, message, 13 )
    mov %rax, 1             # system call 1 is write
    mov %rdi, 1             # file descriptor 1 is stdout
    lea %rsi, message       # address of string to output
    mov %rdx, 13            # number of bytes
    syscall                 # invoke operating system

    # sys_exit( 0 )
    mov %rax, 60            # system call 60 is exit
    xor %rdi, %rdi          # zero rdi, so first argument is 0
    syscall


