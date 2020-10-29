    BITS 16

start:
    mov ax, 07C0h
    add ax, 288
    mov ss, ax
    mov sp, ax

    mov si, textString
    call printString

    jmp $

    textString db 'my first OS !, 0

printString:
    mov ah, 0Eh

.repeat:
    lodsb
    cmp al, 0
    je .done
    int 10h
    jmp .repeat

.done:
    ret
    times 510-($-$$) db 0
    dw 0xAA55

;building
;nasm -f bin -o first.bin first.asm