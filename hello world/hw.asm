;hello world program
;Sytem calls are defined in /usr/include/i386-linux-gnu/asm/unistd_32.h file
;to find the usage of it, use man 2 <system call name> to get the functioning

global _start                        ;to tell the we are going to use _start as our entry point

section .text                        ;all the code of program is present in text section
_start:                              ;to mark the entry point of program

	mov eax, 0x4                 ;we want to write hello world, which is complicated task, you will write a code to print, rather use a system call. System call provide interface
                                     ;for user space program to request kernel to perform complex task. Therefore hex 4 is the value of. Write function has 3 arguments
                                     ;Each argument is stored in one register. If there are more arguments then use class 
	mov ebx, 0x1                 ;1st argument is fie descriptor. 0 for input, 1 for output, 2 for error
	mov ecx, message             ;2nd argument is buffer, i.e. the string you need to print
	;mov edx, 12                 ;3rd argument is length of buffer, you can count it by yourself
        mov edx, mlen                ;OR you can use this shortcut
	int 0x80                     ;interrupt to invoke system call. Which system call? the one with number 4.

                                     ;the program need an exit point
	mov eax, 0x1                 ;the system call for exit is 1
	mov ebx, 0x0                 ;1st argument of exit function is the return value
	int 0x80                     ;interrupt to execute the system call


section .data                        ;all the initialized data is put in data section
	message: db "hello world!"   ;message is a label, db is define byte with which we define a series of byte which nasm understands
	mlen equ $-message           ;to find the length of the message string
