;Steeve Bissereth
;Pairs of Ones

CODE SEGMENT

    ASSUME CS:CODE
    
PAIRS: MOV BX,AX
       MOV CL,0
       MOV DL,15
       
UP:    SAL BX,1
       JC CARRY
       JMP DOWN
       
CARRY: ADD BX,0
       JS SIGN
       JMP DOWN

SIGN:  INC CL

DOWN:  DEC DL
       JNZ UP
       
       RET
       
CODE ENDS
END PAIRS
    END