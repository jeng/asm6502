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
#ifdef __GNUC__
#include <unistd.h>
#endif

#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <synchapi.h>
#endif

typedef enum  {
  False = 0,
  True = 1
} Bool;

#include "asm6502.h"

#define ESC 0x1b

void clearDisplay() {
  printf("%c[2J",ESC);
}

//TODO use vtcolors 
void plot(Bit8 x, Bit8 y, Bit8 idx, void *p){
  char *colorTbl = "* /.-=[]|(&~#$+_";
  char c = *(colorTbl + idx);
  x = x + 1;
  y = y + 1;
  printf("\033[%dC",x);
  printf("\033[%dB",y);
  printf("%c",c);
  /*go back to the origin */
  printf("\033[%dD",x+1);
  printf("\033[%dA",y); 

}


//ESC[ 38:5:(n) m Select foreground color
//ESC[ 48:5:(n) m Select background color
void plotVT(Bit8 x, Bit8 y, Bit8 idx, void *p){
  int colorTbl[16] = {0, 15, 88, 87, 129, 83, 19, 227, 216, 94, 131, 236, 243, 114, 32, 252};
  x = x + 1;
  y = y + 1;
  printf("\033[%d;%dH", y, x);
  printf("\033[48;5;%dm", colorTbl[idx]);
  //printf("\033[38;5;%dm", colorTbl[idx]);
  printf(" ");
  /*move the color back*/
  //printf("\033[0m");
  /*go back to the origin */
  //printf("\033[%dD",x+1);
  //printf("\033[%dA",y); 

}

void mysleep(float milliseconds){
#ifdef _WIN32
      Sleep(milliseconds);
#else
      sleep(milliseconds/1000);
#endif
}


int main(int argc, char **argv){
  machine_6502 *machine = build6502();
  if (argc == 1)
    fprintf(stderr,"usage: assembler filename");
  else if (argc == 5 && strncmp(argv[1], "-d", 2) == 0){
    int pc_start = 0;
    sscanf(argv[4], "%x", &pc_start);
    start_eval_file(machine, argv[2], plotVT, NULL);
    save_program(machine, argv[3], False, pc_start);
  }      
  else {
    clearDisplay();
#if 1
    start_eval_file(machine,argv[1],plotVT,NULL);
    
    while (True) {
      next_eval(machine,500);
        mysleep(1);
      if (!machine->codeRunning) break;
    }
#else
    eval_file(machine,argv[1],plot,NULL);
#endif

  }

  destroy6502(machine);
  return 0;
}
