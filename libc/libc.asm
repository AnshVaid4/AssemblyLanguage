extern printf	;to have the understanding of printf, use man 3 printf
extern exit

global main

section .text
main:
	
	mov ebp, esp   ;to save the current stack address
	push message
	call printf
	mov esp, ebp   ;restore to previous option or els  add esp, 4

	call exit


section .data
	
	message: db "hello world" , 0xa
