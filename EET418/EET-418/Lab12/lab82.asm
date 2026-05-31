;Lab No 8-2 Submitted to Professor Balaji
;By Piter Garcia
;4 DIGIT BCD TO BINARY SUBROUTINE PART A
;USING TABLE LOOKUP OF BIT WEIGHTS.
;BCD # IS IN AX, ANSWER IS RETURNED IN BX
;DI REGISTER IS USED AS A POINTER.

DATA SEGMENT
	DUMMY_DABLE DW 63 DUP (?)

    BIT_WEIGHT  DW 1
                DW 2
                DW 4
                DW 8
                DW 10
                DW 20
                DW 40
                DW 80
                DW 100
                DW 200
                DW 400
                DW 800
                DW 1000
                DW 2000
                DW 4000
                DW 8000
DATA ENDS

CODE SEGMENT
    
    ASSUME CS:CODE,DS:DATA
    
BCDBIN: MOV BX,AX
        MOV AX,DATA
        MOV DS,AX
        
        LEA DI,BIT_WEIGHT
        MOV CL,16
        MOV AX,BX
        XOR BX,BX
        
AGAIN:  ROR AX,1
        JNC NOBIT
        MOV DX,[DI]
        ADD BX,DX
        
NOBIT:  INC DI
        INC DI
        DEC CL
        JNZ AGAIN
        
	XOR DX,DX
        RET

CODE ENDS
END BCDBIN