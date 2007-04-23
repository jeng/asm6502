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

      This is a port of the javascript 6502 assembler, compiler and
      debugger. The orignal code was copyright 2006 by Stian Soreng -
      www.6502asm.com

      It is a real mess right now. Don't prototype in C is an
      important lesson. I jumped right in to coding and now I have to
      clean things up.

*/

#include <stdlib.h>
#include <stdio.h>
#include <malloc.h>
#include <string.h>
#include <errno.h>
#include <stdarg.h>
#include <assert.h>
#include <ctype.h>
#include <math.h>
#include <stdint.h>
#include "memwatch.h"

enum {
  MAX_MEM = 1023,
  MAX_LINE_LENGTH = 256,
  NUM_OPCODES = 56,
  MEM_64K = 77056
};

typedef enum  {
  False = 0,
  True = 1
} Bool;

typedef enum{
  LABEL, DIRECTION, HILO, VALUE, BLANK, IMMEDIATE, INDIRECT
} ParamType;

typedef Bool (*CharTest) (char);

typedef uint8_t  Bit8;
typedef uint16_t Bit16;
typedef uint32_t Bit32;

typedef struct {
  char name[4];
  Bit8 Imm;
  Bit8 ZP;
  Bit8 ZPX;
  Bit8 ZPY;
  Bit8 ABS;
  Bit8 ABSX;
  Bit8 ABSY;
  Bit8 INDX;
  Bit8 INDY;
  Bit8 SNGL;
  Bit8 BRA;
} Opcodes;

struct _Label {
  char *name;
  Bit32 addr;
  struct _Label *next;
};

typedef struct _Label Label;

typedef struct {
  Label *head;
  Label *list;
} LabelList;

typedef struct {
  char *label;
  char *command;
  char *parameter;
} AsmLine;

typedef struct {
  char  direction;
  char  hilo;
  Bit32 value;
  char label[MAX_LINE_LENGTH];
  ParamType type;
} ParamStruct;

typedef struct {
  Bool codeCompiledOK;
  Bit8 regA;
  Bit8 regX;
  Bit8 regY;
  Bit8 regP;
  Bit16 regPC; /* A pair of 8 bit registers */
  Bit8 regSP;
  Bit8 memory[MEM_64K];
  Bool runForever;
  LabelList *labelIndex;
  int labelPtr;
  Bool codeRunning;
  int myInterval;
  Opcodes opcodes[NUM_OPCODES];
  int screen[32][32];
  int codeLen;
  char *source;
  unsigned int sourceLen;
} machine_6502;

typedef Bool (*NextToken) (AsmLine *, machine_6502 *);

void assignOpCodes(Opcodes *opcodes){

#define SETOP(num, _name, _Imm, _ZP, _ZPX, _ZPY, _ABS, _ABSX, _ABSY, _INDX, _INDY, _SNGL, _BRA) \
{opcodes[num].name[4] = '\0'; \
 strncpy(opcodes[num].name, _name, 3); opcodes[num].Imm = _Imm; opcodes[num].ZP = _ZP; \
 opcodes[num].ZPX = _ZPX; opcodes[num].ZPY = _ZPY; opcodes[num].ABS = _ABS; \
 opcodes[num].ABSX = _ABSX; opcodes[num].ABSY = _ABSY; opcodes[num].INDX = _INDX; \
 opcodes[num].INDY = _INDY; opcodes[num].SNGL = _SNGL; opcodes[num].BRA = _BRA;}

  /*        OPCODE Imm   ZP    ZPX   ZPY   ABS   ABSX  ABSY  INDX  INDY  SGNL  BRA */ 
  SETOP( 0, "ADC", 0x69, 0x65, 0x75, 0x00, 0x6d, 0x7d, 0x79, 0x61, 0x71, 0x00, 0x00);
  SETOP( 1, "AND", 0x29, 0x25, 0x35, 0x31, 0x2d, 0x3d, 0x39, 0x00, 0x00, 0x00, 0x00);
  SETOP( 2, "ASL", 0x00, 0x06, 0x16, 0x00, 0x0e, 0x1e, 0x00, 0x00, 0x00, 0x0a, 0x00);
  SETOP( 3, "BIT", 0x00, 0x24, 0x00, 0x00, 0x2c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP( 4, "BPL", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10);
  SETOP( 5, "BMI", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30);
  SETOP( 6, "BVC", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50);
  SETOP( 7, "BVS", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70);
  SETOP( 8, "BCC", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90);
  SETOP( 9, "BCS", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb0);
  SETOP(10, "BNE", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xd0);
  SETOP(11, "BEQ", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0);
  SETOP(12, "CMP", 0xc9, 0xc5, 0xd5, 0x00, 0xcd, 0xdd, 0xd9, 0xc1, 0xd1, 0x00, 0x00);
  SETOP(13, "CPX", 0xe0, 0xe4, 0x00, 0x00, 0xec, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(14, "CPY", 0xc0, 0xc4, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(15, "DEC", 0x00, 0xc6, 0xd6, 0x00, 0xce, 0xde, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(16, "EOR", 0x49, 0x45, 0x55, 0x00, 0x4d, 0x5d, 0x59, 0x41, 0x51, 0x00, 0x00);
  SETOP(17, "CLC", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00);
  SETOP(18, "SEC", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x00);
  SETOP(19, "CLI", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x00);
  SETOP(20, "SEI", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x00);
  SETOP(21, "CLV", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb8, 0x00);
  SETOP(22, "CLD", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xd8, 0x00);
  SETOP(23, "SED", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x00);
  SETOP(24, "INC", 0x00, 0xe6, 0xf6, 0x00, 0xee, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(25, "JMP", 0x00, 0x00, 0x00, 0x00, 0x4c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(26, "JSR", 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(27, "LDA", 0xa9, 0xa5, 0xb5, 0x00, 0xad, 0xbd, 0xb9, 0xa1, 0xb1, 0x00, 0x00);
  SETOP(28, "LDX", 0xa2, 0xa6, 0x00, 0xb6, 0xae, 0x00, 0xbe, 0x00, 0x00, 0x00, 0x00);
  SETOP(29, "LDY", 0xa0, 0xa4, 0xb4, 0x00, 0xac, 0xbc, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(30, "LSR", 0x00, 0x46, 0x56, 0x00, 0x4e, 0x5e, 0x00, 0x00, 0x00, 0x4a, 0x00);
  SETOP(31, "NOP", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xea, 0x00);
  SETOP(32, "ORA", 0x09, 0x05, 0x15, 0x00, 0x0d, 0x1d, 0x19, 0x01, 0x11, 0x00, 0x00);
  SETOP(33, "TAX", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xaa, 0x00);
  SETOP(34, "TXA", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8a, 0x00);
  SETOP(35, "DEX", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xca, 0x00);
  SETOP(36, "INX", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe8, 0x00);
  SETOP(37, "TAY", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa8, 0x00);
  SETOP(38, "TYA", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x98, 0x00);
  SETOP(39, "DEY", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00);
  SETOP(40, "INY", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc8, 0x00);
  SETOP(41, "ROR", 0x00, 0x66, 0x76, 0x00, 0x6e, 0x7e, 0x00, 0x00, 0x00, 0x6a, 0x00);
  SETOP(42, "ROL", 0x00, 0x26, 0x36, 0x00, 0x2e, 0x3e, 0x00, 0x00, 0x00, 0x2a, 0x00);
  SETOP(43, "RTI", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00);
  SETOP(44, "RTS", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00);
  SETOP(45, "SBC", 0xe9, 0xe5, 0xf5, 0x00, 0xed, 0xfd, 0xf9, 0xe1, 0xf1, 0x00, 0x00);
  SETOP(46, "STA", 0x00, 0x85, 0x95, 0x00, 0x8d, 0x9d, 0x99, 0x81, 0x91, 0x00, 0x00);
  SETOP(47, "TXS", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9a, 0x00);
  SETOP(48, "TSX", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xba, 0x00);
  SETOP(49, "PHA", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00);
  SETOP(50, "PLA", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x68, 0x00);
  SETOP(51, "PHP", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00);
  SETOP(52, "PLP", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00);
  SETOP(53, "STX", 0x00, 0x86, 0x00, 0x96, 0x8e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(54, "STY", 0x00, 0x84, 0x94, 0x00, 0x8c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
  SETOP(55, "---", 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
}


/* eprintf - Taken from "Practice of Programming" by Kernighan and Pike */
void eprintf(char *fmt, ...){
  va_list args;
  
  char *progname = "Assembler";

  fflush(stdout);
  if (progname != NULL)
    fprintf(stderr, "%s: ", progname);

  va_start(args, fmt);
  vfprintf(stderr, fmt, args);
  va_end(args);
  
  if (fmt[0] != '\0' && fmt[strlen(fmt) -1] == ':')
    fprintf(stderr, " %s", strerror(errno));
  fprintf(stderr, "\n");
  exit(2); /* conventional value for failed execution */
}

/* emalloc - Taken from "Practice of Programming" by Kernighan and Pike.
   If have added memory initialization like calloc. If memory allocatiion
   fails the program will print a message an exit. */
void *emalloc(size_t n) {
  void *p;
  
  p = malloc(n);
  if (p == NULL)
    eprintf("malloc of %u bytes failed:", n);
  memset(p,'\0',n);
  return p;
}

/* estrdup() - Allocates memory for a new string a returns a copy of the source sting in it. */
char *estrdup(char *source){
  int ln = strlen(source) + 1;
  char *s = emalloc(ln * sizeof(char));
  strncpy(s,source,ln);
  return s;
}


/** 
 ** Tokenizer
 */

/* stoupper() - Destructivley modifies the string making all letters upper case*/
void stoupper(char *s){
  int i = 0;
  assert(s != NULL);
  while(s[i] != '\0'){
    s[i] = toupper(s[i]);
    i++;
  }
}
 
Bool isWhite(char c){
  return (c == '\r' || c == '\t' || c == ' ');
}

void skipWhiteSpace(char **s){
  for(; isWhite(**s); (*s)++)
    ;
}
  
/* nullify() - fills a string with upto sourceLength null characters. */
void nullify(char *token, unsigned int sourceLength){
  unsigned int i = 0;
  while (i < sourceLength)
    token[i++] = '\0';
}

Bool isBlank(const char *token){
  return (token[0] == '\0');
}

Bool isLabel(const char *token){
  int idx = strlen(token) -1;
  return (token[idx] == ':');
}

Bool isCommand(const char *token, machine_6502 *machine){
  int i = 0;

  while (i < NUM_OPCODES) {
    if (strcmp(machine->opcodes[i].name,token) == 0) 
      return True;
    i++;
  }
  
  if (strcmp(token, "DCB") == 0) return True;
  return False;
}

Bool isParameter(const char *token){
  char first = token[0];
  if (isalnum(first)) return True;
  switch (first) {
  case '\0': return True; /* Blank parameters are allowed */
  case '#': return True;
  case '$': return True;
  case '(': return True;
  default: return False;
  }
}

/* fileToBuffer() - Allocates a buffer and loads all of the file into memory. */
char *fileToBuffer(char *filename, unsigned int *returnSize){
  const int defaultSize = 1024;
  FILE *ifp;
  int c;
  int size = defaultSize;
  int i = 0;
  char *buffer = calloc(defaultSize,sizeof(char));

  if (buffer == NULL) 
    eprintf("Could not allocate memory for buffer.");

  ifp = fopen(filename, "rb");
  if (ifp == NULL)
    eprintf("Could not open file.");

  while((c = getc(ifp)) != EOF){
    buffer[i++] = c;
    if (i == size){
      size += defaultSize;
      buffer = realloc(buffer, size);
      if (buffer == NULL) {
	fclose(ifp);
	eprintf("Could not resize buffer.");
      }
    }
  }
  fclose(ifp);
  *returnSize = i;
  buffer = realloc(buffer, *returnSize+2);
  if (buffer == NULL) 
    eprintf("Could not resize buffer.");
  /* Make sure we have a line feed at the end */
  buffer[*returnSize] = '\n';
  buffer[*returnSize+1] = '\0';
  *returnSize+=2;
  return buffer;
}
 
 

/**
 ** Label Routines
 */

/* freeLabels() - Release all of the memory used by the label list. */
void freeLabels(LabelList *labelList){
  Label *ls = labelList->head;
  while (ls != NULL) {
    Label *tmp = ls;
    ls = ls->next;
    free(tmp->name);
    free(tmp);
  }
  labelList->list = NULL;
  labelList->head = NULL;
}

/* findLabel() - Returns true if the label exists. */
Bool findLabel(LabelList *labelList, char *name){
  Label *ls = labelList->head;
  while(ls != NULL){
    if (strcmp(ls->name, name) == 0)
      return True;
    ls = ls->next;
  }
  return False;
}

/* pushLabel() - Push label onto the list. Return false if label already exists. */
Bool pushLabel(LabelList *labelList, char *name, int addr){
  if ( isBlank(name) || findLabel(labelList, name ) ) return False;

  if (labelList->head == NULL){
    labelList->list = emalloc(sizeof(Label));
    labelList->head = labelList->list;
  } 
  else {
    Label *new = emalloc(sizeof(Label));
    labelList->list->next = new;
    labelList->list = new;
  }
  labelList->list->name = estrdup(name);
  labelList->list->name[strlen(name)-1] = '\0'; /* overwrite the colon */
  labelList->list->addr = addr;
  labelList->list->next = NULL;
  return True;
}

/* setLabelPC() - Associates label with address */
Bool setLabelPC(LabelList *labelList, char *name, int addr) {
  Label *ls = labelList->head;
  while(ls != NULL){
    if (strcmp(ls->name, name) == 0){
      ls->addr = addr;
      return True;
    }
    ls = ls->next;
  }
  return False;
}

/* getLabelPC() - Get address associated with label */
int getLabelPC(LabelList *labelList, char *name){
  Label *ls = labelList->head;
  while(ls != NULL){
    if (strcmp(ls->name, name) == 0)
      return ls->addr;
    ls = ls->next;
  }
  return -1;
}

/* labelCount() - Returns the number of labels in the LabelList */
int labelCount(LabelList *labelList){
  Label *ls = labelList->head;
  int c = 0;
  while(ls != NULL){
    c++;
    ls = ls->next;
  }
  return c;
}


/**
 ** Machine code
 */

/*  reset() - Reset CPU and memory. */
void reset(machine_6502 *machine){
  int x, y;
  for ( y = 0; y < 32; y++ ){
    for (x = 0; x < 32; x++){
      machine->screen[x][y] = 0;
    }
  }

  for(x=0; x<0x600; x++)
    machine->memory[x] = 0;

  machine->codeCompiledOK = False;
  machine->regA = 0;
  machine->regX = 0;
  machine->regY = 0;
  machine->regP = 0x20;
  machine->regPC = 0x600; 
  machine->regSP = 0xff; /* was 100, of by one? */
  machine->runForever = False;
  machine->labelPtr = 0;
  machine->codeRunning = False;
  freeLabels(machine->labelIndex);
}

void updateDisplayPixel( int addr ){
}

void checkAddress(Bit32 address){
  /* XXX: Do we want to kill the program here? */
  if (address >= MEM_64K)
    eprintf("Address %d is beyond 64k", address);
}

void pushByte(machine_6502 *machine, Bit32 value ) {
  Bit32 address = 0x600 + machine->codeLen;
  checkAddress(address);
  machine->memory[0x600 + machine->codeLen] = value & 0xff;
  machine->codeLen++;
}

/*
 * pushWord() - Push a word using pushByte twice
 *
 */

void pushWord(machine_6502 *machine, Bit16 value ) {
  pushByte(machine, value & 0xff );
  pushByte(machine, (value>>8) & 0xff );
}

/*
 * popByte( machine_6502 *machine,) - Pops a byte
 *
 */

Bit8 popByte( machine_6502 *machine) {
  Bit8 value = machine->memory[machine->regPC];
  machine->regPC++;
  return value;
}

/*
 * popWord() - Pops a word using popByte() twice
 *
 */

int popWord(machine_6502 *machine) {
  return popByte(machine) + (popByte(machine) << 8);
}

/*
 * memStoreByte() - Poke a byte, don't touch any registers
 *
 */

void memStoreByte( machine_6502 *machine, int addr, int value ) {
  machine->memory[ addr ] = (value & 0xff);
  if( (addr >= 0x200) && (addr<=0x5ff) )
    updateDisplayPixel( addr );
}

/*
 * memStoreByte() - Peek a byte, don't touch any registers
 *
 */

int memReadByte( machine_6502 *machine, int addr ) {
  if( addr == 0xfe ) return floor( rand()%255 );/*XXX: use random from other library*/
  return machine->memory[addr];
}

/* hexDump() - Dump the memory to stdout */
void hexDump(machine_6502 *machine){
  Bit32 address;
  Bit32 i;
  for( i = 0; i < machine->codeLen; i++){
    address = 0x600 + i;
    if ( (i&15) == 0 ) {
      printf("\n%.4lx: ", address);
    }
    printf("%.2x%s",machine->memory[address], (i & 1) ? " ":"");
  }
  if ( i&1 ) printf("-- [END]\n");
}

/* parseHex() - Converts HexString to a 32 bit integer.
   Hexstring is expected to be of the for "$<digits>" or "#$<digits>"*/
Bit32 parseHex(const char *hexstring){
  char hex[MAX_LINE_LENGTH];
  char s[MAX_LINE_LENGTH];
  nullify(hex,MAX_LINE_LENGTH);
  nullify(s,MAX_LINE_LENGTH);
  strncpy(s,hexstring,MAX_LINE_LENGTH);
  if (isBlank(s) || strlen(s) < 2) return 0;
  if (s[0] == '#' && s[1] == '$'){
    s[0] = '0';
    s[1] = 'x';
    return strtol(s,NULL,16);
  }
  if (s[0] == '$'){ 	
    s[0] = 'x';
    hex[0] = '0';
    strncat(hex,s,MAX_LINE_LENGTH);
    return strtol(hex,NULL,16);
  }
  return 0;
}


/* checkSingle() - Single-byte opcodes */
Bool checkSingle(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if (ps->type == BLANK) {
    pushByte(machine, opcode);
    return True;
  }
  return False;
}

Bool checkImmediate(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;

  if (ps->type == IMMEDIATE){
    if (ps->value <= 0xFF){
      pushByte(machine, opcode);
      pushByte(machine, ps->value);
      return True;
    }
  }
  else if (ps->type == HILO){
    pushByte(machine, opcode);
    if (findLabel(machine->labelIndex,ps->label)){
      Bit32 addr = getLabelPC(machine->labelIndex,ps->label);
      switch (ps->hilo){
      case '>':
	pushByte(machine, (addr >> 8) & 0xFF);
	return True;
      case '<':
	pushByte(machine, addr & 0xFF);
	return True;
      default:
	return False;
      }
    }
    else {
      pushByte(machine, 0x00); /* push a null byte on the first pass. */
      return True;
    }
  }
  return False;
}

/* checkZeroPage() - Check if param is ZP and push value */
Bool checkZeroPage(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if (ps->type == VALUE &&
      ps->value <= 0xFF){
    pushByte(machine, opcode);
    pushByte(machine, ps->value);
    return True;
  }
  return False;
}
Bool checkZeroPageX(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if (ps->type == DIRECTION && 
      ps->direction == 'X' &&
      ps->value <= 0xFF){
    pushByte(machine,opcode);
    pushByte(machine,ps->value);
    return True;
  }
  return False;
}
Bool checkZeroPageY(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if (ps->type == DIRECTION && 
      ps->direction == 'Y' &&
      ps->value <= 0xFF){
    pushByte(machine,opcode);
    pushByte(machine,ps->value);
    return True;
  }
  return False;
}

Bool checkAbsolute(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if (ps->type == VALUE){
    pushByte(machine, opcode);
    if (ps->value <= 0xFFFF){
      pushWord(machine, ps->value);
      return True;
    }
  }
  else if (ps->type == LABEL){
    if (findLabel(machine->labelIndex,ps->label)){
      Bit32 addr = getLabelPC(machine->labelIndex, ps->label);
      pushByte(machine,opcode);
      if (addr <= 0xFFFF) {
	pushWord(machine, addr );
	return True;
      }
    }
    else {
      pushByte(machine, opcode);
      pushWord(machine, 0xDEAD); /* default for first pass */
      return True;
    }
  }
  return False;
}

Bool checkAbsoluteX(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if (ps->type == DIRECTION && ps->direction == 'X'){
    if (isBlank(ps->label)){
      pushByte(machine,opcode);
      if (ps->value <= 0xFFFF){
	pushWord(machine,ps->value);
	return True;
      }
    } 
    else {
      if (findLabel(machine->labelIndex, ps->label)){
	Bit32 addr = getLabelPC(machine->labelIndex, ps->label);
	pushByte(machine,opcode);
	if (addr <= 0xFFFF){
	  pushWord(machine, addr);
	  return True;
	}
      }
      else {
	pushByte(machine, opcode);
	pushWord(machine, 0xDEAD); /* default for first pass */
	return True;
      }
    }
  }      
  return False;
}

Bool checkAbsoluteY(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if (ps->type == DIRECTION && ps->direction == 'Y'){
    if (isBlank(ps->label)){
      pushByte(machine,opcode);
      if (ps->value <= 0xFFFF){
	pushWord(machine,ps->value);
	return True;
      }
    } 
    else {
      if (findLabel(machine->labelIndex, ps->label)){
	Bit32 addr = getLabelPC(machine->labelIndex, ps->label);
	pushByte(machine,opcode);
	if (addr <= 0xFFFF){
	  pushWord(machine, addr);
	  return True;
	}
      }
      else {
	pushByte(machine, opcode);
	pushWord(machine, 0xDEAD); /* Default for first pass */
	return True;
      }
    }
  }      
  return False;
}

Bool checkIndirectX(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if(ps->type == INDIRECT && ps->direction == 'X'){
    pushByte(machine, opcode);
    if (ps->value <= 0xFF){
      pushByte(machine, ps->value);
      return True;
    }
  }
  return False;
}

Bool checkIndirectY(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if(ps->type == INDIRECT && ps->direction == 'Y'){
    pushByte(machine, opcode);
    if (ps->value <= 0xFF){
      pushByte(machine, ps->value);
      return True;
    }
  }
  return False;
}

Bool checkBranch(machine_6502 *machine, ParamStruct *ps, Bit8 opcode){
  if (!opcode) return False;
  if (ps->type == LABEL){
    Bit32 addr = getLabelPC(machine->labelIndex, ps->label);
    pushByte(machine, opcode);
    if (addr < (machine->codeLen+0x600)) { /* Backwards? */
      pushByte(machine, (0xff - (machine->codeLen - addr)) & 0xFF);
    }
    else
      pushByte(machine, (addr-machine->codeLen-1) & 0xFF);
    return True;
  }
  else {
    pushByte(machine,opcode);
    pushWord(machine,0);
  }
  return False;
}

/* compileLine() - Compile one line of code. Returns
   true if it compile successfully. */
Bool compileLine(AsmLine *asmline, machine_6502 *machine){
  if (isBlank(asmline->command)) return True;

  if (strcmp("DCB",asmline->command) == 0)
    return dcb(machine,asmline->parameter);
  else{
    int i;
    char *command = asmline->command;
    ParamStruct param;
    parseParam(asmline->parameter,&param);
    fprintf(stderr,"value: %lx\n",param.value);/*XXX: Debug*/
    for(i = 0; i < NUM_OPCODES; i++){
      if (strcmp(machine->opcodes[i].name, command) == 0){

	if( checkSingle(    machine, &param, machine->opcodes[i].SNGL) ) return True;
	if( checkImmediate( machine, &param, machine->opcodes[i].Imm ) ) return True;
	if( checkZeroPage(  machine, &param, machine->opcodes[i].ZP  ) ) return True;
	if( checkZeroPageX( machine, &param, machine->opcodes[i].ZPX ) ) return True;
	if( checkZeroPageY( machine, &param, machine->opcodes[i].ZPY ) ) return True;
	if( checkAbsoluteX( machine, &param, machine->opcodes[i].ABSX) ) return True;
	if( checkAbsoluteY( machine, &param, machine->opcodes[i].ABSY) ) return True;
	if( checkIndirectX( machine, &param, machine->opcodes[i].INDX) ) return True;
	if( checkIndirectY( machine, &param, machine->opcodes[i].INDY) ) return True;
	if( checkAbsolute(  machine, &param, machine->opcodes[i].ABS ) ) return True;
	if( checkBranch(    machine, &param, machine->opcodes[i].BRA ) ) return True;
      }
    }
    return False; /* unknow upcode */
  }
}


/* indexLabels() - Pushes all labels onto the list */
Bool indexLabels(AsmLine *asmline, machine_6502 *machine){
  int thisPC = machine->regPC;
  /* Figure out how many bytes this instruction takes */
  machine->codeLen = 0;
  if ( ! compileLine(asmline, machine) ){
    return False;
  }
  machine->regPC += machine->codeLen;
  if (! isBlank(asmline->label)) {

    if ( !pushLabel(machine->labelIndex,asmline->label,thisPC) )
      return False;

  }
  return True;
}

/* compileCode() - Compile the current assembly code for the machine */
Bool compileCode(machine_6502 *machine){

  reset(machine);
  machine->codeCompiledOK = True;
  machine->regPC = 0x600;

  /* First pass collect labels and index them */
  tokenize(machine->source, machine->sourceLen, indexLabels, machine);
  {
    int labC = labelCount(machine->labelIndex);
    /*    printf("Found %d label%s\n", labC, (labC > 1)? "s": ""); XXX*/
  }
  /* fprintf(stdout,"Compiling code...\n"); XXX*/

  /* Second pass translate the instructions */
  machine->codeLen = 0;
  tokenize(machine->source, machine->sourceLen, compileLine, machine);
  
  if (machine->codeLen == 0){
    machine->codeCompiledOK = False;
    fprintf(stderr,"No Code to run.\n");
  }

  if (machine->codeCompiledOK )
    machine->memory[0x600+machine->codeLen] = 0x00;
  else
    return False;

  /* printf("Code compiled successfully, %d bytes.\n", machine->codeLen); XXX */
  return True;
}

machine_6502 *build6502(){
  machine_6502 *machine;
  machine = emalloc(sizeof(machine_6502));
  machine->labelIndex = emalloc(sizeof(LabelList));
  machine->labelIndex->head = NULL;
  machine->source = NULL;
  machine->sourceLen = 0;
  assignOpCodes(machine->opcodes);
  reset(machine);
  return machine;
}

void destroy6502(machine_6502 *machine){
  free(machine->labelIndex);
  machine->labelIndex = NULL;
  if(machine->source != NULL){
    free(machine->source);
    machine->source = NULL;
  }
  free(machine);
  machine = NULL;
}


/* TEST CODE */
void dumpLabelList(LabelList *labelList){
  Label *ls = labelList->head;
  printf("ADDR  | NAME\n");
  while(ls != NULL){
    printf("%.5ld | %s\n",ls->addr, ls->name);
    ls = ls->next;
  }
}

void dumpOpcodes(machine_6502 *machine){
  int i = 0;
  while (i < NUM_OPCODES)
    printf("opcode: %s\n", machine->opcodes[i++].name);
}

void printPS(Bool b, ParamStruct *ps){
  printf("Returned %s ", b ? "True" : "False");
  printf("PS: %c, %c, %ld, %s, %d\n",
	 ps->direction,
	 ps->hilo,
	 ps->value,
	 ps->label,
	 ps->type);

}

int main(int argc, char **argv){
  machine_6502 *machine = build6502();
  ParamStruct ps;
  Bool b;

  /*printf("Bit8 = %d, Bit16 = %d, Bit32 = %d\n", sizeof(Bit8), sizeof(Bit16), sizeof(Bit32));*/

  if (argc == 1)
    eprintf("usage: assembler filename");
  else
    machine->source = fileToBuffer(argv[1], &(machine->sourceLen));

  fprintf(stderr,"source length: %d\n%s\n",machine->sourceLen, machine->source); /* XXX: debug */

/*   b = parseParam("#$0AF",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("($0AF,X)",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("#>FOOBAR",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("FOOBAR",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("FOOBAR,Y",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("#123",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("$FF,X",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("$EF",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("123",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("123,Y",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("1EF,Y",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("($4F5),Y",&ps); */
/*   printPS(b,&ps); */
/*   b = parseParam("",&ps); */
/*   printPS(b,&ps); */

/*     dumpOpcodes(machine); */
  compileCode(machine);
  hexDump(machine);
/*   { */
/*     Bool b = pushLabel(machine->labelIndex,"funkyChicken", 0xff); */
/*     assert( b == True); */
/*   } */
/*   pushLabel(machine->labelIndex,"monkey:", 0xfa); */
/*   printf("%d\n", machine->regPC); */
/*   printf("%s\n", machine->opcodes[0].name); */
/*   printf("%s\n", machine->labelIndex->head->name); */
/*   printf("monkey is a label %d\n", findLabel(machine->labelIndex,"monkey")); */
/*   printf("donkey is a label %d\n", findLabel(machine->labelIndex,"donkey")); */
/*   printf("monkey's address %d\n", getLabelPC(machine->labelIndex,"monkey")); */
/*   setLabelPC(machine->labelIndex, "monkey", 0x06); */
/*   printf("monkey's address %d\n", getLabelPC(machine->labelIndex,"monkey")); */
/*   dumpLabelList(machine->labelIndex); */
/*   freeLabels(machine->labelIndex); */
/*   pushLabel(machine->labelIndex, "foobar:", 0xAE); */
/*   pushLabel(machine->labelIndex, "oof:", 0xEE); */
/*   dumpLabelList(machine->labelIndex); */
/*   freeLabels(machine->labelIndex); */
/*   dumpLabelList(machine->labelIndex); */
  destroy6502(machine);
  return 0;
}
