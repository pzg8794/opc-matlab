
;ADNER RAMOS
;JOB12.2

DATA SEGMENT

X	DW	0ABCDH
Y	DW	0BCDEH
Z	DW	0CDEFH
DATA ENDS


CODE SEGMENT
ASSUME DS: DATA, CS:CODE

VOL2: 	MOV	AX,DATA
	MOV	DS,AX
	
	MOV	AX,X
	MUL	Y	
	MOV	BX,DX	
	MOV	CX,AX
	MUL	Z	
	MOV	DI,AX	
	MOV	SI,DX	
	MOV	AX,BX	
	MUL	Z	
	ADD	SI,AX
	ADC	DX,00
	MOV	BP,DX
	HLT	
CODE ENDS
END VOL2



.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-u
1A27:0000 B8261A         MOV    AX,1A26
1A27:0003 8ED8           MOV    DS,AX
1A27:0005 A10000         MOV    AX,[0000]
1A27:0008 F7260200       MUL    Word Ptr [0002]
1A27:000C 8BDA           MOV    BX,DX
1A27:000E 8BC8           MOV    CX,AX
1A27:0010 F7260400       MUL    Word Ptr [0004]
1A27:0014 8BF8           MOV    DI,AX
-u
1A27:0016 8BF2           MOV    SI,DX
1A27:0018 8BC3           MOV    AX,BX
1A27:001A F7260400       MUL    Word Ptr [0004]
1A27:001E 03F0           ADD    SI,AX
1A27:0020 83D200         ADC    DX,+00
1A27:0023 8BEA           MOV    BP,DX
1A27:0025 F4             HLT
1A27:0026 803E273D00     CMP    Byte Ptr [3D27],00
-bp 25
-g
AX=4751  BX=7EBF  CX=87C6  DX=65F5  SP=0000  BP=65F5  SI=B489  DI=4FDA
DS=1A26  ES=1A16  SS=1A26  CS=1A27  IP=0025   NV UP EI PL NZ NA PE NC
1A27:0025 F4             HLT                                  ;BR0
-ew 0
1A26:0000  ABCD.FEDC
1A26:0002  BCDE.EDCB
1A26:0004  CDEF.DCBA
1A26:0006  0000.
-G=0
AX=B3DE  BX=ECBB  CX=C474  DX=CC1D  SP=0000  BP=CC1D  SI=5D40  DI=6C48
DS=1A26  ES=1A16  SS=1A26  CS=1A27  IP=0025   NV UP EI NG NZ NA PE NC
1A27:0025 F4             HLT                                  ;BR0
-