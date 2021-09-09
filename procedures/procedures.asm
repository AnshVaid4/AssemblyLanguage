global _start

section .text

printStatement:

	mov eax, 4
	mov ebx, 1
	mov ecx, message
	mov edx, msglen
	int 0x80
	ret		;tells the eip that it's end of procedure


_start:
	
begin:
	mov ecx,5

print:
	push ecx		;saveing the value of ecx in stack bcz it will be affected in function
	call printStatement
	pop ecx			;retrieving the value of ecx bcz it will be used in loop
	loop print		;loop will check if ZF is not inabled then loop to print label again else exit. Loop and Loopne are same, Loopne nedds ZF to be unset
				;loope ZF is set and ecx is not zero bcz of which it prints only 1 time

	mov eax, 1
	mov ebx, 0
	int 0x80



section .data

	message: dw "hello ", "world  "
	msglen equ $-message 
