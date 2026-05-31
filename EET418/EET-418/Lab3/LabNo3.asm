;Lab No.3 Submitted to Professor Balaji
;By Piter Garcia

CODE SEGMENT
        
        ASSUME CS:CODE

BinarytoGray: 
	  	MOV BX,AX
	  	shr BX,1
	  	XOR BX,AX
	  	RET

CODE ENDS
END BinarytoGray




