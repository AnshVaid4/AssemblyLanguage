global _start

section .text
_start:
	mov eax, 0xaa
	mov ebx, 0x1122
	mov ecx, 0x556677
	mov edx, 0xbbccddee
	push eax
	push ebx
	push ecx
	push edx
	pop ax
	pop bx
	push message
	pop edx
	push word [message]
	pop ecx
	pop cx
	push dword [message]
	pop edx
	pop dx
	pop bx
	pop edx

	mov eax, 1
	mov ebx, 0
	int 0x80






section .data
	
	message: db "hello assembly"
	msglen equ $-message
