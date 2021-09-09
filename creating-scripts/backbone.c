#include <stdio.h>
#include <string.h>

unsigned char code [] = "\x31\xc0\xb0\x01\x31\xdb\xb3\x02\xcd\x80";

main()
{
	printf("Shell code length is %d \n", strlen(code));
	int (*ret)() = (int (*)())code;
	ret();
}

