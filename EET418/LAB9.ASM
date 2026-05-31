;LAB 9
;DIAMELA DUVERGE

;  LIMITED EBCDIC TO ASCII
;  CODE CONVERSION PROGRAM.
;      EBCDIC IN AL;
;    ASCII RETURNED IN BL.
;      USES TABLE LOOKUP.
;   USES SI AND DI AS POINTERS.
;RETURNS 0 FOR AN INVALID INPUT CODE.

; 
DATA SEGMENT
     EBCDIC  DB 0F0H,0F1H,0F2H,0F3H,0F4H,0F5H
             DB 0F6H,0F7H,0F8H,0F9H
             DB 0C1H,0C2H,0C3H,0C4H,0C5H,0C6H
             DB 0C7H,0C8H,0C9H
             DB 0D1H,0D2H,0D3H,0D4H,0D5H,0D6H
             DB 0D7H,0D8H,0D9H
             DB 0E2H,0E3H,0E4H,0E5H,0E6H,0E7H
             DB 0E8H,0E9H
        
     ASCII   DB '0123456789'
             DB 'ABCDEFGHI'
             DB 'JKLMNOPQR'
             DB 'STUVWXYZ'
DATA ENDS

CODE SEGMENT

        ASSUME DS:DATA,CS:CODE

CONVERT:MOV	DX,AX
	MOV	AX,DATA
	MOV	DS,AX
	MOV	CL,36
	LEA	SI,EBCDIC
	LEA	DI,ASCII
	MOV	AX,DX
OVER:	CMP	AL,[SI]
	JE	RESULT
	INC	DI
	INC	SI
	LOOP	OVER
RESULT:	MOV	BL,[DI]
	RET
CODE ENDS
END CONVERT
 END

.
.     Type a question mark (?) to get a Debug HELP screen.
(!DOSCALC) pulls up a Decimal/Hexadecimal/Binary calculator.Esc to leave.
Microsoft (R) Symbolic Debug Utility  Version 4.00
Copyright (C) Microsoft Corp 1984, 1985.  REVISED 05/07/89   .

Type '?' for  80286]
-U
1A27:0000 8BD0           MOV    DX,AX
1A27:0002 B8221A         MOV    AX,1A22
1A27:0005 8ED8           MOV    DS,AX
1A27:0007 B124           MOV    CL,24                         ;'$'
1A27:0009 8D360000       LEA    SI,[0000]
1A27:000D 8D3E2400       LEA    DI,[0024]
1A27:0011 8BC2           MOV    AX,DX
1A27:0013 3A04           CMP    AL,[SI]
-U
1A27:0015 7404           JZ     001B
1A27:0017 47             INC    DI
1A27:0018 46             INC    SI
1A27:0019 E2F8           LOOP   0013
1A27:001B 8A1D           MOV    BL,[DI]
1A27:001D C3             RET
1A27:001E B80076         MOV    AX,7600
1A27:0021 3C80           CMP    AL,80
-BP 1D
-RAX F3
-G=0
AX=00F3  BX=0033  CX=0021  DX=00F3  SP=0000  BP=0000  SI=0003  DI=0027
DS=1A22  ES=1A12  SS=1A22  CS=1A27  IP=001D   NV UP EI PL ZR NA PE NC
1A27:001D C3             RET                                  ;BR0
-RAX C5
-G=0
AX=00C5  BX=0045  CX=0016  DX=00C5  SP=0000  BP=0000  SI=000E  DI=0032
DS=1A22  ES=1A12  SS=1A22  CS=1A27  IP=001D   NV UP EI PL ZR NA PE NC
1A27:001D C3             RET                                  ;BR0
-RAX 81
-G=0
AX=0081  BX=0000  CX=0000  DX=0081  SP=0000  BP=0000  SI=0024  DI=0048
DS=1A22  ES=1A12  SS=1A22  CS=1A27  IP=001D   NV UP EI PL NZ NA PE CY
1A27:001D C3             RET                                  ;BR0
-
-
