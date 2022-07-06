	area TheData, DATA, readonly
addr1	DCB 	"hello world", 0; the first location of the string
D	equ 0x40000000; the first location of the encrypted string
E 	equ 0x40001008; the first location of the decrypted string
F 	equ 0xFFFFFFFF
Z 	equ 0x00000000
	
	
	area aEncryption, code, readonly
	ENTRY
	LDR 	r0, =addr1; r0 = the address of the string
	LDR 	r1,= D; r1 = the address of the encrypted string
looping		LDRB	r2,[r0]; starting a loop to store the encrypted string
	MOVS 	r3,r2; set the zero flag
	ROR 	r2,r2,#2; Rotate the value in r2 to the right by 2
	add 	r0,r0,#1; go to the address of the next character of the string
	STR 	r2,[r1]; store the encrypted character in 32 bits, because the rotate goes on 32 bits
	add 	r1,r1,#4; point at the next memory address after 4 cells to save the next encrypted character in
	BNE		looping; loop end when Z flag = 0
	LDR		r4,= F; when r4=FFFFFFFF, that means that all the string characters are encrypted
	END
		