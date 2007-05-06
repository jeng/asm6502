#DEBUG = -DMEMWATCH -DMEMWATCH_STDIO
DEBUG = -g
LK = -ansi -Wall -lm
CC = gcc 

#compiler settings used for gprof
PROFILE = -pg -O2
PCC = gcc $(PROFILE) $(LK)

#compiler settings used with valgrind
VALGR = $(DEBUG) -O $(LK)

assembler: asm6502.c 
	$(CC) -o assembler assembler.c asm6502.c $(DEBUG) $(LK)

assemblerExpand: asm6502.c 
	$(CC) -E -o asm6502.txt asm6502.c

assemblerProf: asm6502.c
	$(PCC) -o asm6502 asm6502.c

assemblerMem: asm6502.c
	$(CC)  asm6502.c $(VALGR) -o asm6502

clean:
	rm *.o
	rm asm6502
