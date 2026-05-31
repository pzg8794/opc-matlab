;Steeve Bissereth
;AND_XOR

CODE SEGMENT

    ASSUME CS:CODE
         
AND_XOR: PUSH AX
	 PUSH CX
	 AND AX,BX
	 AND CX,DX
	 XOR AX,CX
	 MOV SI,AX
	 POP CX
	 POP AX
	 HLT
        
CODE ENDS
END AND_XOR
    END