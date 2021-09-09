global _start

section .text
_start:

	;addition with register
	
	mov eax, 0x0
	add eax, 0x10
	add al, 0x10
	add al, 0x25
	add al, 0x72

	mov eax, 0x00000000
	mov eax, 0x1234
	add eax, 0x4321
	add al, 0x26

	mov eax, 0x00000000
	mov eax, 0x11223344
	add eax, 0x78
	add eax, 0x6789

	mov eax, 0x00000000
	mov eax, 0xffffffff
	add eax, 0x5


	;addition in memory

	;mov var1, 0x22   error: invalid combination of opcode and operands
	;add var1, 0x37   error: invalid combination of opcode and operands
	mov byte [var1], 0x22
	add byte [var1], 0x37
	add byte [var1], 0x23
	add byte [var1], 0x36
	add word [var1], 0x24

	mov word [var2], 0x1234
	add word [var2], 0x4321
	add byte [var2], 0x27
	add word [var2], 0xab
	add word [var2], 0xe

	mov dword [var3], 0x11223344
	add dword [var3], 0x44332211
	add byte [var3], 0x23
	add word [var3], 0x7
	
	;mov word [var3], 0xffffffff  warning: word data exceeds bounds
	mov dword [var3], 0x00000000
	mov dword [var3], 0xffffffff
	add dword [var3], 0x7
	
	mov dword [var3], 0x00000000
	mov dword [var3], 0xffffffff
	add word [var3], 0xb
	add byte [var3], 0xe
	
	;set/clear/compliment carry flag

	clc 
	stc
	cmc
	cmc
	clc


	;add with carry

	mov eax, 0x00000000
	stc
	adc eax, 0x22
	stc
	adc eax, 0x33

	mov dword [var2], 0x2343
	stc
	adc byte [var2], 0x48


	;subtract

	mov eax, 0x00000000
	mov eax, 0x10
	mov eax, 10  ;interpreted as 0xa automatically
	sub eax, 5   ;interpreted as 0x5 automatically
	stc
	sbb eax, 4
	
	mov eax, 0x00000000
	mov eax, 10  ;interpreted as 0xa automatically
	mov eax, 0x10
	sub eax, 0x5
	stc
	sbb eax, 0x4

	
	;increment and decrement
	
	inc eax
	dec eax
	dec eax
	
	mov eax, 0x00000001
	dec eax
	dec eax
	dec eax
	inc eax
	inc eax
		
	;exit
	
	mov eax, 1   ;interpreted as 0x1
	mov ebx, 0   ;interpreted as 0x0
	int 0x80	
		


section .data
	
	var1: db 0x00
	var2: dw 0x0000
	var3: dd 0x000000

