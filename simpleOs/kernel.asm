    BITS 32

section .text
    global start
    extern kmain

start:
    cli
    mov esp, stack_space
    call kmain
    hlt

section .bss
    resb 8192

stack_space:


;building kernel
;nasm -f elf32 kernel.asm -0 kasm.o
;gcc -m32 -c kernel.c -o kc.o
;ld -m elf_i386 link.ld -o kernel kasm.o kc.o