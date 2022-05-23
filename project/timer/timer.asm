[org 0x0100]

    jmp start

hrs: dw 0
min: dw 0
s: dw 0
ms: dw 0

;Lop time
lhrs: dw 0
lmin: dw 0
ls: dw 0
lms: dw 0

oldkb: dd 0

sMode: db 0
lMode: db 0

;flags for other function

startTimer: db 0
snapshot: db 0
lapTime: db 0

location: db 6


; clear screen 
clrscr: pusha
    push es

    mov ax, 0xb800
    mov es, ax
    xor di, di
    mov ax, 0x720
    mov cx, 2000
    cld
    rep stosw
    pop es
    popa
    ret

; print lyout
printLayout: pusha
    push es
    mov ax, 0x8800
    mov es, ax

    mov di, 160

    mov byte[es:di+0], 'H'
    mov byte[es:di+2], 'R'
    mov byte[es:di+4], 'S'

    mov byte[es:di+8], ':'

    mov byte[es:di+12], 'M'
    mov byte[es:di+14], 'I'
    mov byte[es:di+16], 'N'

    mov byte[es:di+20], ':'
    mov byte[es:di+24], 'S'
    mov byte[es:di+26], ':'

    mov byte[es:di+34], 'M'
    mov byte[es:di+36], 'S'

    pop es
    popa
    ret

kbisr: push ax
    in al, 0x60
    cmp al, 147

    jz reset
        jnz modChanger

reset:
    mov word [cs:hrs], 0
    mov word [cs:min], 0
    mov word [cs:s], 0
    mov word [cs:ms], 0

    ;Resetting the lap time
    
    mov word [cs:lhrs], 0
    mov word [cs:lmin], 0
    mov word [cs:ls], 0
    mov word [cs:lms], 0

    call clrscr

    mov byte [cs:location], 6

    jmp EOI1

modChanger: cmp al, 170
    jnz checkMode1

    mov byte[cs:lMode], 0
     
    cmp byte[cs:sMode], 1
    jz EOI1

    mov byte[cs:sMode], 1
    jmp EOI1

checkMode1: cmp al, 182
    jnz startTime
    mov byte[cs:sMode], 0