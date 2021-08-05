; compile
; nasm -f elf lineFeed.asm
; link 64 bit
; ld -m elf_i386 lineFeed.o -o lineFeed
; ./lineFeed

%include    'function.asm'

SECTION .data
msg1    db      'Alice in the wonderland', 0h
msg2    db      'This why get name', 0h


SECTION .text
global _start

_start:
    mov     eax, msg1
    call    sprintlf

    mov     eax, msg2
    call    sprint
    
    call    quit
    