; Lab 12B Submitted to Prof. Balaji by Piter Garcia
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

       
        MOV AX,X
        MOV SI,Y
        MUL SI
        MOV CX,DX

        MUL Z
        MOV DI,AX
        MOV SI,DX
        MOV AX,CX

        MUL Z
        ADD SI,AX
        ADC DX,0
        MOV BX,SI
        MOV BP,DX
      
        RET
                
CODE ENDS
END VOLUME