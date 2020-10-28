section .text
    global _start

section .data
    fileName db 'impFile.txt', 0h
    contentFile db 'make magic!, 0h

_start:
    mov ecx, 0777
    mov ebx, fileName
    mov eax, 8
    int 80h
    
    mov edx, 12
    mov ecx, contentFile
    mov ebx, eax
    mov eax, 4
    int 80h

    mov ecx, 0
    mov ebx, fileName
    mov eax, 5
    int 80h

    call iprintLF
    call quit
