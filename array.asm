section .text
    global _start

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, x

top: add ebx, [ecx]
    add ecx, 1 ;pointer next elemen
    dec eax ;decrement 
    jnz top ;if count not 0, then looping 

done:
    add ebx, '0'
    mov [sum], ebx ;store the result 

display:

    mov edx, 1
    mov ecx, sum
    mov eax, 4
    int 0x80
    
    mov eax, 1
    int 0x80

section .data
global x
x:
    db 3
    db 1
    db 2

sum:
    db 0

;output
;6