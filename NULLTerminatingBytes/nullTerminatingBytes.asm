; compile
; nasm -f elf nullTerminatingBytes.asm
; link (64 bit system require elf_i386) ld -m elf_i386 nullTerminatingBytes.o -o nullTerminatingBytes


%include 'function.asm'

SECTION .data
msg1    db  'this print will be output', 0Ah, 0h
msg2    db  'this is how recycle in nasm', 0Ah. 0h

SECTION .text
global _start

_start:
    mov     eax, msg1
    call    sprint

    mov     eax, msg2
    call    sprint
    
    call    quit