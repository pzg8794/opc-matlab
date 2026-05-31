;Lab No.4 Submitted to Professor Balaji
;By Piter Garcia

CODE SEGMENT
        
        ASSUME CS:CODE

X2Y2:	
	MUL AX
	XCHG AX,BX
	MOV CX,DX
	MUL AX
	ADD BX,AX
	ADC CX,DX
	MOV AX,CX
	RET

CODE ENDS 
END X2Y2
END