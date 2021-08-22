%include    'function.asm'

SECTION .data
childMsg    db  'this is the child process', 0h
parentMsg   db  'this parent process', 0h

SECTION .text
global _start

_start:
    mov     eax, 2
    int     80h
    
    cmp     eax, 0
    jz      child

parent:
    mov     eax, parentMsg
    call    sprintlf
    
    call    quit

child:
    mov     eax, childMsg
    call    sprintlf

    call    quit