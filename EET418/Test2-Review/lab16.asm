CODE SEGMENT
ASSUME CS:CODE

SUMXX: MOV CX, 0039H   ; SET CX AS AN COUNTER

       MOV AX, 0001H    ; USE AX TO SQUARE THE NUMBER
       XOR BX, BX       ; CLEAR BX
       MOV BP, 0001H    ; MOV 1 TO BP
       
 BACK: MOV AX,BP        ; MOVE BP TO AX
       MUL AX           ; MULTIPLY AX TO X*X OPERATION
       ADD BX,AX        ; ADD AX TO BX
       INC BP           ; INCREASE BP BY 1
       DEC CX           ; DECREMENT CX
       JNZ BACK         ; JUMP BACK IF CX IS NOT ZERO
       RET
       CODE ENDS
       END SUMXX