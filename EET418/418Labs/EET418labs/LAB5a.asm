 ;Steeve Bissereth
 ;BCD TO 16 bit BINARY

 CODE SEGMENT

        ASSUME CS:CODE

BCDBIN: XOR AX,AX
        MOV CH,4
        JMP PLUS

X10:    SHL AX,1
        MOV BX,AX
        MOV CL,2
        SHL AX,CL
        ADD AX,BX

PLUS:   MOV CL,4
        ROL DX,CL
        MOV BX,DX
        AND BX,000FH
        ADD AX,BX

        DEC CH
        JNZ X10

        RET
CODE ENDS
END BCDBIN
        END

