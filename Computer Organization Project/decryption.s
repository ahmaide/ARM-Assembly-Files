	area MyData, DATA, readonly
addr1	DCB 	"hello world", 0
D	equ 0x40000000; the first location of the encrypted string
E 	equ 0x40001008; the first location of the decrypted string
F 	equ 0xFFFFFFFF
Z 	equ 0x00000000
	
	area bDecryption, code, readonly
	ENTRY
	LDR 	r1, = D; the address of the encrypted string
	LDR 	r2, = E; the address of the decrypted string
	LDR 	r4, = Z; set r4=0
looping2 	LDR 	r3,[r1]; starting a loop to store the decrypted string
	ROR 	r3,r3,#30; Rotate the value in r2 to the right by 30 (which is the same as to the left by 2)
	MOVS 	r4,r3; set the zero flag
	add 	r1,r1,#4; increase r1 so it points on the location of the next encrypted character
	STRB 	r3,[r2]; store the decrypted character in r3 in the memory location that is in r2
	add 	r2,r2,#1; r2 will point at the next memory location to store the next decrypted character
	BNE 	looping2; end of the loop when Z flag = 0
	LDR 	r5,= F; when r4=FFFFFFFF, that means that all the string characters are decrypted
here 	B 	here; stay here
	END