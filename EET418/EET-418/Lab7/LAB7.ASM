;Lab No 7 Submitted to Professor Balaji
;By Piter Garcia
CODE SEGMENT

ASSUME CS:CODE

I2J2: CMP AX,BX	; Comparing which one is smaller.
      JC DIVIDE	; Jumping to DIVIDE if Ax IS smaller. 
      SHR BX,1	; shifting BX to the right.
      JMP CONT	; Jumping to add registers.
      
DIVIDE: SHR AX,1	; Dividing register ax by 2.

CONT:   ADD AX,BX	; Adding Registers.
        RET

CODE ENDS
END I2J2
END