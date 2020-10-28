section .text
    global _start

_start:
    mov eax, 8
    mov ebx, fileName
    mov ecx, 0777
    int 0x80

    mov [fdOut], eax
    mov edx, len
    mov ecx, msg
    mov ebx, [fdOut]
    mov eax, 4
    int 0x80

    mov eax, 6
    mov ebx, [fdOut]


    mov eax, 4
    mov ebx, 1
    mov ecx, MessageDone
    mov edx, lenDone
    int 0x80 ;kernel

    mov eax, 5
    mov ebx, fileName
    mov ecx, 0
    mov edx, 0777
    int 0x80

    mov [fdIn], eax

    ;read file
    mov eax, 3
    mov ebx, [fdIn]
    mov ecx, info
    mov edx, 26
    int 0x80
    
    ;close file
    mov eax, 6
    mov ebx, [fdIn]
    int 0x80
    
    ;print info
    mov eax, 4
    mov ebx, 1
    mov ecx, info
    mov edx, 26
    int 0x80

    mov eax, 1
    int 0x80

section .data
fileName db 'myFile.txt'
msg db 'welcome bulk'
len equ $ -msg

MessageDone db 'Written to file', 0xA
lenDone equ $ -MessageDone

section .bss
fdOut resb 1
fdIn resb 1
info resb 26