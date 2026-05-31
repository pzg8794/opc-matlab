;ADNER RAMOS
;LAB 13

CODE SEGMENT
ASSUME CS:CODE

G2B:	MOV CX,15
	MOV BX, AX	
XX:	SHR BX,1
	XOR AX, BX
	LOOP XX	
	RET
CODE ENDS
END G2B
END



.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-u
1A26:0000 B90F00         MOV    CX,000F
1A26:0003 8BD8           MOV    BX,AX
1A26:0005 D1EB           SHR    BX,1
1A26:0007 33C3           XOR    AX,BX
1A26:0009 E2FA           LOOP   0005
1A26:000B C3             RET
1A26:000C 8B86FAFB       MOV    AX,[BP+FBFA]
1A26:0010 0B86FCFB       OR     AX,[BP+FBFC]
-bp 0b
-rax 01
-g=0
AX=0001  BX=0000  CX=0000  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A16  ES=1A16  SS=1A26  CS=1A26  IP=000B   NV UP EI PL NZ NA PO NC
1A26:000B C3             RET                                  ;BR0
-rax 05
-g=0
AX=0006  BX=0000  CX=0000  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A16  ES=1A16  SS=1A26  CS=1A26  IP=000B   NV UP EI PL NZ NA PE NC
1A26:000B C3             RET                                  ;BR0
-rax 80
-g=0
AX=00FF  BX=0000  CX=0000  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A16  ES=1A16  SS=1A26  CS=1A26  IP=000B   NV UP EI PL NZ NA PE NC
1A26:000B C3             RET                                  ;BR0
-RAX 8000
-G=0
AX=FFFF  BX=0001  CX=0000  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A16  ES=1A16  SS=1A26  CS=1A26  IP=000B   NV UP EI NG NZ NA PE NC
1A26:000B C3             RET                                  ;BR0
-RAX FE2B
-G=0
AX=ABCD  BX=0001  CX=0000  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A16  ES=1A16  SS=1A26  CS=1A26  IP=000B   NV UP EI NG NZ NA PO NC
1A26:000B C3             RET                                  ;BR0
-