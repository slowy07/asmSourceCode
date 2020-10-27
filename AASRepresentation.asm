section .text
    global _start

_start:
    sub ah, ah
    sub al, '4'
    sub al, '3'
    aas 
    or al, 30h
    mov [result], ax

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80 ;kernel

    mov edx, 1 
    mov ecx, result
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    mov eax, 1
    int 0x80

section .data
msg db "result :", 0xA
len equ $ -msg
section .bss
res resb 1

;ouput 
;result :
; 1