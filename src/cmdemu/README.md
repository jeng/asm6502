# CmdEmu

When I was working on the 6502 xscreensaver module, I wrote this program so I
could work on the emulator and assembler separate from the screensaver.

## Build Instructions

### Linux

1. autoreconf -i
2. ./configure
3. make

### Windows

From an environment that has the visual studio variables defined (I do this by
running vcvarsall.bat).  Run the command `build.bat`.

## Usage

To run the ascii version of the emualtor run `./cmdemu ../asm/matrix.asm` for example

To run the compile and get an output binary file run 

    ./cmdemu -d ../asm/matrix.asm out.bin 8000

The 8000 is the start of the program counter.  The assembler has a default PC
of 0x600.  The entry point instruction also needs to be specified in the
assembly code. For example:  

    *=$8000
    lda #$ff
    sta $6002
    loop:
    lda #$55
    sta $6000
    lda #$aa
    sta $6000
    jmp loop



