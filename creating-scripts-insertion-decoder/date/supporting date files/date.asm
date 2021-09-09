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

	mov al, 1
	xor ebx, ebx
	int 0x80

; section .data  ; uncomment this line to make it directly excutable
function1:

	call function2
	message db  "/bin/dateA"

