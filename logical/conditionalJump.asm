section .text
    global _start

_start:
    mov ecx, [num1]
    mov ecx, [num2]
    jg checkThirdNum
    mov ecx, [num2]


checkThirdNum:
    cmp ecx, [num3]
    jg _exit
    mov ecx, [num3]

_exit:
    mov [largest], ecx
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80 ;kernel

    mov ecx, largest
    mov edx, 2
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 80h

section .data
    msg db "largest number is: " 0xA, 0xD
    len  equ $ -msg
    num1 dd '52'
    num2 dd '37'
    num3 dd '41'

;ouput 
;largest number is
;52