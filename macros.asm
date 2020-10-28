%macro writeString 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .text
    global _start

_start:
    writeString msg1, len1
    writeString msg2, len2
    writeString msg3, len3

    mov eax, 1
    int 0x80

section .data
msg1 db 'zulkepretes make powerfull coding', 0xA, 0xD
len equ $ -msg1

msg2 db 'slower make powerfull coding', 0xA, 0xD
len equ $ -msg2

msg3 db 'marely', 0xA, 0xD
len equ $ -msg3

;ouput
;zulkepretes make powerfull coding
;slower make powerfull coding 
;marely