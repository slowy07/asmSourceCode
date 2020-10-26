section	.text
   global _start    ;
	
_start:             
   mov	ax,'16'
   sub     ax, '0'
	
   mov 	bl, '2'
   sub     bl, '0'
   div 	bl
   add	ax, '0'
	
   mov 	[res], ax
   mov	ecx,msg	
   mov	edx, len
   mov	ebx,1	
   mov	eax,4	
   int	0x80	
	
   mov	ecx,res
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
   mov	eax,1	;system call number (sys_exit)
   int	0x80	;call kernel
	
section .data
msg db "The result is:", 0xA,0xD 
len equ $- msg   
segment .bss
res resb 1