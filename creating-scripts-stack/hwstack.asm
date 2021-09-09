;hello world program
;Sytem calls are defined in /usr/include/i386-linux-gnu/asm/unistd_32.h file
;to find the usage of it, use man 2 <system call name> to get the functioning

global _start                       

section .text                       
_start:                             

	xor eax, eax
	mov al, 0x4                
              
	xor ebx, ebx                       
	mov bl, 0x1                

	xor edx, edx
		
	push edx
	push 0x0a21646c
	push 0x726f7720
	push 0x6f6c6c65
	push 0x68

	mov ecx, esp
	
        mov dl, 0xf + 0x1
	int 0x80    

	xor eax, eax
	mov al, 0x1   
	int 0x80      


	       
