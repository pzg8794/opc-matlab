;Lab No 5.1 Submitted to Professor Balaji
;By Piter Garcia

; BCD TO BINARY


	CODE SEGMENT
	ASSUME CS: CODE

BCDBIN:	    MOV CH,4
	    XOR AX,AX 	;AX=0
	    JZ DDE
	
X10:	    SHL AX,1
	    MOV BX,AX
	    MOV CL,2
	    SHL AX,CL
	    ADD AX,BX
 
DDE:	    MOV CL,4
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