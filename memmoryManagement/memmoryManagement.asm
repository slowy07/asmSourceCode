section .text
    global _start

_start:
    mov eax, 45
    xor ebx, ebx
    int 80h

    add eax, 16384
    mov ebx, eax
    mov eax, 45
    int 80h

    cmp eax, 0
    jl exit

    mov edi, eax
    sub edi, 4      ;point to last dword
    mov ecx, 4096 ;dw allocated
    xor eax, eax
    std
    rep stosd
    cld

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 80h

exit:
    mov eax, 1
    xor ebx, ebx
    int 80h
    
section .data
msg db 'allocated 16 kb mem', 10
len equ $ -msg