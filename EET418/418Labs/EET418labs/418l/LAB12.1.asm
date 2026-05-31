;Volume of box=x*y*z

DATA SEGMENT
    X   DW  0ABCDh
    Y   DW  0BCDEh
    Z   DW  0CDEFh
DATA ENDS

    
CODE SEGMENT
        
        ASSUME DS:DATA,CS:CODE

VOLUME:   MOV AX,DATA ; MOVE DATA TO AX REGISTER
          MOV DS,AX   ; MOVE AX TO DATA SEGMENT  
          XOR AX,AX   ; CLEAR AX REGISTER
          MOV AX,X    ; MOVE X TO AX  
          XOR BX,BX   ; CLEAR BX REGISTER  
          MOV BX,Y    ; MOVE Y TO BX  
          
          MUL BX      ; MULTIPLY BX BY AX  
         
          MOV CX,DX   ; MOVE DX TO CX  
          MOV BX,Z    ; MOVE Z TO BX  
          MUL BX      ; MULTIPLY BX TO AX  
          MOV DI,AX   ; MOVE AX TO DI  
          MOV AX,CX   ; MOVE CX TO AX
          MOV CX,DX   ; MOVE DX TO CX  
          MUL BX      ; MULTIPLY BX BY AX
          ADD AX,CX   ; ADD AX AND CX
          
          
          MOV SI,AX   ; MOVE AX TO SI
          
          MOV BP,DX   ; MOV DX TO BP
          
          HLT
          ; THE ANSWER WILL BE IN BP,SI,DI BECAUSE 
          ; IT WILL NOT FIT IN 16 BIT REGISTER  

CODE ENDS
END VOLUME


