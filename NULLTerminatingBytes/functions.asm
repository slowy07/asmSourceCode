; string message
; string len function

slen:
    push    ebx
    push    ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    jnc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret

; print function
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    slen

    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret

;exit
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret