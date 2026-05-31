;Volume of box=x*y*z

DATA SEGMENT
    X   DW  0ABh
    Y   DW  0CDh
    Z   DW  0EFh
DATA ENDS

    
CODE SEGMENT
        
        ASSUME DS:DATA,CS:CODE

VOLUME:   MOV AX,DATA ; MOVE DATA TO AX REGISTER
          MOV DS,AX   ; MOVE AX TO DATA SEGMENT
          XOR AX,AX   ; CLEAR AX REGISTER
          MOV AX,X    ; MOVE X TO AX
          XOR BX,BX   ; CLEAR BX REGISTER
          MOV BX,Y    ; MOVE Y TO BX
          MUL BX      ; MULTIPLY AX TO BX  
          MOV BX,Z    ; MOVE Z TO BX  
          MUL BX      ; MULTIPLY AX TO BX  
          HLT
       

CODE ENDS
END VOLUME


