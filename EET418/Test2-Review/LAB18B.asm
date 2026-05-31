;STEEVE BISSERETH
; 16 BIT SEQUENCE GENERATOR
;PART B

CODE SEGMENT

    ASSUME CS:CODE
    
START:  MOV BX,0FFFFH

AGAIN:  CALL DISPLAY
        
        TEST BX,002DH
        JPE SKIP
        STC
        
SKIP:   RCR BX,1
        CMP BX,0FFFFH
        JNE AGAIN
        MOV AH,4CH
        INT 21H
        
DISPLAY: MOV CX,0404H
         MOV AH,2
         
AGAIN2: ROL BX,CL
        MOV DL,BL
        AND DL,0FH
        ADD DL,30H
        CMP DL,39H
        JBE PRINT
        ADD DL,7
        
PRINT:  INT 21H
        DEC CH
        JNZ AGAIN2
        MOV DL,'-'
        INT 21H
        
        RET
        


DELAY2: MOV SI,0FFFFH
DELAY3: DEC SI
        JNZ DELAY3
        DEC DI
        JNZ DELAY2
        RET
        
CODE ENDS
END START