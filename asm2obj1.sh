#!/bin/bash
#for normal asm file 2 object file to executable file

echo "[+] Creating object file for " $1;
nasm -f elf32 -o $1.o $1.asm;
echo "[+] Creating executable file for " $1;
ld -o $1 $1.o;
