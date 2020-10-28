section .text
    global _start

section .data
    fileName db 'impFile.txt', 0h
    fileContent db 'make magic!, 0h

section .bss
    fileContent resb 255

_start:
    mov ecx, 0777
    mov ebx, filename
    mov eax, 8
    int 80h

    mov edx, 12
    mov ecx, fileContent
    mov eax, 8
    int 80h

    mov edx, 0
    mov ebx, fileName
    mov ebx, eax
    mov eax, 3
    int 80h
    
    mov eax, fileContent
    call sprintLF

    mov ebx, ebx
    mov eax, 6
    int 80h

    call quit