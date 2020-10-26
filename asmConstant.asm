SYS_EXIT equ 1
SYS_WRITE equ 4
STDIN   equ 0
STDOUT equ 1

section .text
    global _start

_start:
    mov, eax, SYS_WRITE
    mov, ebx, STDOUT
    mov, ecx, msg1
    mov, edx, len1 
    int 0x80 ;kernel

    mov, eax, SYS_WRITE
    mov, ebx, STDOUT
    mov, ecx, msg2
    mov, edx, len2 
    int 0x80 ;kernel
    
    mov, eax, SYS_WRITE
    mov, ebx, STDOUT
    mov, ecx, msg3  
    mov, edx, len3 
    int 0x80 ;kernel
    
    mov, eax, SYS_EXIT
    int 0x80 ;kernel

section .data
msg1 db 'zulkeprets', 0xA, 0xD
len1 equ $ -msg1

msg2 db 'jole', 0xA, 0xD
len2 equ $ -msg2

msg3 db 'sloway' 0xA, 0xD
len3 equ $ -msg3


;output 
;zulkeprets
;jole
;sloway