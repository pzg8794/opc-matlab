;AGYEMAN B. DANSO EET 418L LAB#6
;SUBROUTINE TO DETERMINE THE NUMBER 
;OF PAIRS OF ONES IN THE AX REGISTER

CODE SEGMENT
        
        ASSUME CS:CODE

X10:    MOV AX,00003h ; save the value in AX register
        MOV BX, 10h   ; use BX register as an counter  
REPEAT: SHL AX,1      ; shift AX register once to the left
        JC SIGN       ; jump on carry
        JMP ONE       ; unconditional jump to line 16  
SIGN:   JS PLUS       ; jump on sign bit
        JMP ONE       ; unconditional jump to line 16
PLUS:   INC CX        ; increase CX register by 1
ONE:    DEC BX        ; decrease BX register by 1   
        JNZ REPEAT    ; jump on non zero to repeat the program,
                      ; until Bx register is zero  
        RET

CODE ENDS
END 

