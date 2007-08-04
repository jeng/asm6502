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
  6502 debugger.
*/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <ctype.h>

typedef enum  {
  False = 0,
  True = 1
} Bool;

#include "asm6502.h"

enum{
  MAX_BREAK = 50 /* The maximum number of break points allowed */
    };

static Bool ishexdigit(char c){
  if (isdigit(c))
    return True;
  else {
    char c1 = toupper(c);
    return ('A' <= c1 && c1 <= 'F');
  }
}

static void skipspace(){
  char c;
  while((c = getc(stdin)) != EOF){
    if (c != ' '){
      ungetc(c,stdin);
      break;
    }
  }
}

static Bit16 getAddress(Bool *hasSecond ){
  /* Read the hex address from stdin */
  int c;
  int max = 5;
  char buf[] = {'\0','\0','\0','\0','\0'};
  unsigned int n = 0;

  skipspace();
  while((c = getchar()) != EOF && n < max){
    if (c == '\n' || c == ',' || c == ' ') {
      if (c == ' '){
	skipspace();
	c = getchar();
      }
      *hasSecond = (c == ',');	
      break;
    }
    if (ishexdigit(c)){
      buf[n++] = c;
    }
    else {
      fprintf(stderr,"Invalid character only hex address are allowed.\n");
      return 0;
    }
  }
  if (n == max){
    fprintf(stderr,"The memory address is to large. The maximum memory address is $FFFF\n");
    return 0;
  }
  return strtol(buf,NULL,16);
}

static void getfilename(char *filename, unsigned int max) {
  unsigned int n = 0;
  int c;

  for(n = 0; n < max; n++)
    filename[n] = '\0';
  
  skipspace();
  n = 0;
  while((c = getchar()) != EOF && n < max){
    if (c == '\n') break;
    filename[n++] = c;
  }
  if (n == max){
    fprintf(stderr,"The filename is to long.\n");
    filename[0] = '\0';
  }
}

static void help(){
  fprintf(stdout,"n - Execute the next instruction.\n");
  fprintf(stdout,"a - Disassemble the program in memory and save it to a file.\n");
  fprintf(stdout,"b - Set a breakpoint a certain address.\n");
  fprintf(stdout,"c - Continue running the program until a break point is reached.\n");
  fprintf(stdout,
	  "d - Enter a hexidecimal address to print the memory at that address.\n\tstart[,end]\n");
  fprintf(stdout,"p - Enter a filename to save the program.\n");
  fprintf(stdout,"q - Quit.\n");
  fprintf(stdout,"? - Prints this screen.\n");
}

static void handleCommands(machine_6502 *machine, Bit16 *breaks, int *bpi){
  int c;
  Bit16 start;
  Bit16 end;
  Bit16 numbytes;
  Bool hasSecond;
  fprintf(stdout,"- ");
  c = getchar();
  switch(c){
  case 'a':
    {
      int max = 255;
      char *filename = calloc(max,sizeof(char));
      FILE *out;
      if (filename){
	getfilename(filename,max);
	if (filename[0]){
	  out = fopen(filename, "w");
	  if (out != NULL){
	    disassemble(machine,out);
	    fclose(out);
	  }
	  else {
	    fprintf(stderr,"Could not open file: %s",filename);
	  }
	}
	free(filename);
      }
      else{
	fprintf(stderr,"Could note get memory for the file name.\n");
      }
    }
    return;
  case 'b': /* set a break point */
    {
      Bit16 bp;
      if (*bpi == MAX_BREAK)
	fprintf(stderr,"To many break points.\n");
      else{
	bp = getAddress(&hasSecond);
	breaks[(*bpi)++] = bp;
      }
    }
    return;
  case 'c':{
    getchar(); /* eat the return */
    while(1){
      int i = 0;
      while(i < *bpi){
	if (machine->regPC == breaks[i++])
	  return;
      }
      next_eval(machine,2);
      trace(machine, stdout);
      if (!machine->codeRunning) return;
    }
  }      
  case 'n': 
    getchar(); /* eat the return */
    next_eval(machine,2);
    trace(machine, stdout);
    return;
  case 'd': /* dump the memory address */
    start = getAddress(&hasSecond);
    if (hasSecond){
      end = getAddress(&hasSecond);
      numbytes = abs(start - end);
      if (hasSecond){
	fprintf(stderr,"Only a starting and ending address are allowed.\n");
      }
    }
    else{
      numbytes = 80;
    }
    hexDump(machine,start,numbytes,stdout);
    break;
  case 'p': /* save the program to a file */
    {
      int max = 255;
      char *filename = calloc(max,sizeof(char));
      if (filename){
	getfilename(filename,max);
	if (filename[0]){
	  save_program(machine,filename);
	}
	free(filename);
      }
      else {
	fprintf(stderr,"Could not get memory for the file name\n");
      }
    }
    break;
  case 'q':
    exit(0);
    break;
  case '?':
    help();
    getchar();
    break;
  default:
    fprintf(stderr,"Invalid command %c\n",c);
    help();
  }
}


int main(int argc, char **argv){
  machine_6502 *machine = build6502();
  Bit16 *breaks;
  breaks = calloc(MAX_BREAK,sizeof(Bit16));
  int bpi = 0;

  if (breaks == NULL){
    fprintf(stderr,"Could not allocate enough memory for the break points.");
    return 1;
  }
    
  if (argc == 1)
    fprintf(stderr,"usage: debug-6502 filename");
  else {
    start_eval_file(machine,argv[1],NULL,NULL);
    trace(machine,stdout);
    while (True) {
      handleCommands(machine,breaks,&bpi);
      if (!machine->codeRunning) break;
    }
    fprintf(stdout,"The program is finished.\n");
  }
  
  destroy6502(machine);
  free(breaks);
  return 0;
}
