section .text
    global _start

section .data
    fileName db 'impFile.txt', 0h
    contetFile db 'make magic!, 0h

section .bss
    fileContent resb 255

_start:
    mov ecx, 077
    mov ebx, fileName
    mov eax, 8
    int 80h
    
    mov edx, 12
    mov ecx, contetFile
    mov ebx, eax
    mov eax, 4
    int 80h

    mov ecx, 0
    mov ebx, fileName
    mov eax, 5
    int 80h

    mov edx, 12
    mov ecx, fileContent
    mov ebx, eax
    mov eax, 3
    int 80h

    mov eax, fileContent
    call sprintLF

    call quit