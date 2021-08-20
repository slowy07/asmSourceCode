%include        'functions.asm'

SECTION .text
global  _start

_start:

    pop     ecx             ; first value on the stack is the number of arguments

nextArg:
    cmp     ecx, 0H         ; check to see if we have any arguments left
    jz      noMoreArgs      ; if zero flag is set jump to noMoreArgs label (by jumping over the end of the loop)
    pop     eax             ; pop the next argument off the stack
    call    sprintlf        ; call our print with linefeed function
    dec     ecx             ; decrease edi (number of arguments left) by 1
    jmp     nextArg         ; jump to nextArg label

noMoreArgs:
    call    quit
