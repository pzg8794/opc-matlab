; BINARY TO BCD

DATA SEGMENT
    DIGIT DB 5 DUP (?)
    DATA ENDS
CODE SEGMENT
        
        ASSUME CS:CODE,DS:DATA

BINBCD:        MOV AX, DATA  ; MOVE DATA TO AX REGISTER
               MOV DS,AX     ; MOVE AX TO DS REGISTER   
               
               MOV SI,OFFSET DIGIT ; SET SI AS A MEMORY POINTER
               MOV AX,0FFFFh       ; MOVE FFFFH TO AX  
                           
               MOV CX,05h   ; SET CX AS AN COUNTER
      AGAIN:   XOR DX,DX    ; CLEAR DX REGISTER
               MOV BX,0000Ah ; MOVE 000A TO BX 
               DIV BX        ; DIVIDE AX BY BX   
               MOV DS:[SI],DX   ; MOVE THE REMINDER TO THE MEMORY 
               INC SI  ; INCREMENT TO THE NEXT MEMORY LOCATION
               
               
               DEC CX   ; DECREMENT CX             
               
               JNZ  AGAIN ; JUMP BACK IF CX IS NOT ZERO
               HLT
CODE ENDS
END BINBCD


