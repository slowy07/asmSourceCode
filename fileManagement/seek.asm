section .text
    global _start

section .data
    fileName db 'impFile.txt', 0h
    contentFile db 'make magic! --res--', 0h

_start:
    mov ecx, 1
    mov ebx, fileName
    mov eax, 5
    int 80h

    mov edx, 2
    mov ecx, 0
    mov ebx, eax
    mov eax, 19
    int 80h

    mov edx, 9
    mov ecx, contentFile
    mov eax, 4
    int 80h

    call quit
