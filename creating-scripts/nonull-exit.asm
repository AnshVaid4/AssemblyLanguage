global _start

section .text
_start:
	xor eax, eax    ;will bring pure 0 in it
			;mov eax, 0 will string bring 00 in it
	mov al, 1       ;not moving in $eax bcz again it will bring 0x00000001 in it. But in this case we are just replacing the al value with 0x01
	;xor ebx, ebx
	xor ebx, ebx
	mov bl, 2  ;0 will bring null character again
	int 0x80
