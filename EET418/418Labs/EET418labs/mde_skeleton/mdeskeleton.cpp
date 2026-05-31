/******************************************************************************
 Description : This is a skeleton to use with the MDEDriverDLL.  It has the 
               Library file already declared
 Date        : 10/21/2003
 Version     : 1.3
 Board       : MDE8255LPT-1
 Compiler    : VC++ 6.0
 Website     : www.MicroDigitalEd.com
 Email       : rmckinlay@microdigitaled.com
 OS          : Windows XP
 
 Required files     build type  ver  location
-------------------------------------------------------------
 mdedriverdll.h     released    1.2  in source file directory
 mdedriverdll.lib   released    1.2  in source file directory
 mdedriverdll.dll   released    1.2  in executable directory

*******************************************************************************/
#include <windows.h>
#include <stdio.h>
#include <conio.h>
#include "mdedriverdll.h"


void main()
  {
  int idriverstatus;  

  printf("\nOpening port...");
  idriverstatus = MDEOpenLPTPort(0x378);
  if(idriverstatus == 0)
    {
    printf("Failed");
    }
  else
    {
    printf("Passed");
    }
    
    
/****************************************************************/
  printf("\nConfig Port....");
  MDEConfigPort(0x378, 0x80);
  printf("Done");


// Insert your code here


/****************************************************************/
  printf("\nClosing port...");          
  idriverstatus = MDECloseDriver();
  if(idriverstatus == 0)
    {
    printf("Failed");
    }
  else
    {
    printf("Passed");
    }

  printf("\n\n");
  }
  