;STEEVE BISSERETH
;LAB 21 PART C
;CALCULATE PERMUTATIONS AND COMBINATIONS
;P = N!/(N-R)!
;C = N!/(N-R)!/R! = P!/R!

DATA SEGMENT
	N	DW	8
	R	DW	3
	PERM	DW	?
	COMB	DW	?
DATA ENDS

CODE SEGMENT

    ASSUME DS:DATA,CS:CODE

;---------------------------------------

;16 BIT FACTORIAL X SUBROUTINE
;WHERE X IS IN THE CX REGISTER
;ANSWER RETURNED IN AX
;X <= 8; X! = 40,320 = 9D80H 

FACTORIAL MACRO
	LOCAL AGAIN EXIT
           MOV AX,01H
           CMP CX,00H
           JCXZ EXIT

AGAIN:     MUL CX
           DEC CX
           JNZ AGAIN

EXIT:      

ENDM

;----------------------------------------

MAIN:   MOV AX,DATA
	MOV DS,AX
        	
	MOV SI,OFFSET N
	MOV CL,DS:[SI]
    	MOV BL,CL
	INC SI
    	INC SI
	SUB CL,DS:[SI]
    	FACTORIAL

	XCHG BL,CL
	XCHG AX,BX
	FACTORIAL

    	DIV BX
	INC SI
    	INC SI
	MOV DS:[SI],AX

    	XCHG BX,AX
	MOV SI,OFFSET R
    	MOV CL,DS:[SI]
	FACTORIAL

    	XCHG AX,DX
	XCHG AX,BX
    	DIV DL
	MOV SI,OFFSET COMB
    	MOV DS:[SI],AX

	HLT

CODE ENDS
END MAIN