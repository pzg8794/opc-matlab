DATA SEGMENT

    BIT_WEIGHT DW 1
               DW 2
               DW 4
               DW 8
               DW 10
               DW 20
               DW 40
               DW 80
               DW 100
               DW 200
               DW 400
               DW 800
               DW 1000
               DW 2000
               DW 4000
               DW 8000
               
      
               
               DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA

BCDBIN: MOV AX,DATA ; MOVE DATA TO AX REGISTER
        MOV DS,AX   ; MOVE AX TO DATA SEGMENT    
        MOV AX,6789H ; MOVE 6789H TO AX   
        MOV CX,10H   ; SET CX AS AN COUNTER   
        LEA SI,BIT_WEIGHT   ; LOAD MEMORY WITH DATA 
LOOPING:SHR AX,1        ; SHIFT AX TO RIGHT
        JNC NOCARRY     ; JUMP IF CARRY IS ZERO TO LINE39
        
       
      
       
 
        ADD BX,DS:[SI]  ; ADD MEMORY TO BX 
  NOCARRY:INC SI ; INCREMENT SI
        INC SI   ; INCREMENT SI
        DEC CX   ; DECREMENT CX   
        JNZ LOOPING ; JUMP TO LINE 31 IF CX IS NOT ZERO
        


        HLT
        
        CODE ENDS
        END BCDBIN