;Lab #12.2
;Diamela Duverge

DATA SEGMENT

X	DW	0ABCDH
Y	DW	0BCDEH
Z	DW	0CDEFH
DATA ENDS

CODE SEGMENT

ASSUME DS: DATA, CS:CODE
XYZ: 	MOV	AX,DATA
	MOV	DS,AX
	MOV	AX,X
	MUL	Y	;DX AX = X*Y
	MOV	BX,DX	;BX CX = X*Y
	MOV	CX,AX
	MUL	Z	;DX AX = AX*Z
	MOV	DI,AX	
	MOV	SI,DX	
	MOV	AX,BX	
	MUL	Z	;DX AX = BX*Z
	ADD	SI,AX
	ADC	DX,00
	MOV	BP,DX
	HLT	
CODE ENDS
END XYZ
END

.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-u
1A30:0000 B82F1A         MOV    AX,1A2F
1A30:0003 8ED8           MOV    DS,AX
1A30:0005 A10000         MOV    AX,[0000]
1A30:0008 F7260200       MUL    Word Ptr [0002]
1A30:000C 8BDA           MOV    BX,DX
1A30:000E 8BC8           MOV    CX,AX
1A30:0010 F7260400       MUL    Word Ptr [0004]
1A30:0014 8BF8           MOV    DI,AX
-u
1A30:0016 8BF2           MOV    SI,DX
1A30:0018 8BC3           MOV    AX,BX
1A30:001A F7260400       MUL    Word Ptr [0004]
1A30:001E 03F0           ADD    SI,AX
1A30:0020 83D200         ADC    DX,+00
1A30:0023 8BEA           MOV    BP,DX
1A30:0025 F4             HLT
1A30:0026 803E273D00     CMP    Byte Ptr [3D27],00
-bp 25
-g
AX=4751  BX=7EBF  CX=87C6  DX=65F5  SP=0000  BP=65F5  SI=B489  DI=4FDA
DS=1A2F  ES=1A1F  SS=1A2F  CS=1A30  IP=0025   NV UP EI PL NZ NA PE NC
1A30:0025 F4             HLT                                  ;BR0
-ew 0
1A2F:0000  ABCD.fedc
1A2F:0002  BCDE.edcb
1A2F:0004  CDEF.dcba
1A2F:0006  0000.
-g=0
AX=B3DE  BX=ECBB  CX=C474  DX=CC1D  SP=0000  BP=CC1D  SI=5D40  DI=6C48
DS=1A2F  ES=1A1F  SS=1A2F  CS=1A30  IP=0025   NV UP EI NG NZ NA PE NC
1A30:0025 F4             HLT                                  ;BR0
-