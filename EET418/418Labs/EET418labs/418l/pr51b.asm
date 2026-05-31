; LAB 8

DATA SEGMENT 
        BLOCK1 DB 20H DUP(?)
        
        BLOCK2 DB 00,11H,22H,33H
               DB 44H,55H,66H,77H
               
        BLOCK3 DB 88H,99H,0AAH,0BBH
               DB 0CCH,0DDH,0EEH,0FFH  
                
DATA ENDS 

CODE SEGMENT  
    
     ASSUME CS:CODE,DS:DATA
                    
BCDBIN:     MOV AX,DATA
            MOV DS,AX
            LEA SI,BLOCK2 
            LEA DI,BLOCK3
            MOV CX,8
AGAIN:      MOV AH,[SI]
            MOV AL,[DI]
            MOV [SI],AL
            MOV [DI],AH
            INC SI
            INC DI
            LOOP AGAIN
            HLT
            CODE ENDS
END BCDBIN
            
                                 