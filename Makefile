#DEBUG = -DMEMWATCH -DMEMWATCH_STDIO
DEBUG = -g
LK = -ansi -Wall -lm
CC = gcc 

#compiler settings used for gprof
PROFILE = -pg -O2
PCC = gcc $(PROFILE) $(LK)

#compiler settings used with valgrind
VALGR = $(DEBUG) -O $(LK)

assembler: assembler.c 
	$(CC) -o assembler assembler.c $(DEBUG) $(LK)

assemblerExpand: assembler.c 
	$(CC) -E -o assembler.txt assembler.c

assemblerProf: assembler.c
	$(PCC) -o assembler assembler.c

assemblerMem: assembler.c
	$(CC)  assembler.c $(VALGR) -o assembler

clean:
	rm *.o
	rm assembler
