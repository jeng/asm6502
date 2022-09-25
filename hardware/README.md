# Hardware version of the screensaver emulator

## BOM

- 1 x 32x32 RGB LED Matrix Panel - 4mm Pitch[ID:607] 
- 1 x Keyestudio Mega 2560
- 1 x W65C02
- 1 x 28C256 256K Parallel EEPROM
- 1 x 62256 256K SRAM
- 1 x 7400 Quad 2-input NAND Gate
- 2 x 7421 Dual 4-input AND Gate
- 2 x 7408 Quad 2-input AND Gate
- 2 x 7414 Dual Gate/Hex Inverter
- 1 x 7432 Quad 2-input OR Gate
- 11 bypass capacitors

## Memory Map

|low|high|area|
|---|----|----|
|0x0000|0x00FB|RAM|
|0x00FC|0x00FD|Not Used|
|0x00FE|0x00FE|RNG|
|0x00FF|0x00FF|ASCII Code of the last key press|
|0x0100|0x0199|RAM|
|0x0200|0x05FF|Framebuffer|
|0x05FF|0x7FFF|RAM|
|0x8000|0xFFFF|ROM|

## Disclaimer

I'm doing this as a hobby.  I make no guarantees about the safety or the
correctness of what is provided.  It is provided "as is" without express or 
implied warranty.
