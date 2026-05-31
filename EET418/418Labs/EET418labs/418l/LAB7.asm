; Algorithm for approximating  

CODE SEGMENT
        
        ASSUME CS:CODE

X10:    MOV AX,08111h ;MOVE 8111H IN AX REGISTER
        MOV BX,08222h ; MOVE 8222H IN BX REGISTER
        CMP AX,BX ; COMPARE AX WITH BX
        JC CARRY  ;JUMP IF CARRY FLAG IS SET  
        
        ; SHIFTING RIGHT WILL DIVIDE THE NUMBER BY 2 
        SHR BX,1  ; IF CARRY FLAG IS ZERO, SHIFT BX TO RIGHT 
                    
        ADD AX,BX ; ADD BX REGISTER TO AX 
        JMP RETURN ;JUMP TO END THE PROGRAM
                    
CARRY:  SHR AX,1 ; IF CARRY IS SET, SHIFT AX TO RIGHT
        ADD AX,BX ; ADD AX WITH BX                    
RETURN: RET 

CODE ENDS
END 


