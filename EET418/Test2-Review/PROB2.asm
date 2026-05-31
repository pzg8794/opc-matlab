;CHAPTER 3 PROBLEM #2
;Diamela Duverge

DATA SEGMENT
MONTH_PAY	DW	08FCH
		DW	10CCH
		DW	04B0H
		DW	0E74H
		DW	0512H
		DW	10E3H
		DW	1629H
		DW	03DAH
DATA ENDS

CODE SEGMENT

ASSUME DS: DATA, CS:CODE
MONTH: 	MOV DX, AX
	MOV AX, DATA
	MOV DS, AX
	LEA SI,MONTH_PAY
	MOV CX,08H 	;SETTING COUNTER TO 8
	XOR BX,BX
	MOV AX,DX
OVER:	ADD BX,[SI]
	INC SI
	INC SI
	LOOP OVER 	; DEC CX JNZ OVER
	RET	
CODE ENDS
END MONTH
END
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-U
1C13:0000 8BD0           MOV    DX,AX
1C13:0002 B8121C         MOV    AX,1C12
1C13:0005 8ED8           MOV    DS,AX
1C13:0007 8D360000       LEA    SI,[0000]
1C13:000B B90800         MOV    CX,0008
1C13:000E 33DB           XOR    BX,BX
1C13:0010 8BC2           MOV    AX,DX
1C13:0012 031C           ADD    BX,[SI]
-U
1C13:0014 46             INC    SI
1C13:0015 46             INC    SI
1C13:0016 E2FA           LOOP   0012
1C13:0018 C3             RET
1C13:0019 37             AAA
1C13:001A E85B2C         CALL   2C78
1C13:001D 83C402         ADD    SP,+02
1C13:0020 833E3C3E00     CMP    Word Ptr [3E3C],+00
-BP 18
-G=0
AX=0000  BX=5CE4  CX=0000  DX=0000  SP=0000  BP=0000  SI=0010  DI=0000
DS=1C12  ES=1C02  SS=1C12  CS=1C13  IP=0018   NV UP EI PL NZ AC PO NC
1C13:0018 C3             RET                                  ;BR0
-