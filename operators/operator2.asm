global _start

section .text
_start:
	
	;1byte (8bits)  multiplication using registers
	
	mov al, 0x0
	mov al, 0x20
	mov ebx, 0x2
	mul ebx    ;multiplied successfully
	mov al, 0x81  ;129
	mov bl, 0x2 
	mul bl     ;multiplied successfully
	mov eax,0x0
	;///mov al, 0x129 ;still on runtime this will be treated as 0x29
	mov al, 0x29
	mov ebx, 0x11223344
	        ;///mul byte [ebx]  program terminated with sigsev segmentation fault
	mul bl  ;multiplied successfully
	mov eax,0x0
	mov al, 0x81
	mul ebx  ;successfully multiplied with additional value in $edx or you can say $dx


	;byte multiplication with memory

	mov eax, 0x0
	mov ebx, 0x0
	mov edx, 0x0
	mov al, byte [var1]
	mov bl, 0xa
	mul bl
	mov eax, 0x0
	mov ebx, 0x0
	mov al, 0x20
	mul byte [var1]
	
	
	mov eax, 0x0
	mov ebx, 0x0

	
	
	;2bytes (16bits) mutiplication using register and memory(variables)

	mov ax, 0x2255
	mov bx, 0xaa3b
	mul bx
	
	mul word [var2]

	mul byte [var2]  ;didn't work well because wonly al part was multiplied instead of whole

	mul dword [var2] ;didn't work well


	mov eax, 0x0
	mov ebx, 0x0

	;4bytes (32bits) multiplication using register and memory(variables)

	mov eax, 0x445537ab
	mov ebx, 0x889b293c
	mul ebx

	mov eax, dword [var3]
	mul ebx
	
	mov eax, 0x111122ab
	mul dword [var3]

	mul byte [var3]  ;byte value al changed

	mul word [var3] ;multiplication done on only the word and dx changed

	mov eax, 0
	mov ebx, 0
	mov edx, 0





	;byte (8 bits divisor) division with register and memory

	mov ax, 0x007E
	mov bl, 0x6
	div bl

	mov ax, 0x007E + 0x1
	;mov bx, 0x6 answer was not in al and ah
	mov bl, 0x6
	div bl

	mov ax, word [var4]
	mov bl, 0x4
	div bl

	mov al, byte [var4]   ;for ax it gave error for size of operand mismatch
	mov bl, 0x4
	div bl

	mov ax, word [var4 + 0x3] ;ax became whole 0
	mov bl, 0x4
	div bl
	

	;2byte (16 bits divisor) division with register and memory

	mov dx, 0x0
	mov ax, 0x007E
	mov bx, 0x6
	div bx

	mov dx, 0x1ac
	mov ax, 0x8982
	mov bx, 0x14bd
	div bx

	mov dx, 0x1ac
	mov eax, 0x2c288982
	mov ebx, 0x14bd
	div bx

	mov edx, 0x821
	mov eax, 0x2c220000
	mov ebx, 0x14bd
	div bx
	
	mov dx, 0x1ac
	mov ax, 0x8982 + 0xd
	mov bx, 0x14bd
	div bx
	

	;4byte (32 bits divisor) division
	
	mov edx, 0x0
	mov eax, 0x0000007E
	mov ebx, 0x00000006
	div ebx

	mov edx, 0x41
	mov eax, 0x63bb8598
	mov ebx, 0x63ce58
	div ebx
	
	mov edx, 0x41
	mov eax, 0x63bb8598 + 0x27
	mov ebx, 0x63ce58
	div ebx





	mov eax, 1
	mov ebx, 0
	int 0x80	




section .data
	var1 : db 17 ;0x11 will be loaded
	var2 : dw 0x2828
	var3 : dd 0x55667788
	
	;var4 : db 0x1204 warning of byte data  exceed bounds
	var4 : dw 0x26c
