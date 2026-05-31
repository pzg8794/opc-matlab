
; BINARY TO BCD

DATA SEGMENT
    DIGIT DB 5 DUP (?)
    DATA ENDS
CODE SEGMENT
        
        ASSUME CS: CODE, DS: DATA

BINBCD:        XOR AX,AX
	       MOV AX, DATA 	 	; MOVE DATA TO AX REGISTER
               MOV DS,AX     		; MOVE AX TO DS REGISTER   
               
               MOV SI, OFFSET DIGIT 	; SET SI AS A MEMORY POINTER
               MOV AX,0FFFFh      	; MOVE FFFFH TO AX  
                           
               MOV DI,05H   		; SET DI AS AN COUNTER
	       XOR DX,DX
		
	       
 AGAIN:   XOR DX,DX    			; CLEAR DX REGISTER
               MOV BX,0000Ah 		; MOVE 000A TO BX 
               DIV BX        		; DIVIDE AX BY BX   
               MOV DS: [DI],DX   	; MOVE THE REMINDER TO THE MEMORY 
               INC DI  			; INCREMENT TO THE NEXT MEMORY LOCATION
               DEC DI   		; DECREMENT DI
	             
     	       JNZ  AGAIN 		; JUMP BACK IF CX IS NOT ZERO

	
               HLT
CODE ENDS
END BINBCD




