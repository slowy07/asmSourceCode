; compile nasm -f elf executeCommand.asm
; link with 64 bit system require elf_i386
; ld -m elf_i386 executeCommand.o -o executeCommand

%include    'function.asm'

SECTION     .data
command     db      'bin/echo', 0h
arg1        db      'test call', 0h
arguments   db      command
            dd      arg1
            dd      0h
environment dd      0h

SECTION .text
global _start

_start:
    mov     edx, environment
    mov     ecx, arguments
    mov     ebx, command
    mov     eax, 11
    int     80h

    call    quit