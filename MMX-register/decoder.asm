;the program has been created to display the date by decoding its opcode which was encoded with xor operator with 0xaa byte using encoding.py. Since I have used section .data in this
;so it can be directly executed without the use of C program


global _start

section .text

_start:
	xor eax, eax
	jmp function1

function2:
	pop esi
	
	lea eax, [esi +8]
	xor ecx, ecx
	mov cl, 5

labelloop:
	
	movq mm0, qword [esi]	   ;there are 8 mmx registers	from mm0 to mm7
	movq mm1, qword [eax]
		
	;pxor qword [eax], mm0     ;is invalid statement because operands should be of same size in xor

	;pxor qword[eax], qword [esi] invalid
	
	pxor mm1, mm0  
	movq qword [eax], mm1      ;You need to again because mm0 and mm1 just have the value, and since pxor qword [eax], mm0  can't be used, therefore the changes have
				   ;to be done manually by moving the output to eax register back
				
	;jz encoded
	add eax, 8
	loop labelloop
	
	jmp encoded

section .data
function1:
	call function2
	decode: db 0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa
	encoded: db 0x41,0xb8,0xf1,0x9b,0x6a,0xfa,0x23,0x4f,0x22,0xe9,0xa3,0xf9,0x23,0x4b,0x23,0x40,0x1a,0xa1,0x67,0x2a,0x42,0x43,0x55,0x55,0x55,0x85,0xc8,0xc3,0xc4,0x85,0xce,0xcb,0xde,0xcf,0xeb ;,0xaa  can't use this technique cz the length will always not be in the multiple of 8 bytes
