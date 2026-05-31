;Keith Manta
;number of zeros: original input in BX, num zeros in DX

CODE SEGMENT
	
	ASSUME CS:CODE

ZEROS:	MOV	CL,16
	MOV	BX,AX
	MOV	DX,0
AGAIN:	SHL	AX,1
	JC	NONE
	INC	DX
NONE:	DEC	CL
	JNZ	AGAIN
	RET	
	
CODE ENDS
END ZEROS
	END
