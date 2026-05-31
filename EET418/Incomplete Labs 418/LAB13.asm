;Lab 13 Submitted to Prof. Balaji 
;By Piter Garcia
; GRAY TO BINARY CODE CONVERSION

CODE SEGMENT
        
        ASSUME CS:CODE

X10:        MOV AX,00h ; CLEAR AX REGISTER
            
            MOV BX,0FFFFh ; MOVE FFFFH TO BX REGISTER       
            MOV CX,10h    ; SET CX AS AN COUNTER
REPEAT:     
            XOR AX,BX     ; XOR AX TO BX     
            SHR BX,1      ; SHIFT BX TO RIGHT  
            DEC CX        ; DECREMENT CX  
            JNZ REPEAT    ; IF CX IS NOT ZERO  
                          ; REPEAT THE LOOP  
                                         
            RET
            
CODE ENDS
END 


