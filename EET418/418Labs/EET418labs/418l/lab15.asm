DATA SEGMENT
    X   DB  9,10,11,12
        DB  5,6,7,8
DATA ENDS
CODE SEGMENT
    ASSUME DS:DATA,CS:CODE
    
START:  MOV AX,DATA ; move data to ax register
        MOV DS,AX   ; transfer data from ax to ds
        LEA SI,X    ; put data in the memory location
       
        MOV CX,08H  ; set counter for x^2 for all 8 numbers
                    ; and then add it  
JUMP:   XOR AH,AH   ; clear ah register
        MOV AL,DS:[SI]  ; move first number from the memory 
                        ;location
        MUL AL          ; multiply al register to al register
                        ; to get square
        ADD BX,AX       ; add ax register to bx register
        JC  LOOP1       
LOOP2:  INC SI          ; increment pointer by one
        DEC CX          ; decrement cx counter by one
        JNZ JUMP        ; jump on non zero to complete the loop
        JMP LOOP3       ; jump to loop3
LOOP1:  INC DI          ; increment di by one 
        JMP LOOP2
       
LOOP3:  MOV CX,03H      ; set cx counter by four
LOOP4:  SHR DI,01H      ; shift di register on once
        RCR BX,01H      ; rotate bx register through carry once
        DEC CX          ; decrement counter
        JNZ LOOP4       ; jump on non zero to run the program
  HLT
        
        CODE ENDS
        END START
     
        
         
