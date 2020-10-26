;db = define byte allocating 1 byte
;dw = define word allocationg 2 byte
;dd = define double word allocating 4 byte
;dq = define quadword allocating 8 byte
;dt = define ten bytes allocating 10 byte


section .text
    global _start

_start: 
    mov edx, 1 ;mesage len
    mov ecx, choice ;mesasge to write
    mov ebx, 1 ;file for standard input ouput(stdout)
    mov eax, 4
    int 0x80 ;kernel

    mov eax, 1
    int 0x80

section .data
choice DB 'L'