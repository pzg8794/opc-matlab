;Lab No 12_1 Submitted to Professor Balaji
;By Piter Garcia

DATA SEGMENT
    X   DB  0ABH
    Y   DB  0CDH
    Z   DB  0EFH
DATA ENDS

CODE SEGMENT

    ASSUME DS:DATA,CS:CODE
    
VOLUME: MOV AX,DATA	;Moving Data to AX register
        MOV DS,AX	;Saving AX register to DS
        AND AX,0	;Initializing AX register
        MOV AL,X	;Saving X to Ax register
        MOV BL,Y	;Saving Y to Bx register
        MUL BL		;Multiplying Low bite in Bx register
        AND BX,0	;Initializing Bx Register
        MOV BL,Z	;saving Z into BL register
        MUL BX		;Multiplying answer
        HLT
        
CODE ENDS
END VOLUME