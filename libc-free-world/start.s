
.intel_syntax
.intel_mnemonic

.global _start
_start:
    call main

    # sys_exit( 4 );
    mov %rax, 60        # system call 60 is sys_exit
    mov %rdi, 4         # exit with value 4
    syscall


