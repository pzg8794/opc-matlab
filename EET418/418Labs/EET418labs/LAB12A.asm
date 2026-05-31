;Steeve Bissereth
;Volume of box = X*Y*Z

DATA SEGMENT
    X   DB  0ABH
    Y   DB  0CDH
    Z   DB  0EFH
DATA ENDS

CODE SEGMENT

    ASSUME DS:DATA,CS:CODE
    
VOLUME: MOV AX,DATA
        MOV DS,AX
        AND AX,0
        MOV AL,X
        MOV BL,Y
        MUL BL
        AND BX,0
        MOV BL,Z
        MUL BX
        HLT
        
CODE ENDS
END VOLUME