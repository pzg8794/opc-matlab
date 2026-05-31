;Lab 14 Submitted to Prof. Balaji 
;By Piter Garcia
;BINARY TO BCD SUBROUTINE
;USES REPEATED DIVISION BY 10
;EXAMPLE:
;          QUOTIENT REMAINDER
;65535/10=   6553     5
; 6553/10=    655     3
;  655/10=     65     5
;   65/10=      6     5
;    6/10=      0     6
;BINARY NUMBER IS IN AX AT START.
;BCD DIGITS ARE STORED IN MEMORY.

DATA SEGMENT
    DIGIT DB 5 DUP (?)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA

BINBCD: MOV BX,10
        MOV CX,05
        
        
AGAIN:  XOR DX,DX
        DIV BX
        MOV [DI],DX
        INC DI  
        LOOP AGAIN
        
        RET

CODE ENDS
END BINBCD