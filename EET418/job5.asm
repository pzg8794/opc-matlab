; DiamelaDuverge
; EET 418L
; JOb#5
; BCD TO BINARY


	CODE SEGMENT
	ASSUME CS: CODE

Jump:	XOR AX, AX ;AX=0
	    MOV CH, 4 
	    JZ dde
X10:	SHL AX, 1
	    MOV BX, AX
	    MOV CL, 2
	    SHL AX, CL
	    ADD AX, BX

dde:	MOV CL,4
	    ROL DX, CL
	    MOV BX, DX
	    AND BX, 000FH
	    ADD AX,BX
	    DEC CH
	    JNZ X10 
	RET

 CODE ENDS
 END Jump
 END