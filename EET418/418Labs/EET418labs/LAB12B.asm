;Steeve Bissereth
;Volume of box = X*Y*Z
;For easy viewing in DEBUG
;Line the answer up in BP,SI,DI

DATA SEGMENT
    X   DW  0ABCDH
    Y   DW  0BCDEH
    Z   DW  0CDEFH
DATA ENDS

CODE SEGMENT

    ASSUME DS:DATA,CS:CODE
    
VOLUME: MOV AX,DATA
        MOV DS,AX
        AND AX,0
        MOV AX,X
        MOV BX,Y
        MUL BX
        MOV CX,DX
        MUL Z
        MOV DI,AX
        MOV BX,DX
        MOV AX,CX
        MUL Z
        ADD BX,AX
        ADC DX,0
        MOV SI,BX
        MOV BP,DX
        HLT
        
CODE ENDS
END VOLUME