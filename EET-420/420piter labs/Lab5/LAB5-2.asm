;Lab No 5.2 Submitted to Professor Balaji
;By Piter Garcia

; BCD TO BINARY


	CODE SEGMENT
	.386
	ASSUME CS: CODE

JUMP:	XOR EAX,EAX ;AX=0
	    MOV CH,8 
	    JZ  Edde

X10:	SHL EAX, 1
	    MOV EBX, EAX
	    MOV CL, 2
	    SHL EAX, CL
	    ADD EAX, EBX

dde:	MOV CL,4
	    ROL EDX, ECL
	    MOV EBX, EDX
	    AND EBX, 000FH
	    ADD EAX, EBX
	    DEC CH
	    JNZ X10 
	RET

 CODE ENDS
 END JUMP
 END