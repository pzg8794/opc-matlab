;JOB 8
;Lab #8
;Jose Taveras

	DATA SEGMENT

BIT_WEIGHT	DW	1
		DW	2
		DW	4
		DW	8
		DW	10
		DW	20
		DW	40
		DW	80
		DW	100
		DW	200
		DW	400
		DW	800
		DW	1000
		DW	2000
		DW	4000
		DW	8000


DATA ENDS

CODE SEGMENT

ASSUME  CS:CODE,DS: DATA

START:	MOV DX, AX
	MOV AX, DATA
	MOV DS, AX
	LEA SI,BIT_WEIGHT
	MOV CX,10H 	;SETTING COUNTER TO 16
	XOR BX,BX  	;CLEAR BX
	MOV AX,DX
OVER:	ROR AX,1   	;ROTATE TO THE RIGHT THROUGH CARRY
	JNC JOTA  	;JUMP WHEN CARRY = 0
	ADD BX,[SI]	;Bx+SI
JOTA:	INC SI     	;INCREMENT SI
	INC SI
	LOOP OVER 	; DEC CX JNZ OVER
	ret	

CODE ENDS
END START
END


.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-u
1A24:0000 8BD0           MOV    DX,AX
1A24:0002 B8221A         MOV    AX,1A22
1A24:0005 8ED8           MOV    DS,AX
1A24:0007 8D360000       LEA    SI,[0000]
1A24:000B B91000         MOV    CX,0010
1A24:000E 33DB           XOR    BX,BX
1A24:0010 8BC2           MOV    AX,DX
1A24:0012 D1C8           ROR    AX,1
-u
1A24:0014 7302           JNB    0018
1A24:0016 031C           ADD    BX,[SI]
1A24:0018 46             INC    SI
1A24:0019 46             INC    SI
1A24:001A E2F6           LOOP   0012
1A24:001C C3             RET
1A24:001D 803E003C00     CMP    Byte Ptr [3C00],00
1A24:0022 7557           JNZ    007B
-bp 1c
-rax 6789
-g=0
AX=6789  BX=1A85  CX=0000  DX=6789  SP=0000  BP=0000  SI=0020  DI=0000
DS=1A22  ES=1A12  SS=1A22  CS=1A24  IP=001C   NV UP EI PL NZ AC PO NC
1A24:001C C3             RET                                  ;BR0
-rax 9999
-g=0
AX=9999  BX=270F  CX=0000  DX=9999  SP=0000  BP=0000  SI=0020  DI=0000
DS=1A22  ES=1A12  SS=1A22  CS=1A24  IP=001C   NV UP EI PL NZ AC PO NC
1A24:001C C3             RET                                  ;BR0
-