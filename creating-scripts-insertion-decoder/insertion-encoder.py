shellcode=(b"\x62")
encoded = ""
encoded2= ""

print("Encoded shellcode")

for x in bytearray(shellcode):
    #y=x^0xAA
    encoded = encoded + "\\x"
    encoded = encoded + ("%02x" % x)
    encoded = encoded + ("\\x%02x" % 0xAA)

    encoded2 = encoded2 + "0x"
    encoded2 = encoded2 + ("%2x," % x)
    encoded2 = encoded2 + ("0x%02x," % 0xAA)

print(encoded)
print(encoded2)

print("Length of encoded string is " + str(len(bytearray(shellcode))))
