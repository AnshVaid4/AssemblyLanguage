#!/bin/bash

echo "[+] Compiling the file shellcode.c with gcc";
echo "[+] Creating executable file for " $1;
gcc -fno-stack-protector -z execstack -o $1 shellcode.c 
