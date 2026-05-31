#include <windows.h>               // header for Sleep
#include <iostream>
#include <iomanip>
#include <conio.h>
#include "mdedriverdll.h"          // include header for the DLL
using namespace std;
int main()
{
	long int timer;
    unsigned short Output=0;
	unsigned char Aout,Bin,p;

	Aout=254;
	Bin=0x00;

	MDEOpenDriver();
	MDEOpenLPTPort(0x378);   
	MDEConfigPort(0x378, 0x82);
    
	MDEOutPA(0x378,Aout);
    Bin=(unsigned char)MDEInPB(0x378);

	_asm
	{	
         mov al,Aout
		 mov bl,Bin
again:	mov al, Aout
		cmp bl,255
		jne done
		ror al,1
		mov Aout,al
	} 
	
	
	MDEOutPA(0x378, Aout);
	for(timer=9999;timer>0;timer--);
	{
	Bin=(unsigned char)MDEInPB(0x378);
	}
    _asm
	{
        mov bl,Bin;    
      jmp again
	    done: mov bh,al
      
		mov Output,bx;
	}
	printf("\nThe code for that key is %x\n",Output);
        MDECloseDriver();  
	cin>>p;
}

