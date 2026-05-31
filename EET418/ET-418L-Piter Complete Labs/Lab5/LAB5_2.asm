;Lab No 5.2 Submitted to Professor Balaji
;By Piter Garcia

; BCD TO BINARY


	CODE SEGMENT
	.386
	ASSUME CS: CODE

JUMP:	    MOV CH, 4 
	    XOR EAX,EAX 	;AX=0
	    Jz dde

X10:	    SHL EAX, 1
	    MOV EBX, EAX
	    MOV CL, 2
	    SHL EAX, CL
	    ADD EAX, EBX

dde:	    MOV CL, 4
	    ROL EDX, CL
	    MOV EBX, EDX
	    AND EBX, 000FH
	    ADD EAX, EBX
	    
	    DEC CH
	    JNZ X10 

	    RET
 CODE ENDS
 END JUMP
 END