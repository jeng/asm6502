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

      I changed the structure of the assembler in this version.
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
  MAX_LINE_LENGTH = 256, /* Your insane if you have even close to 256 characters in a single line */
  MAX_LABEL_LEN = 80, 
  NUM_OPCODES = 56, /* Number of unique instructions not counting DCB */
  MEM_64K = 77056, /* We have 64k of memory to work with. */
  MAX_PARAM_VALUE = 25, /* The number of values allowed behind dcb */
  MAX_CMD_LEN = 4 /* Each assembly command is 3 characeters long and we a place for the null character */
};

typedef enum  {
  False = 0,
  True = 1
} Bool;

typedef enum{
  BLANK, IMMEDIATE_VALUE, IMMEDIATE_GREAT, 
    IMMEDIATE_LESS, INDIRECT_X, INDIRECT_Y,
    ZERO, ZERO_X, ZERO_Y,
    ABS_VALUE, ABS_OR_BRANCH, ABS_X, ABS_Y,
    ABS_LABEL_X, ABS_LABEL_Y, DCB_PARAM
} ParamType;

typedef Bool (*CharTest) (char);

typedef uint8_t  Bit8;
typedef uint16_t Bit16;
typedef uint32_t Bit32;

typedef struct {
  char name[MAX_CMD_LEN];
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

typedef struct {
  ParamType type;
  Bit32 value[MAX_PARAM_VALUE];
  unsigned int vp; /*value pointer, index into the value table.*/
  char *label;
  Bit32 lbladdr;
} Param;

typedef struct {
  Bit32 addr; /* Address of the label */  
  char *label; 
} Label;  

typedef struct AsmLine AsmLine;
struct AsmLine {
  Bool labelDecl; /* Does the line have a label declaration? */
  Label *label;
  char *command;
  Param *param;
  AsmLine *next; /* in list */
};

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
  int labelPtr;
  Bool codeRunning;
  int myInterval;
  Opcodes opcodes[NUM_OPCODES];
  int screen[32][32];
  int codeLen;
} machine_6502;

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

/* emalloc - Taken from "Practice of Programming" by Kernighan and
   Pike.  If memory allocatiion fails the program will print a message
   an exit. */
void *emalloc(size_t n) {
  void *p;
  
  p = malloc(n);
  if (p == NULL)
    eprintf("malloc of %u bytes failed:", n);
  return p;
}

/* ecalloc - Dose the same thing as emalloc just calls calloc instead. */
void *ecalloc(uint32_t nelm, size_t nsize){
  void *p;
 
  p = calloc(nelm, nsize);
  if (p == NULL)
    eprintf("calloc of %u bytes failed:", nelm * nsize);
  return p;
}

/* estrdup() - Allocates memory for a new string a returns a copy of the source sting in it. */
char *estrdup(const char *source){
  int ln = strlen(source) + 1;
  char *s = ecalloc(ln, sizeof(char));
  strncpy(s,source,ln);
  return s;
}


/* 
 ** Assembly parser
 */

Param *newParam(){
  Param *newp;
  int i = 0;

  newp = (Param *) emalloc(sizeof(Param));
  newp->type = BLANK;
  for (i = 0; i < MAX_PARAM_VALUE; i++)
    newp->value[i] = 0;
  newp->vp = 0;
  newp->label = ecalloc(MAX_LABEL_LEN,sizeof(char));
  newp->lbladdr = 0;
  return newp;
}

/* Copy the fields from p2 to p1 */
void copyParam(Param *p1, Param *p2){
  int i = 0;
  strncpy(p1->label,p2->label,MAX_LABEL_LEN);
  for(i = 0; i < MAX_PARAM_VALUE; i++)
    p1->value[i] = p2->value[i];
  p1->vp = p2->vp;
  p1->type = p2->type;
}

Label *newLabel(){
  Label *newp; 

  newp = (Label *) emalloc(sizeof(Label));
  newp->addr = 0;
  newp->label = ecalloc(MAX_LABEL_LEN,sizeof(char));
  
  return newp;
}

AsmLine *newAsmLine(char *cmd, char *label, Bool decl, Param *param, int lc)
{
    AsmLine *newp;

    newp =  (AsmLine *) emalloc(sizeof(AsmLine));
    newp->labelDecl = decl;
    newp->label = newLabel();
    strncpy(newp->label->label,label,MAX_LABEL_LEN);
    newp->command = estrdup(cmd);
    newp->param = newParam();
    copyParam(newp->param, param);
    newp->next = NULL;
    return newp;
}

AsmLine *addend(AsmLine *listp, AsmLine *newp)
{
    AsmLine *p;
    if(listp == NULL)
      return newp;
    for (p =listp; p->next != NULL; p = p->next)
      ;
    p->next = newp;
    return listp;
}

Bool apply(AsmLine *listp, Bool(*fn)(AsmLine*, void*), void *arg)
{
  AsmLine *p;
  if(listp == NULL)
    return False;
  for (p = listp; p != NULL; p = p->next)
    if (! fn(p,arg) )
      return False;
  return True;
}

void freeParam(Param *param){
  free(param->label);
  free(param);
}

void freeLabel(Label *label){
  free(label->label);
  free(label);
}

void freeallAsmLine(AsmLine *listp)
{
    AsmLine *next;
    for(; listp != NULL; listp = next){
       next = listp->next;
       /* assmes name is freed elsewhere */
       freeParam(listp->param);
       freeLabel(listp->label);
       free(listp->command);
       free(listp);
    }
}

Bool addvalue(Param *param,Bit32 value){
  if (0 <= param->vp && param->vp < MAX_PARAM_VALUE) {
    param->value[param->vp++] = value;
    return True;
  }
  else {
    fprintf(stderr,"Wrong number of parameters: %d. The limit is %d\n",param->vp+1, MAX_PARAM_VALUE);
    return False;
  }
}

void parseError(char *s){
  fprintf(stderr,"6502 Syntax Error: %s\n", s);
}

/* stoupper() - Destructivley modifies the string making all letters upper case*/
void stoupper(char **s){
  int i = 0;
  while((*s)[i] != '\0'){
    (*s)[i] = toupper((*s)[i]);
    i++;
  }
}
 
Bool isWhite(char c){
  return (c == '\r' || c == '\t' || c == ' ');
}

void skipSpace(char **s){
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

Bool isCommand(machine_6502 *machine, const char *token){
  int i = 0;

  while (i < NUM_OPCODES) {
    if (strcmp(machine->opcodes[i].name,token) == 0) 
      return True;
    i++;
  }
  
  if (strcmp(token, "DCB") == 0) return True;
  return False;
}

/* hasChar() - Check to see if the current line has a certain
   charater */
Bool hasChar(char *s, char c){
  for(; *s != '\0' && *s != '\n'; s++) {
    if (*s  == c)
      return True;
  }
  return False;
}

Bool ishexdigit(char c){
  if (isdigit(c))
    return True;
  else {
    char c1 = toupper(c);
    return ('A' <= c1 && c1 <= 'F');
  }
}

/* command() - parse a command from the source code. We pass along a
   machine so the opcode can be validated. */
Bool command(machine_6502 *machine, char **s, char **cmd){
  int i = 0;
  skipSpace(s);
  for(;isalpha(**s) && i < MAX_CMD_LEN; (*s)++)
    (*cmd)[i++] = **s;
  if (i == 0)
    return True; /* Could be a blank line. */
  else
    return isCommand(machine,*cmd);
}

Bool declareLabel(char **s, char **label){
  int i = 0;
  skipSpace(s);
  for(;**s != ':' && **s != '\n' && **s != '\0'; (*s)++){
    if (isWhite(**s)) 
      continue;
    (*label)[i++] = **s;
  }
  if (i == 0)
    return False; /* Current line has to have a label */
  else if (**s == ':'){
    (*s)++; /* Skip colon */
    return True;
  }
  else
    return False;
}

Bool parseHex(char **s, Bit32 *value){
  enum { MAX_HEX_LEN = 5 };
  if (**s == '$') {    
    char *hex = ecalloc(MAX_HEX_LEN, sizeof(char));
    int i = 0;

    (*s)++; /* move pass $ */
    for(; ishexdigit(**s) && i < MAX_HEX_LEN; (*s)++)
      hex[i++] = **s;
    
    *value = strtol(hex,NULL,16);
    free(hex);  
    return True;
  }
  else
    return False;
}
  
Bool parseDec(char **s, Bit32 *value){
  enum { MAX_DEC_LEN = 4 };
  char *dec = ecalloc(MAX_DEC_LEN, sizeof(char));
  int i;
  for(i = 0; isdigit(**s) && i < MAX_DEC_LEN; (*s)++)
    dec[i++] = **s;
  
  if (i > 0){
    *value = atoi(dec);
    free(dec);  
    return True;
  }
  else
    return False;
}

Bool parseValue(char **s, Bit32 *value){
  if (**s == '$')
    return parseHex(s, value);
  else
    return parseDec(s, value);
}

Bool paramLabel(char **s, char **label){
  int i;
  for(i = 0; isalnum(**s) && i < MAX_LABEL_LEN; (*s)++)
    (*label)[i++] = **s;

  if (i > 0)
    return True;
  else
    return False;
}

Bool immediate(char **s, Param *param){
  if (**s != '#') 
    return False;

  (*s)++; /*Move past hash */
  if (**s == '<' || **s == '>'){    
    char *label = ecalloc(MAX_LABEL_LEN, sizeof(char));
    param->type = (**s == '<') ? IMMEDIATE_LESS : IMMEDIATE_GREAT;
    (*s)++; /* move past < or > */
    if (paramLabel(s, &label)){
      int ln = strlen(label) + 1;
      strncpy(param->label, label, ln);
      free(label);
      return True;
    }    
    free(label);
  }
  else {
    Bit32 value;
    if (parseValue(s, &value)){
      if (value > 0xFF){
	parseError("Immediate value is too large.");
	return False;
      }
      param->type = IMMEDIATE_VALUE;
      return addvalue(param, value);
    }
  }
  return False;
}

Bool isDirection(char c){
  return (c == 'X' || c == 'Y');
}

Bool getDirection(char **s, char *direction){
  skipSpace(s);
  if (**s == ','){
    (*s)++;
    skipSpace(s);
    if (isDirection(**s)){
      *direction = **s;
      (*s)++;
      return True;
    }
  }
  return False;
}
  
Bool indirect(char **s, Param *param){
  Bit32 value;
  char c;
  if (**s == '(') 
    (*s)++;
  else
    return False;
  
  if (! parseHex(s,&value)) 
    return False;
  if (value > 0xFF) {
    parseError("Indirect value is too large.");
    return False;
  }
  if (!addvalue(param, value))
    return False;
  skipSpace(s);
  if (**s == ')'){
    (*s)++;
    if (getDirection(s,&c)) {
      if (c == 'Y'){
	param->type = INDIRECT_Y;
	return True;
      }
    }
  }
  else if (getDirection(s, &c)){
    if (c == 'X'){
      skipSpace(s);
      if (**s == ')'){
	(*s)++;
	param->type = INDIRECT_X;
	return True;
      }
    }
  }
  return False;
}

Bool dcbValue(char **s, Param *param){
  Bit32 val;
  if (! parseValue(s,&val))
    return False;

  if (val > 0xFF) 
    return False;
		    
  if (!addvalue(param,val))
    return False;

  param->type = DCB_PARAM;

  skipSpace(s);
  if(**s == ','){
    (*s)++;
    return dcbValue(s, param);
  }
  else
    return True;
} 

Bool value(char **s, Param *param){
  Bit32 val;
  Bool abs;
  Bool dir;
  char c = '\0';
  if (! parseValue(s,&val))
    return False;

  abs = (val > 0xFF);
  dir = getDirection(s,&c);
  if (!addvalue(param,val))
    return False;

  if(abs && dir){
    if (c == 'X')
      param->type = ABS_X;
    else if (c == 'Y')
      param->type = ABS_Y;
    else
      return False;
  }
  else if (abs)
    param->type = ABS_VALUE;
  else if (dir){
    if (c == 'X')
      param->type = ZERO_X;
    else if (c == 'Y')
      param->type = ZERO_Y;
    else
      return False;
  }
  else
    param->type = ZERO;

  return True;
}

Bool label(char **s, Param *param){
  char *label = ecalloc(MAX_LABEL_LEN, sizeof(char));
  char c;
  Bool labelOk = False;
  if (paramLabel(s, &label)){
    labelOk = True;
    param->type = ABS_OR_BRANCH;
    if (getDirection(s, &c)){
      if (c == 'X')
	param->type = ABS_LABEL_X;
      else if (c == 'Y')
	param->type = ABS_LABEL_Y;
      else
	labelOk = False;
    }
    strncpy(param->label,label,MAX_LABEL_LEN);
  }
  free(label);
  return labelOk;
}

Bool parameter(const char *cmd, char **s, Param *param){
  skipSpace(s);
  if (**s == '\0' || **s == '\n')
    return True;
  else if (**s == '#')
    return immediate(s,param);
  else if (**s == '(')
    return indirect(s,param);
  else if (**s == '$' || isdigit(**s)){
    if (strcmp(cmd, "DCB") == 0)
      return dcbValue(s,param);
    else
      return value(s,param);
  }
  else if (isalpha(**s))
    return label(s ,param);
  else
    return False; /* Invalid Parameter */
}

void comment(char **s){
  skipSpace(s);
  if (**s == ';')
    for(;**s != '\n' && **s != '\0'; (*s)++)
      ;
}

void initParam(Param *param){
  int i;
  param->type = BLANK;
  for(i = 0; i < MAX_PARAM_VALUE; i++)
    param->value[i] = 0;
  param->vp = 0;
  nullify(param->label,MAX_LABEL_LEN);
}
  

AsmLine *parseAssembly(machine_6502 *machine, Bool *codeOk, const char *code){
  char *s;
  char *cmd = ecalloc(MAX_CMD_LEN, sizeof(char));
  char *label = ecalloc(MAX_LABEL_LEN, sizeof(char));
  char *start; /*pointer to the start of the code.*/
  unsigned int lc = 1;
  Param *param;
  Bool decl;
  AsmLine *listp = NULL;

  *codeOk = True;
  param = newParam();
  s = estrdup(code);
  start = s;
  stoupper(&s);

  while(*s != '\0' && *codeOk){
    initParam(param);
    nullify(cmd, MAX_CMD_LEN);
    nullify(label, MAX_LABEL_LEN);
    decl = False;
    skipSpace(&s);
    comment(&s);
    if (*s == '\n'){
      lc++;
      s++;
      continue; /* blank line */
    }
    else if (*s == '\0')
      continue; /* no newline at the end of the code */
    else if (hasChar(s,':')){
      decl = True;
      if(! declareLabel(&s,&label)){
	*codeOk = False;
	break;
      }
      skipSpace(&s);
    }
    if(!command(machine, &s, &cmd)){
      *codeOk = False;
      break;
    }
    skipSpace(&s);
    comment(&s);
    if(!parameter(cmd, &s, param)){
      *codeOk = False;
      break;
    }
    skipSpace(&s);
    comment(&s);
    if (*s == '\n' || *s == '\0'){
      AsmLine *asm;
      asm = newAsmLine(cmd,label,decl,param,lc);
      listp = addend(listp,asm);
    }
    else {
      *codeOk = False;
      break;
    }
  }
  if (! *codeOk)
    fprintf(stderr,"Syntax error at line %u\n", lc);
  free(start);
  free(cmd);
  free(label);
  freeParam(param);
  return listp;
}
    
/* fileToBuffer() - Allocates a buffer and loads all of the file into memory. */
char *fileToBuffer(char *filename){
  const int defaultSize = 1024;
  FILE *ifp;
  int c;
  int size = defaultSize;
  int i = 0;
  char *buffer = ecalloc(defaultSize,sizeof(char));

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
  buffer = realloc(buffer, i+2);
  if (buffer == NULL) 
    eprintf("Could not resize buffer.");
  /* Make sure we have a line feed at the end */
  buffer[i] = '\n';
  buffer[i+1] = '\0';
  return buffer;
}


/**
 ** Machine code
 */

/* reset() - Reset CPU and memory. */
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
}

void updateDisplayPixel( int addr ){
}

void checkAddress(Bit32 address){
  /* XXX: Do we want to kill the program here? */
  if (address >= MEM_64K)
    eprintf("Address %d is beyond 64k", address);
}

/*
 *  stackPush() - Push byte to stack
 *
 */

void stackPush(machine_6502 *machine, Bit8 value ) {
    machine->regSP--;
    machine->memory[machine->regSP + 0x100] = value;
}


/*
 *  stackPop() - Pop byte from stack
 *
 */

Bit8 stackPop(machine_6502 *machine) {
  Bit8 value =machine->memory[machine->regSP+0x100];
  machine->regSP++;
  return value;
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

Bool translate(Opcodes *op,Param *param, machine_6502 *machine){
   switch(param->type){
    case BLANK:
      pushByte(machine, op->SNGL);
      break;
    case IMMEDIATE_VALUE:
      pushByte(machine, op->Imm);
      pushByte(machine, param->value[0]);
      break;
    case IMMEDIATE_GREAT:
      pushByte(machine, op->Imm);
      pushByte(machine, param->lbladdr / 0xFF);
      break;
    case IMMEDIATE_LESS:
      pushByte(machine, op->Imm);
      pushByte(machine, param->lbladdr & 0xFF);
      break;
    case INDIRECT_X:
      pushByte(machine, op->INDX);
      pushByte(machine, param->value[0]);
      break;
    case INDIRECT_Y:
      pushByte(machine, op->INDY);
      pushByte(machine, param->value[0]);
      break;
    case ZERO:
      pushByte(machine, op->ZP);
      pushByte(machine, param->value[0]);
      break;
    case ZERO_X:
      pushByte(machine, op->ZPX);
      pushByte(machine, param->value[0]);
      break;
    case ZERO_Y:
      pushByte(machine, op->ZPY);
      pushByte(machine, param->value[0]);
      break;
    case ABS_VALUE:
      pushByte(machine, op->ABS);
      pushWord(machine, param->value[0]);
      break;
    case ABS_OR_BRANCH:
      if (op->ABS > 0){
	pushByte(machine, op->ABS);
	pushWord(machine, param->lbladdr);
      }
      else {
	pushByte(machine, op->BRA);
	if (param->lbladdr < (machine->codeLen + 0x600))  /*backwards?*/
	  pushByte(machine,
		   (0xff - (machine->codeLen-param->lbladdr)) & 0xff);
	else
	  pushByte(machine,
		   (param->lbladdr - machine->codeLen-1) & 0xff);
      }
      break;
    case ABS_X:
      pushByte(machine, op->ABSX);
      pushWord(machine, param->value[0]);
      break;
    case ABS_Y:
      pushByte(machine, op->ABSY);
      pushWord(machine, param->value[0]);
      break;
    case ABS_LABEL_X:
      pushByte(machine, op->ABSX);
      pushWord(machine, param->lbladdr);
      break;
    case ABS_LABEL_Y:
      pushByte(machine, op->ABSY);
      pushWord(machine, param->lbladdr);
      break;
   case DCB_PARAM:
     /* Handled elsewhere */
     break;
   }
   return True;
}

/* compileLine() - Compile one line of code. Returns
   True if it compile successfully. */
Bool compileLine(AsmLine *asmline, void *args){
  machine_6502 *machine;
  machine = args;
  if (isBlank(asmline->command)) return True;

  if (strcmp("DCB",asmline->command) == 0){
    int i;
    for(i = 0; i < asmline->param->vp; i++)
      pushByte(machine, asmline->param->value[i]);
  }    
  else{
    int i;
    char *command = asmline->command;
    Opcodes op;
    for(i = 0; i < NUM_OPCODES; i++){
      if (strcmp(machine->opcodes[i].name, command) == 0){
	op = machine->opcodes[i];
	break;      
      }
    }
    if (i == NUM_OPCODES)
      return False; /* unknow upcode */
    else
      return translate(&op,asmline->param,machine);
  }
  return True;
}

/* indexLabels() - Get the address for each label */
Bool indexLabels(AsmLine *asmline, void *arg){
  machine_6502 *machine; 
  int thisPC;
  machine = arg;
  thisPC = machine->regPC;
  /* Figure out how many bytes this instruction takes */
  machine->codeLen = 0;
  if ( ! compileLine(asmline, machine) ){
    return False;
  }
  machine->regPC += machine->codeLen;
  if (asmline->labelDecl) {
    asmline->label->addr = thisPC;
  }
   return True; 
}

Bool changeParamLabelAddr(AsmLine *asmline, void *label){
  Label *la = label;
  if (strcmp(asmline->param->label, la->label) == 0)
    asmline->param->lbladdr = la->addr;
  return True;
}

Bool linkit(AsmLine *asmline, void *asmlist){
  apply(asmlist,changeParamLabelAddr,asmline->label);
  return True;
}

/* linkLabels - Make sure all of the references to the labels contain
   the right address*/
void linkLabels(AsmLine *asmlist){
  apply(asmlist,linkit,asmlist);
}

/* XXX: debug */
Bool printAsmLine(AsmLine *asm,void *machine){
 char *fmt = "labelDecl: %d\n" \
   "label->addr: %d\n" \
   "label->label: %s\n" \
   "command: %s\n" \
   "param->type: ";

 char *fmt2 =  "\nparam->vp: %d\n" \
   "param->label: %s\n" \
   "param->addr: %d\n" \
   "*next: %x\n\n\n";

 int i;
 fprintf(stderr,fmt,
	 asm->labelDecl,asm->label->addr,
	 asm->label->label, asm->command);	 

 switch(asm->param->type){
 case BLANK: fprintf(stderr,"BLANK\n"); break;
 case IMMEDIATE_VALUE: fprintf(stderr,"IMMEDIATE_VALUE\n"); break;
 case IMMEDIATE_GREAT: fprintf(stderr,"IMMEDIATE_GREAT\n"); break;
 case IMMEDIATE_LESS: fprintf(stderr,"IMMEDIATE_LESS\n"); break;
 case INDIRECT_X: fprintf(stderr,"INDIRECT_X\n"); break;
 case INDIRECT_Y: fprintf(stderr,"INDIRECT_Y\n"); break;
 case ZERO: fprintf(stderr,"ZERO\n"); break;
 case ZERO_X: fprintf(stderr,"ZERO_X\n"); break;
 case ZERO_Y: fprintf(stderr,"ZERO_Y\n"); break;
 case ABS_VALUE: fprintf(stderr,"ABS_VALUE\n"); break;
 case ABS_OR_BRANCH: fprintf(stderr,"ABS_OR_BRANCH\n"); break;
 case ABS_X: fprintf(stderr,"ABS_X\n"); break;
 case ABS_Y: fprintf(stderr,"ABS_Y\n"); break;
 case ABS_LABEL_X: fprintf(stderr,"ABS_LABEL_X\n"); break;
 case ABS_LABEL_Y: fprintf(stderr,"ABS_LABEL_Y\n"); break;
 case DCB_PARAM: fprintf(stderr,"DCB_PARAM\n"); break;
 }

 for(i = 0; i < MAX_PARAM_VALUE; i++)
   fprintf(stderr, "%s%lx,",(i==0)?"param->value: ":" ",asm->param->value[i]);
 
 fprintf(stderr,fmt2,
	 asm->param->vp, asm->param->label,
	 asm->param->lbladdr,
	 asm->next);
 return True;
}

/* compileCode() - Compile the current assembly code for the machine */
Bool compileCode(machine_6502 *machine, const char *code){
  Bool codeOk;
  AsmLine *asmlist;

  reset(machine);
  machine->regPC = 0x600;
  asmlist = parseAssembly(machine, &codeOk, code);

  if(codeOk){
    /* First pass: Find the addresses for the labels */
    apply(asmlist, indexLabels, machine);
    /* update label references */
    linkLabels(asmlist);
    /*    apply(asmlist, printAsmLine, machine);*//*XXX: Debug*/
    /* Second pass: translate the instructions */
    machine->codeLen = 0;
    apply(asmlist, compileLine, machine);

    if (machine->codeLen > 0 ){
      /*      printf("Code compiled successfully, %d bytes.\n", machine->codeLen); XXX*/
      machine->memory[0x600+machine->codeLen] = 0x00;
      codeOk = True;
    }
    else{
      fprintf(stderr,"No Code to run.\n");
      codeOk = False;
    }
  }
  else{
    fprintf(stderr,"An error occured while parsing the file.\n");  
    codeOk = False;
  }
  freeallAsmLine(asmlist);
  return codeOk;
}


/* Emulator */

void jumpBranch(machine_6502 *machine, Bit16 offset ) {
/*
  if( offset >= 0x80 ) {
    regPC -= 0x100-offset;
  } else {
    regPC += offset;
  }
*/
  if( offset > 0x7f )
    machine->regPC = (machine->regPC - (0x100 - offset));
  else
    machine->regPC = (machine->regPC + offset );
}

Bit16 doINDX(machine_6502 *machine) {
  Bit16 value = machine->memory[machine->regPC++]+machine->regX;
  return (machine->memory[value] + (machine->memory[value+1]<<8));
}

Bit8 doZP(machine_6502 *machine) {
  return machine->memory[machine->regPC++];
}

void doCompare(machine_6502 *machine, Bit8 reg, Bit8 val ) {
  if( (reg+val) > 0xff ) machine->regP |= 1; else machine->regP &= 0xfe;
  val = (reg-val);
//  if( machine->reg+0x100-val > 0xff ) machine->regP |= 1; else machine->regP &= 0xfe;
//  val = machine->reg+0x100-val;
  if( val ) machine->regP &= 0xfd; else machine->regP |= 0x02;
  if( val & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
}

void testSBC(machine_6502 *machine, Bit8 value ) {
  Bit8 vflag, w, tmp;

  if( (machine->regA ^ value ) & 0x80 )
    vflag = 1;
  else
    vflag = 0;

  if( machine->regP & 8 ) {
    tmp = 0xf + (machine->regA & 0xf) - (value & 0xf) + (machine->regP&1);
    if( tmp < 0x10 ) {
      w = 0;
      tmp -= 6;
    } else {
      w = 0x10;
      tmp -= 0x10;
    }
    w += 0xf0 + (machine->regA & 0xf0) - (value & 0xf0);
    if( w < 0x100 ) {
      machine->regP &= 0xfe;
      if( (machine->regP&0xbf) && w<0x80) machine->regP&=0xbf;
      w -= 0x60;
    } else {
      machine->regP |= 1;
      if( (machine->regP&0xbf) && w>=0x180) machine->regP&=0xbf;
    }
    w += tmp;
  } else {
    w = 0xff + machine->regA - value + (machine->regP&1);
    if( w<0x100 ) {
      machine->regP &= 0xfe;
      if( (machine->regP&0xbf) && w<0x80 ) machine->regP&=0xbf;
    } else {
      machine->regP |= 1;
      if( (machine->regP&0xbf) && w>= 0x180) machine->regP&=0xbf;
    }
  }
  machine->regA = w;
  if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
  if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
}

void testADC(machine_6502 *machine, Bit8 value ) {
  Bit8 tmp;

  if( (machine->regA ^ value) & 0x80 ) {
    machine->regP &= 0xbf;
  } else {
    machine->regP |= 0x40;
  }

  if( machine->regP & 8 ) {
    tmp = (machine->regA & 0xf) + (value & 0xf) + (machine->regP&1);
    if( tmp >= 10 ) {
      tmp = 0x10 | ((tmp+6)&0xf);
    }
    tmp += (machine->regA & 0xf0) + (value & 0xf0);
    if( tmp >= 160) {
      machine->regP |= 1;
      if( (machine->regP&0xbf) && tmp >= 0x180 ) machine->regP &= 0xbf;
      tmp += 0x60;
    } else {
      machine->regP &= 0xfe;
      if( (machine->regP&0xbf) && tmp<0x80 ) machine->regP &= 0xbf;
    }
  } else {
    tmp = machine->regA + value + (machine->regP&1);
    if( tmp >= 0x100 ) {
      machine->regP |= 1;
      if( (machine->regP&0xbf) && tmp>=0x180) machine->regP &= 0xbf;
    } else {
      machine->regP &= 0xfe;
      if( (machine->regP&0xbf) && tmp<0x80) machine->regP &= 0xbf;
    }
  }
  machine->regA = tmp;
  if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
  if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
}

/*
 *  execute() - Executes one instruction.
 *              This is the main part of the CPU emulator.
 *
 */

void execute(machine_6502 *machine) {
  if( ! machine->codeRunning ) return;

  Bit8 opcode = popByte(machine);
  Bit8 value; Bit16 word;
  /*  message( "PC=" + addr2hex(regPC-1) + " opcode=" + opcode + " X="+regX + " Y=" + regY + " A=" + regA ); */
  switch( opcode ) {
  case 0x00:                            /* BRK implied */
      machine->codeRunning = False;
      break;
  case 0x01:                            /* ORA INDX */
      machine->regA |= doINDX();
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x05:                            /* ORA ZP */
      machine->regA |= doZP();
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x06:                            /* ASL ZP */
      zp = popByte(machine);
      value = memReadByte(machine, zp );
      machine->regP = (machine->regP & 0xfe) | ((value>>7)&1);
      value = value << 1;
      memStoreByte(machine, zp, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x08:                            /* PHP */
      stackPush( machine->regP );
      break;
  case 0x09:                            /* ORA IMM */
      machine->regA |= popByte(machine);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x0a:                            /* ASL IMPL */
      machine->regP = (machine->regP & 0xfe) | ((machine->regA>>7)&1);
      machine->regA = machine->regA<<1;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x0d:                            /* ORA ABS */
      machine->regA |= memReadByte(machine, popWord(machine) );
      break;
  case 0x0e:                            /* ASL ABS */
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP & 0xfe) | ((value>>7)&1);
      value = value << 1;
      memStoreByte(machine, addr, value );
      break;
  case 0x10:                            /* BPL */
      offset = popByte(machine);
      if( (machine->regP & 0x80) == 0 ) jumpBranch( offset );
      break;
  case 0x11:                            /* ORA INDY */
      zp = popByte(machine);
      value = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regY;
      machine->regA |= memReadByte(machine,value);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x15:                            /* ORA ZPX */
      addr = (popByte(machine) + machine->regX) & 0xff;
      machine->regA |= memReadByte(machine,addr);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x16:                            /* ASL ZPX */
      addr = (popByte(machine) + machine->regX) & 0xff;
      value = memReadByte(machine,addr);
      machine->regP = (machine->regP & 0xfe) | ((value>>7)&1);
      value = value << 1;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x18:                            /* CLC */
      machine->regP &= 0xfe;
      break;
  case 0x19:                            /* ORA ABSY */
      addr = popWord(machine) + machine->regY;
      machine->regA |= memReadByte(machine, addr );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x1d:                            /* ORA ABSX */
      addr = popWord(machine) + machine->regX;
      machine->regA |= memReadByte(machine, addr );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x1e:                            /* ASL ABSX */
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP & 0xfe) | ((value>>7)&1);
      value = value << 1;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x20:                            /* JSR ABS */
      addr = popWord(machine);
      currAddr = machine->regPC-1;
      stackPush( ((currAddr >> 8) & 0xff) );
      stackPush( (currAddr & 0xff) );
      machine->regPC = addr;
      break;
  case 0x21:                            /* AND INDX */
      addr = popByte(machine) + machine->regX;
      value = memReadByte(machine, addr ) + (memReadByte(machine, addr+1) << 8);
      machine->regA &= value;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x24:                            /* BIT ZP */
      zp = popByte(machine);
      value = memReadByte(machine, zp );
      if( value & machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      machine->regP = (machine->regP & 0x3f) | (value & 0xc0);
      break;
  case 0x25:                            /* AND ZP */
      zp = popByte(machine);
      value = memReadByte(machine, zp ) & machine->regA;
      memStoreByte(machine, zp, value );
      break;
  case 0x26:                            /* ROL ZP */
      sf = (machine->regP & 1);
      addr = popByte(machine);
      value = memReadByte(machine, addr ) & machine->regA;
      machine->regP = (machine->regP & 0xfe) | ((value>>7)&1);
      value = value << 1;
      value |= sf;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x28:                            /* PLP */
      machine->regP = stackPop() | 0x20;
      break;
  case 0x29:                            /* AND IMM */
      machine->regA &= popByte(machine);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x2a:                            /* ROL A */
      sf = (machine->regP&1);
      machine->regP = (machine->regP&0xfe) | ((machine->regA>>7)&1);
      machine->regA = machine->regA << 1;
      machine->regA |= sf;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x2c:                            /* BIT ABS */
      value = memReadByte(machine, popWord(machine) );
      if( value & machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      machine->regP = (machine->regP & 0x3f) | (value & 0xc0);
      break;
  case 0x2d:                            /* AND ABS */
      value = memReadByte(machine, popWord(machine) );
      machine->regA &= value;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x2e:                            /* ROL ABS */
      sf = machine->regP & 1;
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP & 0xfe) | ((value>>7)&1);
      value = value << 1;
      value |= sf;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x30:                            /* BMI */
      offset = popByte(machine);
      if( machine->regP & 0x80 ) jumpBranch( offset );
      break;
  case 0x31:                            /* AND INDY */
      zp = popByte(machine);
      value = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regY;
      machine->regA &= memReadByte(machine,value);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x35:                            /* AND INDX */
      zp = popByte(machine);
      value = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regX;
      machine->regA &= memReadByte(machine,value);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x36:                            /* ROL ZPX */
      sf = machine->regP & 1;
      addr = (popByte(machine) + machine->regX) & 0xff;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP & 0xfe) | ((value>>7)&1);
      value = value << 1;
      value |= sf;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x38:                            /* SEC */
      machine->regP |= 1;
      break;
  case 0x39:                            /* AND ABSY */
      addr = popWord(machine) + machine->regY;
      value = memReadByte(machine, addr );
      machine->regA &= value;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x3d:                            /* AND ABSX */
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      machine->regA &= value;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x3e:                            /* ROL ABSX */
      sf = machine->regP&1;
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP & 0xfe) | ((value>>7)&1);
      value = value << 1;
      value |= sf;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x40:                            /* RTI (unsupported, =NOP) */
      break;
  case 0x41:                            /* EOR INDX */
      zp = popByte(machine);
      value = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regX;
      machine->regA ^= memReadByte(machine,value);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x45:                            /* EOR ZPX */
      addr = (popByte(machine) + machine->regX) & 0xff;
      value = memReadByte(machine, addr );
      machine->regA ^= value;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x46:                            /* LSR ZPX */
      addr = (popByte(machine) + machine->regX) & 0xff;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP & 0xfe) | (value&1);
      value = value >> 1;
      memStoreByte(machine, addr, value );
      if( value != 0 ) machine->regP &= 0xfd; else machine->regP |= 2;
      if( (value&0x80) == 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x48:                            /* PHA */
      stackPush( machine->regA );
      break;
  case 0x49:                            /* EOR IMM */
      machine->regA ^= popByte(machine);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x4a:                            /* LSR */
      machine->regP = (machine->regP&0xfe) | (machine->regA&1);
      machine->regA = machine->regA >> 1;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x4c:                            /* JMP abs */
      machine->regPC = popWord(machine);
      break;
  case 0x4d:                            /* EOR abs */
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      machine->regA ^= value;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x4e:                           /* LSR abs */
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe)|(value&1);
      value = value >> 1;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x50:                           /* BVC (on overflow clear) */
      offset = popByte(machine);
      if( (machine->regP & 0x40) == 0 ) jumpBranch( offset );
      break;
  case 0x51:                           /* EOR INDY */
      zp = popByte(machine);
      value = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regY;
      machine->regA ^= memReadByte(machine,value);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x55:                           /* EOR ZPX */
      addr = (popByte(machine) + machine->regX) & 0xff;
      machine->regA ^= memReadByte(machine, addr );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x56:                           /* LSR ZPX */
      addr = (popByte(machine) + machine->regX) & 0xff;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe) | (value&1);
      value = value >> 1;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x58:                           /* CLI (does nothing) */
      break;
  case 0x59:                           /* EOR ABSY */
      addr = popWord(machine) + machine->regY;
      value = memReadByte(machine, addr );
      machine->regA ^= value;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x5d:                           /* EOR ABSX */
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      machine->regA ^= value;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x5e:                           /* LSR ABSX */
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe) | (value&1);
      value = value >> 1;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x60:                           /* RTS */
      machine->regPC = (stackPop()+1) | (stackPop()<<8);
      break;
  case 0x61:                           /* ADC INDX */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regX;
      value = memReadByte(machine, addr );
      testADC( value );
      break;
  case 0x65:                           /* ADC ZP */
      addr = popByte(machine);
      value = memReadByte(machine, addr );
      testADC( value );
      break;
  case 0x66:                           /* ROR ZP */
      sf = machine->regP&1;
      addr = popByte(machine);
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe)|(value&1);
      value = value >> 1;
      if( sf ) value |= 0x80;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x68:                           /* PLA */
      machine->regA = stackPop();
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x69:                           /* ADC IMM */
      value = popByte(machine);
      testADC( value );
      break;
  case 0x6a:                           /* ROR A */
      sf = machine->regP&1;
      machine->regP = (machine->regP&0xfe) | (machine->regA&1);
      machine->regA = machine->regA >> 1;
      if( sf ) machine->regA |= 0x80;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
      /*    case 0x6c: // JMP INDIR */
      /*      break; */
  case 0x6d:                           /* ADC ABS */
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      testADC( value );
      break;
  case 0x6e:                           /* ROR ABS */
      sf = machine->regP&1;
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe)|(value&1);
      value = value >> 1;
      if( sf ) value |= 0x80;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x70:                           /* BVS (branch on overflow set) */
      offset = popByte(machine);
      if( machine->regP & 0x40 ) jumpBranch( offset );
      break;
  case 0x71:                           /* ADC INY */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8);
      value = memReadByte(machine, addr + machine->regY );
      testADC( value );
      break;
  case 0x75:                           /* ADC ZPX */
      addr = (popByte(machine) + machine->regX) & 0xff;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe) | (value&1);
      testADC( value );
      break;
  case 0x76:                           /* ROR ZPX */
      sf = (machine->regP&1);
      addr = (popByte(machine) + machine->regX) & 0xff;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe) | (value&1);
      value = value >> 1;
      if( sf ) value |= 0x80;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x78:                           /* SEI (does nothing) */
      break;
  case 0x79:                           /* ADC ABSY */
      addr = popWord(machine);
      value = memReadByte(machine, addr + machine->regY );
      testADC( value );
      break;
  case 0x7d:                           /* ADC ABSX */
      addr = popWord(machine);
      value = memReadByte(machine, addr + machine->regX );
      testADC( value );
      break;
  case 0x7e:                           /* ROR ABSX */
      sf = machine->regP&1;
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe) | (value&1);
      value = value >> 1;
      if( value ) value |= 0x80;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x81:                           /* STA INDX */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regX;
      memStoreByte(machine, addr, machine->regA );
      break;
  case 0x84:                           /* STY ZP */
      memStoreByte(machine, popByte(machine), machine->regY );
      break;
  case 0x85:                           /* STA ZP */
      memStoreByte(machine, popByte(machine), machine->regA );
      break;
  case 0x86:                           /* STX ZP */
      memStoreByte(machine, popByte(machine), machine->regX );
      break;
  case 0x88:                           /* DEY (1 byte) */
      machine->regY = (machine->regY-1) & 0xff;
      if( machine->regY ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regY & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x8a:                           /* TXA (1 byte); */
      machine->regA = machine->regX;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x8c:                           /* STY abs */
      memStoreByte(machine, popWord(machine), machine->regY );
      break;
  case 0x8d:                           /* STA ABS (3 bytes) */
      memStoreByte(machine, popWord(machine), machine->regA );
      break;
  case 0x8e:                           /* STX abs */
      memStoreByte(machine, popWord(machine), machine->regX );
      break;
  case 0x90:                           /* BCC (branch on carry clear) */
      offset = popByte(machine);
      if( ( machine->regP & 1 ) == 0 ) jumpBranch( offset );
      break;
  case 0x91:                           /* STA INDY */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regY;
      memStoreByte(machine, addr, machine->regA );
      break;
  case 0x94:                           /* STY ZPX */
      memStoreByte(machine, popByte(machine) + machine->regX, machine->regY );
      break;
  case 0x95:                           /* STA ZPX */
      memStoreByte(machine, popByte(machine) + machine->regX, machine->regA );
      break;
  case 0x96:                           /* STX ZPY */
      memStoreByte(machine, popByte(machine) + machine->regY, machine->regX );
      break;
  case 0x98:                           /* TYA */
      machine->regA = machine->regY;
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0x99:                           /* STA ABSY */
      memStoreByte(machine, popWord(machine) + machine->regY, machine->regA );
      break;
  case 0x9a:                           /* TXS */
      machine->regSP = machine->regX;
      break;
  case 0x9d:                           /* STA ABSX */
      addr = popWord(machine);
      memStoreByte(machine, addr + machine->regX, machine->regA );
      break;
  case 0xa0:                           /* LDY IMM */
      machine->regY = popByte(machine);
      if( machine->regY ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regY & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xa1:                           /* LDA INDX */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8);
      machine->regA = memReadByte(machine, addr + machine->regX );
      /*message( "LDA INDX " + (addr+machine->regX) + " = " + machine->regA ); */
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xa2:                           /* LDX IMM */
      machine->regX = popByte(machine);
      if( machine->regX ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regX & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xa4:                           /* LDY ZP */
      machine->regY = memReadByte(machine, popByte(machine) );
      if( machine->regY ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regY & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xa5:                           /* LDA ZP */
      machine->regA = memReadByte(machine, popByte(machine) );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xa6:                          /* LDX ZP */
      machine->regX = memReadByte(machine, popByte(machine) );
      if( machine->regX ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regX & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xa8:                          /* TAY */
      machine->regY = machine->regA;
      if( machine->regY ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regY & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xa9:                          /* LDA IMM */
      machine->regA = popByte(machine);
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xaa:                          /* TAX */
      machine->regX = machine->regA;
      if( machine->regX ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regX & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xac:                          /* LDY ABS */
      machine->regY = memReadByte(machine, popWord(machine) );
      if( machine->regY ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regY & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xad:                          /* LDA ABS */
      machine->regA = memReadByte(machine, popWord(machine) );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xae:                          /* LDX ABS */
      machine->regX = memReadByte(machine, popWord(machine) );
      if( machine->regX ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regX & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xb0:                          /* BCS */
      offset = popByte(machine);
      if( machine->regP & 1 ) jumpBranch( offset );
      break;
  case 0xb1:                          /* LDA INDY */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regY;
      machine->regA = memReadByte(machine, addr );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xb4:                          /* LDY ZPX */
      machine->regY = memReadByte(machine, popByte(machine) + machine->regX );
      if( machine->regY ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regY & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xb5:                          /* LDA ZPX */
      machine->regA = memReadByte(machine, (popByte(machine) + machine->regX) & 0xff );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xb6:                          /* LDX ZPY */
      machine->regX = memReadByte(machine, popByte(machine) + machine->regY );
      if( machine->regX ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regX & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xb8:                          /* CLV */
      machine->regP &= 0xbf;
      break;
  case 0xb9:                          /* LDA ABSY */
      addr = popWord(machine) + machine->regY;
      machine->regA = memReadByte(machine, addr );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xba:                          /* TSX */
      machine->regX = machine->regSP;
      break;
  case 0xbc:                          /* LDY ABSX */
      addr = popWord(machine) + machine->regX;
      machine->regY = memReadByte(machine, addr );
      if( machine->regY ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regY & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xbd:                          /* LDA ABSX */
      addr = popWord(machine) + machine->regX;
      machine->regA = memReadByte(machine, addr );
      if( machine->regA ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regA & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xbe:                          /* LDX ABSY */
      addr = popWord(machine) + machine->regY;
      machine->regX = memReadByte(machine, addr );
      if( machine->regX ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regX & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xc0:                          /* CPY IMM */
      value = popByte(machine);
      if( (machine->regY+value) > 0xff ) machine->regP |= 1; else machine->regP &= 0xfe;
      ov = value;
      value = (machine->regY-value);
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xc1:                          /* CMP INDY */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regY;
      value = memReadByte(machine, addr );
      doCompare( machine->regA, value );
      break;
  case 0xc4:                          /* CPY ZP */
      value = memReadByte(machine, popByte(machine) );
      doCompare( machine->regY, value );
      break;
  case 0xc5:                          /* CMP ZP */
      value = memReadByte(machine, popByte(machine) );
      doCompare( machine->regA, value );
      break;
  case 0xc6:                          /* DEC ZP */
      zp = popByte(machine);
      value = memReadByte(machine, zp );
      memStoreByte(machine, zp, (value-1)&0xff );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xc8:                          /* INY */
      machine->regY = (machine->regY + 1) & 0xff;
      if( machine->regY ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regY & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xc9:                          /* CMP IMM */
      value = popByte(machine);
      doCompare( machine->regA, value );
      break;
  case 0xca:                          /* DEX */
      machine->regX = (machine->regX-1) & 0xff;
      if( machine->regX ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regX & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xcc:                          /* CPY ABS */
      value = memReadByte(machine, popWord(machine) );
      doCompare( machine->regY, value );
      break;
  case 0xcd:                          /* CMP ABS */
      value = memReadByte(machine, popWord(machine) );
      doCompare( machine->regA, value );
      break;
  case 0xce:                          /* DEC ABS */
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      value = (value-1)&0xff;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xd0:                          /* BNE */
      offset = popByte(machine);
      /*if( (machine->regP&2)==0 ) { oldPC = machine->regPC; jumpBranch( offset ); message( "Jumping from " + oldPC + " to " + machine->regPC ); } else { message( "NOT jumping!" ); } */
      if( (machine->regP&2)==0 ) jumpBranch( offset );
      break;
  case 0xd1:                          /* CMP INDY */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regY;
      value = memReadByte(machine, addr );
      doCompare( machine->regA, value );
      break;
  case 0xd5:                          /* CMP ZPX */
      value = memReadByte(machine, popByte(machine) + machine->regX );
      doCompare( machine->regA, value );
      break;
  case 0xd6:                          /* DEC ZPX */
      addr = popByte(machine) + machine->regX;
      value = memReadByte(machine, addr );
      value = (value-1)&0xff;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xd8:                          /* CLD (CLear Decimal) */
      machine->regP &= 0xf7;
      break;
  case 0xd9:                          /* CMP ABSY */
      addr = popWord(machine) + machine->regY;
      value = memReadByte(machine, addr );
      doCompare( machine->regA, value );
      break;
  case 0xdd:                          /* CMP ABSX */
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      doCompare( machine->regA, value );
      break;
  case 0xde:                          /* DEC ABSX */
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      value = (value-1)&0xff;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xe0:                          /* CPX IMM */
      value = popByte(machine);
      doCompare( machine->regX, value );
      break;
  case 0xe1:                          /* SBC INDX */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8) + machine->regX;
      value = memReadByte(machine, addr );
      testSBC( value );
      break;
  case 0xe4:                          /* CPX ZP */
      value = memReadByte(machine, popByte(machine) );
      doCompare( machine->regX, value );
      break;
  case 0xe5:                          /* SBC ZP */
      addr = popByte(machine);
      value = memReadByte(machine, addr );
      testSBC( value );
      break;
  case 0xe6:                          /* INC ZP */
      zp = popByte(machine);
      value = memReadByte(machine, zp );
      value = (value+1)&0xff;
      memStoreByte(machine, zp, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xe8:                          /* INX */
      machine->regX = (machine->regX + 1) & 0xff;
      if( machine->regX ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( machine->regX & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xe9:                         /* SBC IMM */
      value = popByte(machine);
      testSBC( value );
      break;
  case 0xea:                         /* NOP */
      break;
  case 0xec:                         /* CPX ABS */
      value = memReadByte(machine, popWord(machine) );
      doCompare( machine->regX, value );
      break;
  case 0xed:                         /* SBC ABS */
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      testSBC( value );
      break;
  case 0xee:                         /* INC ABS */
      addr = popWord(machine);
      value = memReadByte(machine, addr );
      value = (value+1)&0xff;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xf0:                         /* BEQ */
      offset = popByte(machine);
      if( machine->regP&2 ) jumpBranch( offset );
      break;
  case 0xf1:                         /* SBC INDY */
      zp = popByte(machine);
      addr = memReadByte(machine,zp) + (memReadByte(machine,zp+1)<<8);
      value = memReadByte(machine, addr + machine->regY );
      testSBC( value );
      break;
  case 0xf5:                         /* SBC ZPX */
      addr = (popByte(machine) + machine->regX)&0xff;
      value = memReadByte(machine, addr );
      machine->regP = (machine->regP&0xfe)|(value&1);
      testSBC( value );
      break;
  case 0xf6:                         /* INC ZPX */
      addr = popByte(machine) + machine->regX;
      value = memReadByte(machine, addr );
      value=(value+1)&0xff;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
  case 0xf8:                         /* SED */
      machine->regP |= 8;
      break;
  case 0xf9:                          /* SBC ABSY */
      addr = popWord(machine);
      value = memReadByte(machine, addr + machine->regY );
      testSBC( value );
      break;
  case 0xfd:                         /* SBC ABSX */
      addr = popWord(machine);
      value = memReadByte(machine, addr + machine->regX );
      testSBC( value );
      break;
  case 0xfe: /* INC ABSX */
      addr = popWord(machine) + machine->regX;
      value = memReadByte(machine, addr );
      value=(value+1)&0xff;
      memStoreByte(machine, addr, value );
      if( value ) machine->regP &= 0xfd; else machine->regP |= 0x02;
      if( value & 0x80 ) machine->regP |= 0x80; else machine->regP &= 0x7f;
      break;
    default:
      fprintf(stderr, "Address $ %x - unknown opcode %x",machine->regPC,opcode );
      /*machine->regPC = compiledCode.length; */
      machine->regPC = (0x600+machine->codeLen);
      break;
  }

  if( (machine->regPC == 0) || (!machine->codeRunning) || (machine->regPC>(machine->codeLen+0x600)) ) {
    fprintf(stderr, "Program end at PC=$ %x" + machine->regPC );
    machine->codeRunning = False;
  }
}

machine_6502 *build6502(){
  machine_6502 *machine;
  machine = emalloc(sizeof(machine_6502));
  assignOpCodes(machine->opcodes);
  reset(machine);
  return machine;
}

void destroy6502(machine_6502 *machine){
  free(machine);
  machine = NULL;
}


int main(int argc, char **argv){
  machine_6502 *machine = build6502();
  char *code;

  if (argc == 1)
    eprintf("usage: assembler filename");
  else
    code = fileToBuffer(argv[1]);
  
  compileCode(machine, code);
  hexDump(machine);

  destroy6502(machine);
  return 0;
}
