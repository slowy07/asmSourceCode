section .text
    global _start
section .data
    fileName db 'impFile.txt' ;create filename

_start:
    mov ecx, 0777
    mov ebx, fileName
    mov eax, 8
    int 0x80
    call quit

;once execute 
;file 'impFile.txt' will be create

