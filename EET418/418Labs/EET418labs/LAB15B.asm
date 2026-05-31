;STEEVE BISSERETH
;SUBROUTINE TO CALCULATE
;AVERAGE OF 8 "X SQUARED" SAMPLES

DATA SEGMENT
    X   DB  9,10,11,12
        DB  5,6,7,8
DATA ENDS

CODE SEGMENT

    ASSUME DS:DATA,CS:CODE
    
STAT:   MOV AX,DATA
        MOV DS,AX
        
        LEA SI,X
        MOV CX,00
        MOV DX,08
        
AGAIN:  MOV AX,0
        MOV AL,[SI]
        MUL AL
        ADD CX,AX
        ADC BX,00
        INC SI
        DEC DX
        JNZ AGAIN
        
        SHR BX,1        ;divides by 2
        RCR CX,1
        SHR BX,1        ;divides by 4
        RCR CX,1
        SHR BX,1        ;divides by 8
        RCR CX,1
        
        RET
        
CODE ENDS
END STAT