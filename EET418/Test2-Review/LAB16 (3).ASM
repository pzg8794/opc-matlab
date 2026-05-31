;Lab 16 Submitted to Prof. Balaji 
;By Piter Garcia
;SUBROUTINE TO CALCULATE SUM X*X
;    FOR X=1 TO N.
;ASSUME N IS IN CL AND IS NEVER ZERO.
;   ANSWER IS RETURNED IN BX.

CODE SEGMENT

    ASSUME CS:CODE
    
SUMXX: MOV AX,0
AGAIN: MOV AL,CL
       MUL CL
       ADD BX,AX
       MOV AX,0
       LOOP AGAIN
       
       RET
CODE ENDS
END SUMXX
END