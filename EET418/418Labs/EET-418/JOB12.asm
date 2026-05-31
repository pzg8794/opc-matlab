; VOLUME OF BOX= X*Y*Z

DATA SEGMENT

	X	DB	0ABH
	Y	DB	0CDH
	Z	DB	0EFH
DATA ENDS

CODE SEGMENT

ASSUME DS:DATA, CS:CODE

VOL:	MOV	AX,DATA
	MOV	DS, AX

	MOV	AL,X
	MOV	BL,Y
	MUL	BL	;AX=X*Y
	MOV	CX,Z
	MUL	CX
	HLT
CODE ENDS
END VOL
	


.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-u
1A27:0000 B8261A         MOV    AX,1A26
1A27:0003 8ED8           MOV    DS,AX
1A27:0005 A00000         MOV    AL,[0000]
1A27:0008 8A1E0100       MOV    BL,[0001]
1A27:000C F6E3           MUL    BL
1A27:000E 8B0E0200       MOV    CX,[0002]
1A27:0012 F7E1           MUL    CX
1A27:0014 F4             HLT
-bp 14
-g
AX=D721  BX=00CD  CX=00EF  DX=007F  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A26  ES=1A16  SS=1A26  CS=1A27  IP=0014   OV UP EI NG NZ NA PE CY
1A27:0014 F4             HLT                                  ;BR0
-rax ffff
-rbx ffff
-rcx ffff
-rdx ffff
-g=0
AX=D721  BX=FFCD  CX=00EF  DX=007F  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A26  ES=1A16  SS=1A26  CS=1A27  IP=0014   OV UP EI NG NZ NA PE CY
1A27:0014 F4             HLT                                  ;BR0
-e0
1A26:0000  AB.12   CD.23   EF.34
-g=0
AX=7FF8  BX=FF23  CX=0034  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A26  ES=1A16  SS=1A26  CS=1A27  IP=0014   NV UP EI PL NZ NA PO NC
1A27:0014 F4             HLT                                  ;BR0
-