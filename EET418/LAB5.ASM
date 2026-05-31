; Lab 5: BCD TO BINARY SUBROUTINE
;Diamela Duverge

CODE SEGMENT
ASSUME CS: CODE
BCDBIN: XOR AX,AX
	MOV CH,4

JMP SKIP
X10:	SHL AX,1
	MOV BX,AX
	MOV CL,2
	SHL AX,CL
	ADD AX,BX
	
SKIP:	MOV CL,4
	ROL DX,CL
	MOV BX,DX
	AND BX, 000FH
	ADD AX,BX

	DEC CH
	JNZ x10

	RET
CODE ENDS
END BCDBIN
END


.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-?
A [<address>] - assemble              M <range> <address> - move
BC[<bp>] - clear breakpoint(s)        N <filename> [<filename>...] - name
BD[<bp>] - disable breakpoint(s)      O <value> <byte> - output to port
BE[<bp>] - enable breakpoint(s)       P [=<address>] [<value>] - program step
BL[<bp>] - list breakpoint(s)         Q - quit
BP [bp] <address> - set breakpoint    R [<reg>] [[=] <value>] - register
C <range> <address> - compare         S <range> <list> - search
D[type][<range>] - dump memory        S {-|&|+} - source level debugging
E[type] <address> [<list>] - enter    T [=<address>] [<value>] - trace
F <range> <list> - fill               U [<range>] - unassemble
G [=<address> [<address>...]] - go    V [<range>] - view source lines
H <value> <value> - hexadd            W [<address> [<drive><rec><rec>]] - write
I <value> - input from port           X [?] <symbol> - examine symbols(s)
K [<value>] - stack trace             XO<symbol> - open map/segment
L [<addr> [<drive><rec><rec>]] - load Z <symbol> <value>

?   - HELP or CALC.                   > } <device/file> - Redirect output
! [dos command] - shell escape        < { <device/file> - Redirect input
. - display current source line       = ~ <device/file> - Redirect both
\ - screen flip                       * <string> - comment

<expr> ops: + - * / : not seg off by wo dw poi port wport mod and xor or
<type> : Byte, Word, Doubleword, Asciz, Shortreal, Longreal, Tenbytereal
-rdx 6789
-u
1A2F:0000 33C0           XOR    AX,AX
1A2F:0002 B504           MOV    CH,04
1A2F:0004 EB0B           JMP    0011
1A2F:0006 90             NOP
1A2F:0007 D1E0           SHL    AX,1
1A2F:0009 8BD8           MOV    BX,AX
1A2F:000B B102           MOV    CL,02
1A2F:000D D3E0           SHL    AX,CL
-bp d
-g=0
AX=1A85  BX=0009  CX=0004  DX=6789  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A1F  ES=1A1F  SS=1A2F  CS=1A2F  IP=000D   NV UP EI PL NZ NA PE NC
1A2F:000D D3E0           SHL    AX,CL                         ;BR0
-