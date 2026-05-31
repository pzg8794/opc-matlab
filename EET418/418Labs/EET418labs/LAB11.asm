;Steeve Bissereth
;ANS = X1*X2*X3/(X4+X5)

DATA SEGMENT 
    X1  DB  00AAH
    X2  DB  00BBH
    X3  DB  00CCH
    X4  DB  00DDH
    X5  DB  00EEH
    ANS DW  ?
DATA ENDS

CODE SEGMENT

ASSUME DS:DATA,CS:CODE

X12345: MOV AX,DATA
        MOV DS,AX
        
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        
        MOV AL,X1
        MOV BL,X2
        MOV CL,X3
        MUL BX
        MUL CX
        
        MOV BL,X4
        MOV CL,X5
        ADD BX,CX
        DIV BX
        MOV ANS,AX
        
        HLT

CODE ENDS
END X12345