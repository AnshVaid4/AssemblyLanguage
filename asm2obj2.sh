#!/bin/bash
#for libc asm files to object files to executable file

echo "[+] Creating object file for " $1;
nasm -f elf32 -o $1.o $1.asm;
echo "[+] Creating executable file for " $1;
gcc -o $1 $1.o;
