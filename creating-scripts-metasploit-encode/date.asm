global _start


section .text


_start:
	jmp function1

function2:
	pop ebx
	
	xor eax, eax
	push eax
	mov ebp, esp	

	mov byte [ebx + 9], al

	push ebx
	mov ecx, esp

	mov edx, ebp

	mov al, 11
	int 0x80

function1:

	call function2
	message db  "/bin/dateA"
