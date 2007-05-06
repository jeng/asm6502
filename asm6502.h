#ifndef __ASM6502_H__
#define __ASM6502_H__

typedef uint8_t  Bit8;
typedef uint16_t Bit16;
typedef uint32_t Bit32;

enum {
  MAX_LABEL_LEN = 80, 
  NUM_OPCODES = 56, /* Number of unique instructions not counting DCB */
  MEM_64K = 65536, /* We have 64k of memory to work with. */
  MAX_PARAM_VALUE = 25, /* The number of values allowed behind dcb */
  MAX_CMD_LEN = 4, /* Each assembly command is 3 characeters long */
/* The stack works from the top down in page $100 to $166 */
  STACK_TOP = 0x1ff,
  STACK_BOTTOM = 0x100 
};

typedef enum{
  SINGLE, IMMEDIATE_VALUE, IMMEDIATE_GREAT, 
    IMMEDIATE_LESS, INDIRECT_X, INDIRECT_Y,
    ZERO, ZERO_X, ZERO_Y,
    ABS_VALUE, ABS_OR_BRANCH, ABS_X, ABS_Y,
    ABS_LABEL_X, ABS_LABEL_Y, DCB_PARAM
} AddrMode;

typedef struct machine_6502 machine_6502;

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
  void (*func) (machine_6502*, AddrMode);
} Opcodes;

/* Used to cache the index of each opcode */
typedef struct {
  Bit8 index;
  AddrMode adm;
} OpcodeIndex;

/* Plotter is a function that will be called everytime a pixel
   needs to be updated. The first two parameter are the x and y
   values. The third parameter is the color index:

   Color Index Table
   00 black      #000000
   01 white      #ffffff
   02 Red        #880000
   03 seafoam    #aaffee
   04 fuscia     #cc44cc
   05 green      #00cc55
   06 blue       #0000aa
   07 Yellow     #eeee77
   08 tangerine  #dd8855
   09 brown      #664400
   10 salmon     #ff7777
   11 charcoal   #333333
   12 smoke      #777777
   13 lime       #aaff66
   14 light blue #0088ff
   15 gray       #bbbbbb
*/
typedef void (*Plotter) (Bit8, Bit8, Bit8);

struct machine_6502 {
  Bool codeCompiledOK;
  Bit8 regA;
  Bit8 regX;
  Bit8 regY;
  Bit8 regP;
  Bit16 regPC; /* A pair of 8 bit registers */
  Bit16 regSP;
  Bit8 memory[MEM_64K];
  Bool runForever;
  int labelPtr;
  Bool codeRunning;
  int myInterval;
  Opcodes opcodes[NUM_OPCODES];
  int screen[32][32];
  int codeLen;
  OpcodeIndex opcache[0xff];
  Plotter plot;
};

machine_6502 *build6502();
void destroy6502(machine_6502 *machine);
void evalFile(machine_6502 *machine, char *filename, Plotter plot);
/* void hexDump(machine_6502 *machine); XXX */

#endif /* __ASM6502_H__ */
