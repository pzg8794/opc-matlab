/*PROGRAM NAME "PIO12"
 CHECKS OUT I/O BOARD THAT
 CONNECTS T0 PIO12.*/

#include <windows.h>               // header for Sleep
#include <iostream>
#include <iomanip>
#include <conio.h>
#include "mdedriverdll.h"          // include header for the DLL

using namespace std;
int main()
  {
  int  iwork;
  unsigned char ivalue;
                  
  cout << setiosflags(ios::unitbuf);
  cout << "\n\nPlease check ports for operation\n";
  cout << "\nPress anykey to exit";                    
                                                
  ivalue = 0x00;                      // initial value
  MDEOpenLPTPort(0x378);              // initialize driver
  iwork = MDEConfigPort(0x378, 0x82); // The control word PB=in PA=out

  
  do
    {
       ivalue = MDEInPB(0x378);
	  _asm
	  {
		  mov al,ivalue
		  ror al,1
		  mov ivalue,al
	  }
       MDEOutPA(0x378, ivalue);                // send the value
	}  
       while (kbhit());
  MDECloseDriver();                               // close the driver
     return 0;
   }



     