;Steeve Bissereth
;Gray to Binary code conversion

CODE SEGMENT

    ASSUME CS:CODE
    
G2B:   MOV BX,AX
       MOV CL,15

AGAIN: SHR BX,1
       XOR AX,BX
       DEC CL
       JNZ AGAIN
       
       RET
       
CODE ENDS
END G2B
    END