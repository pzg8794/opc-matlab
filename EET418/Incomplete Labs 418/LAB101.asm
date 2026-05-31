;Lab 10-1 Submitted to Prof. Balaji
;By Piter Garcia
;8 BIT SEQUENCE GENERATOR PART A
;SEQUENCE GENERATED IN BL

CODE SEGMENT
    ASSUME CS:CODE
    
SEQ8:   MOV BX,0FFH

AGAIN:  TEST BL,71H
        JPE  SKIP
        STC

SKIP:   RCR BL,1
        CMP BL,0FFH
        JMP AGAIN
	MOV AH,4CH
        
CODE ENDS
END SEQ8