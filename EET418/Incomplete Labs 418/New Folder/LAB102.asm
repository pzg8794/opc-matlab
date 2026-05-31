;Lab 10-2 Submitted to Prof. Balaji
;By Piter Garcia
;8 BIT SEQUENCE GENERATOR PART A
;SEQUENCE GENERATED IN BL


Code Segment
	    Assume CS:CODE

SEQ8:	MOV	BL, 0FFH

AGAIN:	CALL DISP
	    TEST BL,71      ;(BL&71).BL WONT CHANGE.
	    CLC             ;CLEARS CF (CF=0)
	    JPE SHIFT
	    STC
SHIFT:	RCR	BL,1
	    CMP BL,0FFH
	    JNE	AGAIN       ;JUMP IF IT SEES EVEN PARITY
	    MOV	AH,4CH      ;SET UP TO RETURN
	    INT 21H         ;RETURN TO OS

DISP:	MOV	CX,0204H    ;CH=LOOP COUNT
                        ;CL=SHIFT COUNT 
                        ;FOR INT 21H
	    MOV	AH,2
AGAIN2:	ROL	BL,CL
	    MOV	DL,BL
	    AND DL,0FH
	    ADD	DL,30H
	    CMP	DL,39H
	    JBE	PRINT
	    ADD	DL,7
PRINT:	INT	21H
	    DEC	CH
	    JNZ	AGAIN2
	    MOV	DL,'-'
	    INT	21H
	    RET

CODE ENDS
	END SEQ8
		END