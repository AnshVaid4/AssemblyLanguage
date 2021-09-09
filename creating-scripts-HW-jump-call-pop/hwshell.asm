;hello world script program
;Sytem calls are defined in /usr/include/i386-linux-gnu/asm/unistd_32.h file
;to find the usage of it, use man 2 <system call name> to get the functioning

global _start                        ;to tell the we are going to use _start as our entry point

section .text                        ;all the code of program is present in text section


_start:                              ;to mark the entry point of program
	
	jmp  print                   ;intensionally kept jump above getmessage label, otherwise the jump statement had to jump only one line if I keep it above the print label
				     ;a null character was being added there, since it had to jump to next line itself. But now it has to jump few lines which eradicates null
				     ;character


getmessage:

	pop ecx			    ;Getting the dynamic address of message in ecx
	
	xor edx, edx
	mov dl, 13		    ;This time I am not passing a variable for length of message. Replacing lower bits of $edx with 13
	int 0x80                     ;interrupt to invoke system call. Which system call? the one with number 4.
	
	xor eax, eax
	mov al, 0x1                 ;replacing lower bits of $eax with 1
	xor ebx, ebx
	int 0x80                     ;interrupt to execute the system call for exit


print:
	
	xor eax, eax
	mov al, 0x4                 ;we want to write hello world, which is complicated task, you will write a code to print, rather use a system call. System call provide interface
                                     ;for user space program to request kernel to perform complex task. Therefore hex 4 is the value of. Write function has 3 arguments
                                     ;Each argument is stored in one register. If there are more arguments then use class 
	xor ebx, ebx
	mov bl, 0x1                 ;1st argument is fie descriptor. 0 for input, 1 for output, 2 for error
	

	call getmessage		    	  ;As soon as it is called, the next line address is pushed in the stack
	message: db "hello world!", 0xA   ;message is a label, db is define byte with which we define a series of byte which nasm understands

