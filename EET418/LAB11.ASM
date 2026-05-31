;Lab #11
;Diamela Duverge

DATA SEGMENT

X1	DB	?
X2	DB	?
X3	DB	?
X4	DB	?
X5	DB	?
ANS	DW	?
DATA ENDS

CODE SEGMENT

ASSUME DS: DATA, CS:CODE
X12345: MOV	AX,DATA
	MOV	DS, AX
	MOV	AL, X1
	MOV	BL, X2
	MUL	BL	;AX = X1*X2
	MOV	DL, X3
	MUL	Dx	;DX AX = X1*X2*X3
	MOV	BL,X4
	MOV	CL,X5
	ADD	BX,CX
	DIV	Bx
	MOV	ANS,AX
	HLT	
CODE ENDS
END X12345
END
	
	

.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-
-u
1A30:0000 B82F1A         MOV    AX,1A2F
1A30:0003 8ED8           MOV    DS,AX
1A30:0005 A00000         MOV    AL,[0000]
1A30:0008 8A1E0100       MOV    BL,[0001]
1A30:000C F6E3           MUL    BL
1A30:000E 8A160200       MOV    DL,[0002]
1A30:0012 F7E2           MUL    DX
1A30:0014 8A1E0300       MOV    BL,[0003]
-u
1A30:0018 8A0E0400       MOV    CL,[0004]
1A30:001C 03D9           ADD    BX,CX
1A30:001E F7F3           DIV    BX
1A30:0020 A30500         MOV    [0005],AX
1A30:0023 F4             HLT
1A30:0024 05FF80         ADD    AX,80FF
1A30:0027 3E27           DAA    DS:
1A30:0029 3D0074         CMP    AX,7400
-bp 23
-t2
AX=1A2F  BX=0000  CX=0034  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A1F  ES=1A1F  SS=1A2F  CS=1A30  IP=0003   NV UP EI PL NZ NA PO NC
1A30:0003 8ED8           MOV    DS,AX
AX=1A2F  BX=0000  CX=0034  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A2F  ES=1A1F  SS=1A2F  CS=1A30  IP=0005   NV UP EI PL NZ NA PO NC
1A30:0005 A00000         MOV    AL,[0000]                          DS:0000=00
-e0
1A2F:0000  00.aa   00.bb   00.cc   00.dd   00.ee
-g=0
AX=3730  BX=01CB  CX=00EE  DX=0198  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A2F  ES=1A1F  SS=1A2F  CS=1A30  IP=0023   NV UP EI PL NZ AC PO NC
1A30:0023 F4             HLT                                  ;BR0
-