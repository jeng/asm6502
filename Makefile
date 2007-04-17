#DEBUG = -DMEMWATCH -DMEMWATCH_STDIO
DEBUG = -g
CC = gcc $(DEBUG) -ansi -Wall

assembler: assembler.c memwatch.h memwatch.c
	$(CC) -o assembler assembler.c memwatch.c

clean:
	rm *.o
	rm assembler
