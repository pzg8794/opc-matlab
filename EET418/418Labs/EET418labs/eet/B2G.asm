;Navin J Ramjassingh
;Binary to Gray

CODE SEGMENT
	
	ASSUME CS:CODE

B2G:	MOV BX,AX
	SHR BX,1
	XOR BX,AX
	RET

CODE ENDS
END B2G
	END
