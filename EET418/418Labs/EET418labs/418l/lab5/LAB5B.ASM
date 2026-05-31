      ;LAB 5b

      ;BCD TO BIN
      ;MODIDY THE LAB 5a FOR 32 BITS.
CODE SEGMENT
.386
      ASSUME CS:CODE
      BCDBIN: XOR EAX,EAX
              MOV ECX,4

      JMP JUMP

      X10: SHL EAX,1
           MOV EBX,EAX
           MOV ECX,2
           SHL EAX,CL
           ADD EAX,EBX

     JUMP: MOV ECX,4
           ROL EDX,CL
           MOV EBX,EDX
           AND EBX,000Fh
           ADD EAX,EBX

           DEC ECX
           JNZ X10

           RET
         CODE ENDS
         END
