/* Copyright (C) 2007 Jeremy English <jhe@jeremyenglish.org>
 * 
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation.  No representations are made about the suitability of this
 * software for any purpose.  It is provided "as is" without express or 
 * implied warranty.
 * 
 * Created: 12-April-2007 
 */ 

/*
   Text mode 6502.
*/

#include <stdio.h>
#include <stdint.h>

typedef enum  {
  False = 0,
  True = 1
} Bool;

#include "asm6502.h"

void clearDisplay() {
  printf("%c[2J",0x1b);
}

void plot(Bit8 x, Bit8 y, Bit8 idx){
  char *colorTbl = "* /.-=[]|(&~#$+_";
  char c = *(colorTbl + idx);
  x = x + 1;
  y = y + 1;
  printf("%c[%dC",0x1b,x);
  printf("%c[%dB",0x1b,y);
  printf("%c",c);
  /*go back to the origin */
  printf("%c[%dD",0x1b,x+1);
  printf("%c[%dA",0x1b,y); 

}


int main(int argc, char **argv){
  machine_6502 *machine = build6502();
  clearDisplay();
  if (argc == 1)
    fprintf(stderr,"usage: assembler filename");
  else
    evalFile(machine,argv[1],plot);
  destroy6502(machine);
  return 0;
}
