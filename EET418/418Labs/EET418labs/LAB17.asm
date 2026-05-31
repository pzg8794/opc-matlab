;STEEVE BISSERETH

;SUPER FAST BINARY TO BCD.

; 12 BIT BINARY IN BX
; (UPPER 12 BITS OF BX).

; BCD RETURNED IN AX.

CODE SEGMENT

    ASSUME CS:CODE
    
BIN12BCD: XOR AX,AX
          XOR CX,CX
          XOR DX,DX
          MOV CH,12
          
AGAIN:    RCL BX,1
          ADC AL,AL
          DAA
          DEC CH
          JNZ AGAIN
          
          RET

CODE ENDS
END BIN12BCD
