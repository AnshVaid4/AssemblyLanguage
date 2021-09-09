global _start

section .text

printStatement:

	push ebp	;pushing the current value of ebp to mark that the group of 32 bits memory have to be restored to registers on return
	mov ebp, esp	;ebp is just to take the backup value of current stack position $esp, so that if in the end the stack is not at same position, it could be brought
                        ;to same position using ebp

	;enter           ;prologue

	
	;to change the current pointer of stack i.e. $esp
	
	mov eax, 1352
	push eax
	mov edx, 0xaabbcc11
	push edx

	
	;normal code to print hello world

	mov eax, 4
	mov ebx, 1
	mov ecx, message
	mov edx, msglen
	int 0x80

	mov esp, ebp
	pop ebp
	;leave           ;epilogue

	ret		;tells the eip that it's end of procedure


_start:
	
begin:
	mov ecx,5

print:
	pushad		;preserving the registers' state
	pushfd		;preserving the flags' state
	call printStatement
	popfd
	popad
	loop print		;loop will check if ZF is not inabled then loop to print label again else exit. Loop and Loopne are same, Loopne nedds ZF to be unset
				;loope ZF is set and ecx is not zero bcz of which it prints only 1 time

	mov eax, 1
	mov ebx, 0
	int 0x80



section .data

	message: dw "hello ", "world  "
	msglen equ $-message 
