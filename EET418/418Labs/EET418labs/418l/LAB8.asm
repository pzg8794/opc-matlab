DATA SEGMENT
    BIT_WEIGHT1 DW 1
               DW 2
               DW 4
               DW 8
               DW 10
               DW 20
               DW 40
               DW 80
     BIT_WEIGHT2 DW 100
               DW 200
               DW 400
               DW 800
               DW 100
               DW 200
               DW 400
               DW 800
               
               DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    
    BCDBIN: MOV AX,DATA  ; MOVE DATA TO AX
            MOV DS,AX    ; MOVE AX TO DATA SEGMENT   
            
            LEA SI,BIT_WEIGHT1  ; SET SI AS AN MEMORY POINTER
            MOV CX,08H          ; SET CX AS AN COUNTER
            MOV AX,6789         ; MOVE 6789 TO AX
      BACK: SHR AX,1            ; SHIFT AX TO RIGHT
            JC  CARRY           ; JUUMP IF CARRY IS SET
            MOV DX,0            ; CLEAR DX REGISTER
            MOV DS:[SI],DX      ; MOVE DX TO MEMORY
            INC SI              ; INCREMENT SI 
            DEC CX              ; DECREMENT CX
            JNZ BACK            ; JUMP BACK IF CX IS ZERO
            JMP JUMP            ; JUMP TO THE LINE 43
     CARRY: MOV DX,1            ; MOVE 1 TO DX    
      MOV DS:[SI],DX            ; MOVE DX TO MEMORY
            INC SI              ; INCREMENT SI
            DEC CX              ; DECREMENT CX
            JNZ BACK            ; JUMP BACK TO LINE 29
            
      JUMP: LEA DI,BIT_WEIGHT2  ; 
            MOV CX,08H
   BACK2:    SHR AX,1
            JC CARRY2
            MOV DX,0
            MOV DS:[DI],DX
            INC SI
            DEC CX
            JNZ BACK2 
            JMP JUMP2
    CARRY2: MOV DX,1
             MOV DS:[SI],DX
            INC SI
            DEC CX
            JNZ BACK2 
    JUMP2:        HLT
                 