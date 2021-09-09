global _start

section .text
_start:
	
	;immediate data to register

	mov eax, 0xAA
	mov al, 0xFF
	mov ah, 0x33
	mov ax, 0x1122

	mov ebx, 0xAABBCCDD
	mov bl, 0xEE
	mov bh, 0xBB
	mov bx, 0xAABB


	mov ecx, 0
	mov edx, 0
	
	;move register to register

	mov ebx, eax
	mov cl, al
	mov ch, ah
	mov cx, ax

	mov eax, edx
	mov ebx, edx
	mov ecx, edx




	;move from memory to register

	mov eax, [message]
	mov eax, [message +1]
	mov bl, [message]
	mov bh, [message +1]
	mov bx, [message]
	mov ebx, [message]



	;mov from register to memory

	mov eax, 0x11223344
	mov byte [message], al
	mov word [message], ax
	mov dword [message], eax



	;mov immediate value to memory

	mov dword [message], 0x11223344



	;lea demo

	lea eax, [message]
	lea ebx, [eax]



	;swapping demo

	mov eax, 0xAABBCCDD
	mov ebx, 0x66778899

	xchg eax, ebx



	;exit program

	mov eax, 1
	mov ebx, 0
	int 0x80



section .data

	message: db 0x11, 0x55, 0x99, 0xaa, 0xbb, 0xcc, 0xee
