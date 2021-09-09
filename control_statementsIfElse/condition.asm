global _start

section .text
_start:
	
	jmp begin
	
	;never executed

	mov eax, 0x25
	add eax, 0x23ab889c
	
	mov eax, 1
	mov ebx, 0
	int 0x80

never_executed:
	
	mov eax, 0x25
	mov bl, 0x20
	mul bl

begin:

	mov eax, 0x5

printHW:
	
	push eax

	;System call for changing ownership of file
	;mov eax, 182
	;mov ebx, path
	;mov ecx, 1000
	;mov edx, 1000
	;int 0x80

	;System call for printing hello world on screen
	mov eax, 4
	mov ebx, 1
	mov ecx, message
	mov edx, mlen
	int 0x80

	pop eax
	dec eax
	jnle printHW

	mov eax, 1
	mov ebx, 0
	int 0x80

section .data

	message: db "hello ","world "
	mlen equ $-message
	path: db "./operator2.asm"
