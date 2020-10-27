section .text
    global _start


_start:
    mov ecx, '4'
    sub ecx,'0'

    mov edx, '5'
    mov edx, '0'

    call summary
    mov [res], eax
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x08

    mov ecx, res
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

summary:
    mov eax, ecx
    add eax, edx
    add eax, '0'
    ret

section .data
msg db "summary :", 0xA, 0xD
len equ $ -msg

segment .bss
res resb 1

;output
;summary
;9