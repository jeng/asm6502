#DEBUG = -DMEMWATCH -DMEMWATCH_STDIO
DEBUG = -g
CC = gcc -pg $(DEBUG) -ansi -Wall -lm

assembler: assembler.c memwatch.h memwatch.c
	$(CC) -o assembler assembler.c memwatch.c 

assemblerExpand: assembler.c 
	$(CC) -E -o assembler.txt assembler.c

clean:
	rm *.o
	rm assembler
