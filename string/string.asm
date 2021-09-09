global _start

section .text

_start:
	
	mov ecx, str1len
	lea esi, [string1]      ;load effective address, for this use [] to get the address   MOV ALSO WORKED
	lea edi, [destination]
	cld
	rep movsb               ;repeat string operation prefix. movsb moves byte by byte(0xab) so strlen can be used in $ecx, but movsw will move word by word(0xabab) and movsdb
				;moves dword by dword(0xabababab) to destination, so in those case the $ecx will will str1len/2 and str2len/4 as $ecx value otherwise it will create
				;a blunder. Therefore movsd will moves fastest to destination, movsw faster to destination and movsb slowest of all to destination. 
				;$ecx is counter register. 

	mov eax, 4
	mov ebx, 1
	mov ecx, destination
	mov edx, dstlen
	int 0x80


comparision:
	
	mov ecx, str1len
	lea esi, [string1]
	lea edi, [destination]
	repe cmpsb

	jz e_qual
	jmp notequal
	

e_qual:

	mov ecx, equal
	mov edx, equallen
	jmp print



notequal:

	mov ecx, nequal
	mov edx, nequallen
	jmp print


print: 
 
	mov eax, 4
	mov ebx, 1
	int 0x80
	

	mov eax,1
	mov ebx,0
	int 0x80

section .data
	
	string1: db "hello world", 0xA
	str1len equ $-string1

	string2: db "hello World", 0xA
	str2len equ $-string2

	equal: db "Strings are equal", 0xA
	equallen equ $-equal

	nequal: db "Strings are not equal", 0xA
	nequallen equ $-nequal


section .bss
	
	destination: resb 100
	dstlen equ $-destination
