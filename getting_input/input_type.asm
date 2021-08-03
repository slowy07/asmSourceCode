;getting input
;nasm -f elf input_type.asm
;64 bit system require elf_i386 ld -m elf_i386 input_type.o -o input_type
;./input_type

%include  'functions.asm'

SECTION .data
msg1 db     'enter your name: ', 0h
msg2 db     'hello,  ', 0h


SECTION .bss
sinput: resb 255 ;reserve a 255 byte space in memory for the user imput string

SECTION .text
global _start


_start:
    mov     eax, msg1
    call    sprint
        
        mov  edx, 255 ; number of byte of read
        mov  ecx, sinput ; reserved space to store input
        mov  ebx, 0 ;write the stdin file
        mov  eax, 3 ;invoke sys_read (kernel opcode 3)
        
    int 00h
    
    mov eax, msg2
    call sprint
    
    mov eax, sinput ; move bufer into eax
    call sprint ; call out print


    call quit