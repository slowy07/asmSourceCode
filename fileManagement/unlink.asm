section .text
    global _start

section .data
    fileName 'impFile.txt', 0h


_start:
    mov ebx, fileName
    mov eax, 10
    int 80h

    call quit