; Lab 4: X^2+y^2 16 bit
;Diamela Duverge

CODE SEGMENT
ASSUME CS: CODE
X2Y2: MUL AX
      XCHG AX,BX
      MOV CX,DX
      MUL AX
      ADD BX,AX
      ADC CX,DX
      MOV AX,CX
      RET
CODE ENDS
END X2Y2
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
-rax 7fff
-rbx 7fff
-u
1A2F:0000 F7E0           MUL    AX
1A2F:0002 93             XCHG   AX,BX
1A2F:0003 8BCA           MOV    CX,DX
1A2F:0005 F7E0           MUL    AX
1A2F:0007 03D8           ADD    BX,AX
1A2F:0009 13CA           ADC    CX,DX
1A2F:000B 8BC1           MOV    AX,CX
1A2F:000D C3             RET
-bp d
-g=0
AX=7FFE  BX=0002  CX=7FFE  DX=3FFF  SP=0000  BP=0000  SI=0000  DI=0000
DS=1A1F  ES=1A1F  SS=1A2F  CS=1A2F  IP=000D   NV UP EI PL NZ AC PO NC
1A2F:000D C3             RET                                  ;BR0
-