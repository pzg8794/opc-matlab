/******************************************************************************
 Description : This is the header file for the DLL used to interface the 
               MDE8255LPT-1
             
 Date        : 07/21/2003
 Version     : 1.0a
 Board       : NA
 Compiler    : VC++ 6.0
 Website     : www.MicroDigitalEd.com
 Email       : rmckinlay@microdigitaled.com

 Required files             location
-------------------------------------------------------------
 mdedriverdll.lib           in source file directory
 mdedriverdll.dll           in executable directory
 mdedriver.sys              in windows\system32\drivers directory

*******************************************************************************/

// The following functions return -1 if there
// is a failure 
int MDEOpenDriver();                           // This opens the driver
int MDECloseDriver();                          // this closes the driver
int MDEOutPA(int baseaddress, int value);      // this sends a value to port a
int MDEOutPB(int baseaddress, int value);      // this sends a value to port b
int MDEOutPC(int baseaddress, int value);      // this sends a value to port c
int MDEConfigPort(int baseaddress, int value); // this sends the control word
int MDEInPA(int baseaddress);                  // this gets a value from port a
int MDEInPB(int baseaddress);                  // this gets a value from port b
int MDEInPC(int baseaddress);                  // this gets a value from port c
int MDEOpenLPTPort(int baseaddress);

// These defines will assist with the board configuration
#define BaseConfig   0x80                      // base value
#define PortAIn      0x10                      // make port a an input
#define PortCUIn     0x08                      // make port cu an input
#define PortBIn      0x02                      // make port b an input
#define PortCLIn     0x01                      // make port cl an input