;INC for inrecementing an operand by one


SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data
    msg1 db "first number ", 0xA, 0xD
    len1 equ $ -msg1

    msg2 db "second number ", 0xA, 0xD
    len2 equ $ -msg2

    msg3 db "summary is ", 0xA, 0xD
    len3 equ $ -msg3

segment .bss

    num1 resb 2
    num2 resb 2
    res resb 1

section .text
    global _start

_start:
    mov, eax, SYS_WRITE
    mov, eax, STDOUT
    mov, ecx, msg1
    mov, edx, len1
    int 0x80; kernel

    mov, eax, SYS_READ
    mov, eax, STDIN
    mov, ecx, num1
    mov, edx, 2
    int 0x80; kernel

    mov, eax, SYS_WRITE
    mov, eax, STDOUT
    mov, ecx, msg2
    mov, edx, len2
    int 0x80; kernel

    mov, eax, SYS_READ
    mov, eax, STDIN
    mov, ecx, num2
    mov, edx, 2
    int 0x80; kernel

    mov, eax, SYS_WRITE
    mov, eax, STDOUT
    mov, ecx, msg3
    mov, edx, len3
    int 0x80; kernel


    ;converting register
    mov eax, [num1]
    sub eax, '0'

    mov ebx, [num2]
    sub ebx, '0'

    ;add eax and ebx 
    add eax, ebx   
    add eax, '0'

    ;storing summary on memmory
    mov [res], eax

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 0x80

exit:
    mov, eax, SYS_EXIT
    xor ebx, ebx
    int 0x80

;ADD
;MUL
;DIV/IDIV