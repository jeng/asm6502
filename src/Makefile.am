debug6502dir = ../
noinst_HEADERS=asm6502.h
bin_PROGRAMS = debug6502 
debug6502_SOURCES =  debug6502.c asm6502.c asm6502.h
debug6502_CPPFLAGS = -DDEBUGGER=1 
debug6502_LDADD = -lm
man6_MANS = 6502debug.man
EXTRA_DIST = asm/backandforward.asm  asm/breakout.asm  asm/byterun.asm  asm/cellular-30.asm  \
		asm/cellular-600.asm  asm/demoscene.asm  asm/dmsc.asm  asm/dragon-fractal.asm  \
		asm/flash.asm  asm/fullscreenlogo.asm  asm/keftal.asm  asm/life.asm  asm/matrix.asm \
		asm/noise.asm  asm/pong.asm  asm/random2.asm  asm/random.asm  asm/random-walk.asm \
		asm/rorschach.asm  asm/self-mod.asm  asm/sierpinsky2.asm  asm/sierpinsky.asm \
		asm/sinus.asm  asm/snake.asm  asm/spacer.asm  asm/zookeeper.asm 
