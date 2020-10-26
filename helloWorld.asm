section .text
    global _start

_start:
  mov edx, len
  mov ecx, msg ;message write to program
  mov ebx, 1
  mov eax, 4
  int 0x80 ;kernel

  mov eax, 1 ;for exit
  int 0x80 ;kernel
  
section .data
msg db 'Hello world', 0xa ;output
len equ $ -msg 
  
