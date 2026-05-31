;subroutine to multiply AX by 10

CODE SEGMENT

        ASSUME CS:CODE

X10:    SHL     AX,1    ;TIMES 2
        MOV     BX,AX
        SHL     AX,1    ;TIMES 4
        SHL     AX,1    ;TIMES 8
        ADD     AX,BX
        RET

CODE ENDS
END X10
        END
