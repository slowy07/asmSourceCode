section .text
    global _start

_start:
    mov bx, 3
    call procFact
    add ax, 30h
    mov [fact], ax


    mov edx, len
    mov ecx, msg
    mov ebx, 1 
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, fact
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

procFact:   
    cmp bl, 1
    jg doCalculation
    mov ax, 1
    ret

doCalculation:
    dec bl
    call procFact
    inc bl
    mul bl ;ax = al * bl
    ret 

section .data
msg db "summaary factorial 3 :", 0xA
len equ $ -msg

section .bss
fact resb 1

;ouput
;summary factorial 3 :
;6