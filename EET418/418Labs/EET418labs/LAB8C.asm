;STEEVE BISSERETH
;LAB 8 PART C ZIPPER NOTES PAGE 51B
;ADD BLOCK2 AND BLOCK 3, PLACE THE RESULT IN BLOCK 1

DATA SEGMENT
    BLOCK1  DW  08H DUP(?)
    
    BLOCK2  DB  00,11H,22H,33H
            DB  44H,55H,66H,77H
    BLOCK3  DB  88H,99H,0AAH,0BBH
            DB  0CCH,0DDH,0EEH,0FFH
DATA ENDS

CODE SEGMENT
    
    ASSUME CS:CODE,DS:DATA
    
ADD_BLOCKS: MOV AX,DATA
            MOV DS,AX
        
            LEA SI,BLOCK2
            LEA DI,BLOCK3
            LEA BP,BLOCK1
            MOV CX,8
        
AGAIN:      XOR AX,AX
            XOR BX,BX
            MOV AL,[SI]
            MOV BL,[DI]
            ADD AX,BX
            MOV [BP],AX
            INC SI
            INC DI
            INC BP
	    INC BP 
            DEC CX
            JNZ AGAIN
        
            HLT

CODE ENDS
END ADD_BLOCKS