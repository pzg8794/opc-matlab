;Lab 11 Submitted to Prof. Balaji 
;By Piter Garcia
; ANS = X1 * X2 * X3 / (X4 + X5)
DATA SEGMENT
    X1  DB 000AAh
    X2  DB 000BBh
    X3  DB 000CCh
    X4  DB 000DDh
    X5  DB 000EEh
    ANS DW  ?
DATA ENDS
 
CODE SEGMENT
        
        ASSUME DS:DATA,CS:CODE

X12345: MOV AX,DATA ; MOVE DATA TO AX REGISTER
        MOV DS,AX   ; MOVE  AX TO DATA SEGMENT
        MOV AL,X1   ; MOVE X1 TO AL REGISTER
        MOV BL,X2   ; MOVE X2 TO BL REGISTER
        MUL BL      ; MULTIPLY BL TO AL
        MOV BL,X3   ; MOV X3 TO BL REGISTER
        MUL BX      ; MULTIPLY BL TO AL
        MOV BL,X4   ; MOVE X4 TO BL
        MOV CL,X5   ; MOV X5 TO CL
        ADD BX,CX   ; ADD BX AND CX
        DIV BX      ; DIVIDE AX BY BX
        HLT

CODE ENDS
END X12345


