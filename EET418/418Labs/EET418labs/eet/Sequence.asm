;Keith Manta
;8 Bit Sequence Generator


CODE SEGMENT
	
	ASSUME CS:CODE

SEQ8:	MOV	BX,0FFH
AGAIN:	CALL	DISP_BL
	TEST	BL,71H
	JPE	SKIP
	STC
SKIP:	RCR	BL,1

	CMP	BL,0FFH
	JNE	AGAIN

	MOV	AH,4CH
	INT	21H

DISP_BL:
	MOV     CX,0204H  ;CH=LOOP COUNT
			  ;CL=SHIFT COUNT
	MOV     AH,2      ;FOR INT 24H          
AGAIN2: ROL     BL,CL
	MOV     DL,BL
	AND     DL,0FH
	ADD     DL,30H
	CMP     DL,39H
	JBE     PRINT
	ADD     DL,7
PRINT:  INT     21H
	DEC     CH
	JNZ     AGAIN2
	MOV     DL,'-'
	INT     21H
	RET     
	

CODE ENDS
END SEQ8

