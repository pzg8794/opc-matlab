;Lab 10 Submitted to Prof. Balaji
;By Piter Garcia
;8 BIT SEQUENCE GENERATOR PART A
;SEQUENCE GENERATED IN BL

CODE SEGMENT
    ASSUME CS:CODE
    
SEQ8:   MOV BL,0FFH

AGAIN:  TEST BL,071H 
	   JPE SHIFT
	         STC

SHIFT:	    RCR BL,1
           JMP AGAIN
        
CODE ENDS
END SEQ8