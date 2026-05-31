;ADNER RAMOS
;LAB 7.1

DATA SEGMENT

	I	DW	8111H
	J	DW	8222H
DATA ENDS
CODE SEGMENT
ASSUME DS:DATA,CS:CODE

IJ:	MOV AX,DATA
	MOV DS,AX
	MOV AX,I	;AX=I
	MOV BX,J 	;BX=J
	CMP BX,AX	;J>I?
	JA LOOP2	;IF CF=0
	SHR BX,1	;J/2
	ADD AX,BX
	JMP OVER
LOOP2:	SHR AX,1	;I/2
	ADD AX,BX		
OVER:	HLT		

CODE ENDS
END IJ


.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-u
1A2C:0000 B82B1A         MOV    AX,1A2B
1A2C:0003 8ED8           MOV    DS,AX
1A2C:0005 A10000         MOV    AX,[0000]
1A2C:0008 8B1E0200       MOV    BX,[0002]
1A2C:000C 3BD8           CMP    BX,AX
1A2C:000E 7707           JA     0017
1A2C:0010 D1EB           SHR    BX,1
1A2C:0012 03C3           ADD    AX,BX
-u
1A2C:0014 EB05           JMP    001B
1A2C:0016 90             NOP
1A2C:0017 D1E8           SHR    AX,1
1A2C:0019 03C3           ADD    AX,BX
1A2C:001B F4             HLT
1A2C:001C 50             PUSH   AX
1A2C:001D E812AA         CALL   AA32
1A2C:0020 83C402         ADD    SP,+02
-bp 1b
-g=0
AX=C2AA  BX=8222  CX=002C  DX=0000  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A2B  ES=1A1B  SS=1A2B  CS=1A2C  IP=001B   NV UP EI NG NZ NA PE NC
1A2C:001B F4             HLT                                  ;BR0
-








