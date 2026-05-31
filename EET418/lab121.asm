;Lab #12
;Diamela Duverge

DATA SEGMENT

X	DB	0ABH
Y	DB	0CDH
Z	DB	0EFH
DATA ENDS

CODE SEGMENT

ASSUME DS: DATA, CS:CODE
XYZ: 	MOV	AX,DATA
	MOV	DS,AX
	MOV	AL,X
	MUL	Y	;AX = X*Y
	MOV	BX,Z
	MUL	BX	;DX AX = X*Y*Z
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
1A30:0005 A00000         MOV    AL,[0000]
1A30:0008 F6260100       MUL    Byte Ptr [0001]
1A30:000C 8B1E0200       MOV    BX,[0002]
1A30:0010 F7E3           MUL    BX
1A30:0012 F4             HLT
1A30:0013 005250         ADD    [BP+SI+50],DL
-bp 12
-g=0
AX=D721  BX=00EF  CX=0023  DX=007F  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A2F  ES=1A1F  SS=1A2F  CS=1A30  IP=0012   OV UP EI NG NZ NA PE CY
1A30:0012 F4             HLT                                  ;BR0
-RAX FFFF
-RBX FFFF
-RCX FFFF
-RDX FFFF
-G=0
AX=D721  BX=00EF  CX=FFFF  DX=007F  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A2F  ES=1A1F  SS=1A2F  CS=1A30  IP=0012   OV UP EI NG NZ NA PE CY
1A30:0012 F4             HLT                                  ;BR0
-E0
1A2F:0000  AB.12   CD.23   EF.34
-G=0
AX=7FF8  BX=0034  CX=FFFF  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A2F  ES=1A1F  SS=1A2F  CS=1A30  IP=0012   NV UP EI PL NZ NA PO NC
1A30:0012 F4             HLT                                  ;BR0
-