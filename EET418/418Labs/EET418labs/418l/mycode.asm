DATA SEGMENT
    X1 DB 0AAH
    X2 DB 0BBH
    X3 DB 07FH
    X4 DB 085H
    
    Y DW ?
    
DATA ENDS
    
CODE SEGMENT

    ASSUME DS:DATA, CS:CODE
    
X10:    MOV AX, DATA
        MOV DX,AX
        MOV AX,00
        MOV AL,X1
        MOV BX,00
        MOV BL,X2
        MUL BX
        MOV BL,X3
        ADD AX,BX
        MOV BL,X4
        DIV BX
        MOV Y,AX
        HLT
        
CODE ENDS
END    