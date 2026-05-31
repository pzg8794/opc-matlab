Microsoft (R) Macro Assembler Version 5.10                  11/9/9


                                ;Odane Godfrey
                                ;SUBROUTINE TO CALCULATE
                                ;AVERAGE OF 8 "X SQUARED" SAMPLES
                                
 0000                           DATA SEGMENT
 0000  FF FF AA BB                    X      DB   255,255,170,187
 0004  CC DD EE FF                           DB   204,221,238,255
                                             
 0008                           DATA ENDS
                                
 0000                           CODE SEGMENT
                                     
                                       ASSUME DS:DATA,CS:CODE
                                       
 0000  B8 ---- R                STAT:       MOV   AX,DATA
 0003  8E D8                                MOV   DS,AX
                                            
 0005  8D 36 0000 R                         LEA SI,X
 0009  B9 0000                              MOV CX,00
 000C  BA 0008                              MOV DX,08
                                            
 000F  B8 0000                      AGAIN:   MOV AX,0
 0012  8A 04                                MOV AL,[SI]
 0014  F6 E0                                MUL AL
 0016  03 C8                                ADD CX,AX
 0018  83 D3 00                             ADC BX,00
 001B  46                                   INC SI
 001C  4A                                   DEC DX
 001D  75 F0                                JNZ AGAIN
                                            
 001F  D1 EB                                SHR BX,1   ;DIVIDES BY 2  
 0021  D1 D9                                RCR CX,1 
 0023  D1 EB                                SHR BX,1   ;DIVIDES BY 4  
 0025  D1 D9                                RCR CX,1
 0027  D1 EB                                SHR BX,1   ;DIVIDES BY 8
 0029  D1 D9                                RCR CX,1
                                            
 002B  C3                                  RET
                                           
 002C                                      CODE ENDS
                                           END STAT

     41 Source  Lines
     41 Total   Lines
     10 Symbols

  46866 + 401866 Bytes symbol space free

      0 Warning Errors
      0 Severe  Errors

