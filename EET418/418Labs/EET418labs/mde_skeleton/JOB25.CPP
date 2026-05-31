//STEEVE BISSERETH
//JOB 25 KEYBOARD READ SUBROUTINE
//KEYBOARD 1 IN ASSEMBLY LANGUAGE

#include <stdio.h>
#include "mdedriverdll.h"
#include <iostream>
#include <fstream>
#include <string>

int main()
{
long int timer;
unsigned short Output=0; //type short = 16 bits
unsigned char Aout, Bin; //unsigned char = 8 bits without making MSB sign bit
                         //int = 32 bits, high order bit sign bit
                         //unsigned int =32 bits, no sign bit
Aout = 254;     //Aout =254 decimal = 1111110 Binary
Bin = 0;      //initialize Bin

MDEOpenDriver();   // This opens driver
MDEOpenLPTPort(0x378); //MDEOpenLPTPort(int baseaddress), baseaddress=378h
MDEConfigPort(0x378, 0x82); //this sends the contro word,0x82 = Port B input

MDEOutPA (0x378,Aout); //this sends a value to port a
Bin=(unsigned char) MDEInPB(0X378); //THIS GETS A VALUE FROM PORT B, CASTS THE INT INUT
                                    // AS AN UNSIGNED CHAR INSTEAD OF INT TO CORRESPOND
                                    // WITH DATA TYPE OF BIN

_asm
    {
       mov al, Aout
       mov bl, Bin
again: mov al, Aout
       cmp bl,255
       jne done
       ror al,1
       mov Aout,al
   }         // end ASM

MDEOutPA(0x378, Aout);
for (timer=9999; timer>0; timer--);
  Bin=(unsigned char)MDEInPB(0x378);

_asm
{
      mov bl,Bin
      jmp again
done: mov bh,al
      mov Output,bx
}//end asm

printf("\nThe code for that key is %x\n",Output);
system("pause");
}//end main


