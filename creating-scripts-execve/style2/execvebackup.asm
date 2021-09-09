global _start

section .text

_start:
	jmp function


function2:
	pop esi

	xor eax, eax
	mov byte [esi + 7], al
	mov dword [esi + 8], esi
	mov dword [esi + 12], eax
	mov dword [esi + 16], eax

	mov al, 11
	
	xor ebx, ebx
	mov ebx, esi

	xor ecx, ecx
	lea ecx, [esi + 8]

	xor edx, edx
	lea edx, [esi + 16]
	int 0x80


	xor eax, eax
	mov al, 1
	int 0x80
	
	





function:
	call function2
	message: db "/bin/sh"
