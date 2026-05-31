;Adner Ramos
;Experiment 4.1 using XCHG

CODE SEGMENT
ASSUME CS:CODE

X2Y2:	MUL AX;X^2
	XCHG AX, BX
	MOV CX, DX
	MUL AX; Y^2
	ADD AX, BX
	MOV BX, AX
	ADD DX, CX
	MOV AX, DX
	RET
	