;subroutine to convert BCD TO BIN
CODE SEGMENT
        
        ASSUME CS:CODE
       XOR  AX,AX
       MOV  CH,4
       
       JMP jump
       
X10:   SHL  AX,1  
       MOV  BX,AX
       MOV  CL,2
       SHL  AX,CL
       ADD  AX,BX
       
       MOV  DX, 6789h
jump:  MOV  CL,4
       ROL  DX,CL
       MOV  BX,DX
       AND  BX,000Fh
       ADD  AX,BX
       
       DEC  CH 
       JNZ  X10
       
        RET
CODE ENDS
END 
  