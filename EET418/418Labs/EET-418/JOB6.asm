;ADNER RAMOS
;PAIRS OF ONES

CODE SEGMENT
ASSUME CS:CODE


P1:	MOV BX, AX
	XOR CX, CX
	MOV DX, 15
	
P2:	AND BX, BX
	JZ P3; IS Z=1?
	SHL BX, 1
	JNS P2; IS S=0?
	JNC P2; IS CF=0?
	INC CX; CX+1
	DEC DX
	JNZ P2
P3:	RET

CODE ENDS
END P1
END
	
.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-u
11B9:0000 8BD8           MOV    BX,AX
11B9:0002 33C9           XOR    CX,CX
11B9:0004 23DB           AND    BX,BX
11B9:0006 7409           JZ     0011
11B9:0008 D1E3           SHL    BX,1
11B9:000A 79F8           JNS    0004
11B9:000C 73F6           JNB    0004
11B9:000E 41             INC    CX
-u
11B9:000F EBF3           JMP    0004
11B9:0011 C3             RET
11B9:0012 FC             CLD
11B9:0013 FB             STI
11B9:0014 7520           JNZ    0036
11B9:0016 803E284300     CMP    Byte Ptr [4328],00
11B9:001B 7419           JZ     0036
11B9:001D 8B86FEFB       MOV    AX,[BP+FBFE]
-bp 11
-g=0
AX=0000  BX=0000  CX=0000  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=11A9  ES=11A9  SS=11B9  CS=11B9  IP=0011   NV UP EI PL ZR NA PE NC
11B9:0011 C3             RET                                  ;BR0
-rax ffff
-g=0
AX=FFFF  BX=0000  CX=000F  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=11A9  ES=11A9  SS=11B9  CS=11B9  IP=0011   NV UP EI PL ZR NA PE NC
11B9:0011 C3             RET                                  ;BR0
-rax aaaa
-g=0
AX=AAAA  BX=0000  CX=0000  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=11A9  ES=11A9  SS=11B9  CS=11B9  IP=0011   NV UP EI PL ZR NA PE NC
11B9:0011 C3             RET                                  ;BR0
-rax 38c0
-g=0
AX=38C0  BX=0000  CX=0003  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=11A9  ES=11A9  SS=11B9  CS=11B9  IP=0011   NV UP EI PL ZR NA PE NC
11B9:0011 C3             RET                                  ;BR0
-