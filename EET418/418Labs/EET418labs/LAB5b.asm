 ;Steeve Bissereth
 ;BCD TO 32 bit BINARY

 CODE SEGMENT
.386

        ASSUME CS:CODE

BCDBIN: XOR EAX,EAX
        MOV CH,8
        JMP PLUS

X10:    SHL EAX,1
        MOV EBX,EAX
        MOV CL,2
        SHL EAX,CL
        ADD EAX,EBX

PLUS:   MOV CL,4
        ROL EDX,CL
        MOV EBX,EDX
        AND EBX,0000000FH
        ADD EAX,EBX

        DEC CH
        JNZ X10

        RET
CODE ENDS
END BCDBIN
        END

