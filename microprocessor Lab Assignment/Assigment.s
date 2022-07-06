;The semicolon is used to lead an inline documentation
;When you write your program, you could have your info at the top document block
;For Example: Your Name, Student Number, what the program is for, and what it does 
;etc.
; This program will find the sum of an array.
;;; Directives
 PRESERVE8
 THUMB 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 AREA RESET, DATA, READONLY
 EXPORT __Vectors
__Vectors 
 DCD 0x20001000 ; stack pointer value when stack is empty
 DCD Reset_Handler ; reset vector
 
 ALIGN
 
;Your Data section
;AREA DATA
SUMP DCD SUM
N DCD 5
NUM1 DCD 3, -7, 2, -2, 10
POINTER DCD NUM1
	AREA MYRAM, DATA, READWRITE
SUM DCD 0
; The program
; Linker requires Reset_Handler


	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
	LDR R0, N 
	LDR R1, POINTER
	LDR R2, [R1]
	SUB R0,R0,#1 
	mov R3, R2
	ADD R1,R1,#1
	LDR R2, [R1]
	SUB R0,R0,#1
	SUB R4,R3,R2
	BPL tryD
	SUB R4,R3,R2
	BMI tryA
	SUB R0,R0,#1
tryD
	mov R3, R2
	ADD R1,R1,#1
	LDR R2, [R1]
	SUB R4,R2,R3
	BMI not
	SUB R0,R0,#1
	BNE tryD
	mov R10, #2
tryA
	mov R3, R2
	ADD R1,R1,#1
	LDR R2, [R1]
	SUB R4,R3,R3
	BMI not
	SUB R0,R0,#1
	BNE tryA
	mov R10, #1
	B STOP
not
	mov R10, #3
STOP
	B STOP
		
	END
			
		