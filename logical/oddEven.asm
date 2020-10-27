section .text
    global _start

_start:
    mov ax, 7h  ;create number
    mov ax, 1
    jz evnn
    mov eax, 4
    mov ebx, 1
    mov ecx, oddMsg
    mov edx, len2
    int 0x80 ;kernel
    jmp output

evnn:
    mov ah, 08h
    mov eax, 4
    mov ebx, 1
    mov ecx, evenMsg 
    mov edx, len1
    int 0x80

output:
    mov eax, 1
    int 0x80

section .data
evenMsg db 'even number' 
len1 equ $ -evenMsg

oddMsg db 'odd number'
len2 equ $ -oddMsg