;Lab No 5.1 Submitted to Professor Balaji
;By Piter Garcia

; BCD TO BINARY


	CODE SEGMENT
	ASSUME CS: CODE

JUMP:	    MOV CH, 4 
	    XOR AX,AX 	;AX=0
	    Jz dde

X10:	    SHL AX, 1
	    MOV BX, AX
	    MOV CL, 2
	    SHL AX, CL
	    ADD AX, BX

dde:	    MOV CL,4
	    ROL DX, CL
	    MOV BX, DX
	    AND BX, 000FH
	    ADD AX,BX
	    
	    DEC CH
	    JNZ X10 

	    RET
 CODE ENDS
 END JUMP
 END