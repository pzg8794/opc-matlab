; LAB 14
;Diamela Duverge
;BINARY TO BCD SUBROUTINE
;USES REPEATED DIVISION BY 10
;EXAMPLE:
;     QUOTIENT REMAINDER
;65535/10= 6553  5
; 6553/10=  655  3
;  655/10=   65  5
;   65/10=    6  5
;    6/10=    0  6
;BINARY NUMBER IS IN AX AT START.
;BCD DIGITS ARE STORED IN MEMORY.

DATA SEGMENT
DIGIT DB 5 DUP (?)
        
DATA ENDS
   
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
        
BINBCD:	   MOV DX,DATA
           MOV DS,DX
           LEA SI, DIGIT
           MOV CX,5
           MOV BX,0AH
AGAIN:     MOV DX,00H
           DIV BX
           MOV [SI],DX
           INC SI
           DEC CX
           JNZ AGAIN
           RET        
         
              
CODE ENDS
END BINBCD
END
.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-U
1A30:0000 BA2F1A         MOV    DX,1A2F
1A30:0003 8EDA           MOV    DS,DX
1A30:0005 8D360000       LEA    SI,[0000]
1A30:0009 B90500         MOV    CX,0005
1A30:000C BB0A00         MOV    BX,000A
1A30:000F BA0000         MOV    DX,0000
1A30:0012 F7F3           DIV    BX
1A30:0014 8914           MOV    [SI],DX
-U
1A30:0016 46             INC    SI
1A30:0017 49             DEC    CX
1A30:0018 75F5           JNZ    000F
1A30:001A C3             RET
1A30:001B 0450           ADD    AL,50                         ;'P'
1A30:001D E812AA         CALL   AA32
1A30:0020 83C402         ADD    SP,+02
1A30:0023 E905FF         JMP    FF2B
-BP 1A
-RAX FFFF
-G=0
AX=0000  BX=000A  CX=0000  DX=0006  SP=0000  BP=0000  SI=0005  DI=0000
DS=1A2F  ES=1A1F  SS=1A2F  CS=1A30  IP=001A   NV UP EI PL ZR NA PE NC
1A30:001A C3             RET                                  ;BR0
-S 0,F
      ^ Error
-D 0,F
1A2F:0000  05 03 05 05 06 00 00 00-00 00 00 00 00 00 00 00  ................
-