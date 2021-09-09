
global _start

section .text
_start:

	;and operation
	
	mov eax, 0x1
	mov ebx, 0x0
	and eax, ebx

	mov al, 0x01
	and al, 0x02

	and byte [var1], 0xa2
	and byte [var1], al

	mov ax, 0x5601
	and ax, word [var2]

	mov eax, 0x11004a62
	and dword [var3], eax

	
	mov byte [var1], 0xa1
	mov word [var2], 0x1aa1
	mov dword [var3], 0x112700a4



	;or operation

	mov eax, 0x1
	mov ebx, 0x0
	or eax, ebx

	mov al, 0x01
	or al, 0x02

	or byte [var1], 0xa2
	or byte [var1], al

	mov ax, 0x5601
	or ax, word [var2]

	mov eax, 0x11004a62
	or dword [var3], eax

	
	mov byte [var1], 0xa1
	mov word [var2], 0x1aa1
	mov dword [var3], 0x112700a4

	
	;xor operation

	mov eax, 0x1
	mov ebx, 0x0
	xor eax, ebx

	mov al, 0x01
	xor al, 0x02

	or byte [var1], 0xa2
	xor byte [var1], al

	mov ax, 0x5601
	xor ax, word [var2]

	mov eax, 0x11004a62
	xor dword [var3], eax


	mov byte [var1], 0xa1
	mov word [var2], 0x1aa1
	mov dword [var3], 0x112700a4



	;not operation

	mov eax, 0x1
	mov ebx, 0x0
	not eax
	not ebx

	mov al, 0x01
	not al
	mov al, 0x02
	not al
	not al

	not byte [var1]
	not byte [var1]

	mov ax, 0x5601
	not ax
	not word [var2]

	mov eax, 0x11004a62
	not dword [var3]
	not eax

	
	;miscelanious depending on data length
	
	mov byte [var1], 0xa1
	mov word [var2], 0x1aa1
	mov dword [var3], 0x112700a4
	
	
	mov eax, 0x11223344
	mov ebx, 0xa2b68890
	;or eax, bh invalid combination of operands
	or eax, 0x33
	
	mov eax, 0x11223344
	mov ebx, 0xa2b68890
	;or ax, ebx invalid combination of operands
	or ebx, 0x4455

	;end
	mov eax, 1
	mov ebx, 0
	int 0x80


section .data
	var1: db 0xa1
	var2: dw 0x1aa1
	var3: dd 0x112700a4
