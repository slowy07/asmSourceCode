;hardocode multiple 4 * 4 = 16


section .text
    global _start

_start:
    mov al, '4'
    sub al, '0'

    mov bl, '4'
    sub bl, '0'

    mul bl
    add al, '0'
    
    mov [res], al
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80 ;kernel

    mov ecx, res
    mov edx, 1
    mov ebx, 4
    mov eax, 4
    int 0x80
    
    mov eax, 1
    int 0x80

section .data
msg db "summary 4 * 4 is :", 0xA, 0xD
len equ $ -msg

segment .bss
res resb 1 