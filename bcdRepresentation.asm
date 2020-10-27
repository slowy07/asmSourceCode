section .text
    global _start

_start:

    mov esi, 4
    mov ecx, 5
    clc

addLooping:
    mov al, [num1 + esi]
    adc al, [num2 + esi]
    aaa
    pushf 
    or  al, 30h
    popf

    mov [sum + esi], al
    dec esi
    loop addLooping

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 5
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

section .data
msg db "summary :", 0xA
len equ $ -msg
num1 db '22411'
num2 db '22511'
sum db '    '

;output
;summary
;44922