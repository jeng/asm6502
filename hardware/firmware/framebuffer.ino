//TODO build an external bus monitor.  Blondi hacks has one and I have a
//screenshot of one from a book I read recently



// colorwheel demo for Adafruit RGBmatrixPanel library.
// Renders a nice circle of hues on our 32x32 RGB LED matrix:
// http://www.adafruit.com/products/607
// 32x32 MATRICES DO NOT WORK WITH ARDUINO UNO or METRO 328.

// Written by Limor Fried/Ladyada & Phil Burgess/PaintYourDragon
// for Adafruit Industries.
// BSD license, all text above must be included in any redistribution.

#include <RGBmatrixPanel.h>

// Most of the signal pins are configurable, but the CLK pin has some
// special constraints.  On 8-bit AVR boards it must be on PORTB...
// Pin 11 works on the Arduino Mega.  On 32-bit SAMD boards it must be
// on the same PORT as the RGB data pins (D2-D7)...
// Pin 8 works on the Adafruit Metro M0 or Arduino Zero,
// Pin A4 works on the Adafruit Metro M4 (if using the Adafruit RGB
// Matrix Shield, cut trace between CLK pads and run a wire to A4).

#define CLK 11 // USE THIS ON ARDUINO MEGA
#define OE   9
#define LAT 10
#define A   A0
#define B   A1
#define C   A2
#define D   A3
#define RESET 14

#define RINGBUFFER_SZ (0xff)

RGBmatrixPanel matrix(A, B, C, D, CLK, LAT, OE, false);//The last parameter controls double buffer

typedef struct {
    uint16_t address;
    uint8_t value;
} pixel_t;

typedef struct {
    pixel_t data[RINGBUFFER_SZ];
    uint8_t readIndex;
    uint8_t writeIndex;
} ringbuffer_t;

ringbuffer_t ringbuffer;

//9bit color palette
//9bit m6502 palette		
//0	0	0
//7	7	7
//4	0	0
//5	7	7
//6	2	2
//0	6	2
//0	0	5
//7	6	3
//6	4	2
//3	2	0
//7	3	3
//1	1	1
//3	3	3
//5	7	3
//0	4	7
//5	5	5
//TODO reduce this to a 16bit
//uint32_t colorTable[] = {
//    0,
//    0x070707,
//    0x040000,
//    0x050707,
//    0x060202,
//    0x000602,
//    0x000005,
//    0x070603,
//    0x060402,
//    0x030200,
//    0x070303,
//    0x010101,
//    0x030303,
//    0x050703,
//    0x000407,
//    0x050505};
//uint32_t colorTable[] = {
//    0x000000,
//    0xffffff,
//    0x880000, //This is the correct value
//    0xaaddee,
//    0xcc44cc,
//    0x0000aa,
//    0xeeee77,
//    0xdd8855,
//    0x664400,
//    0xff7777,
//    0x333333,
//    0x777777,
//    0xaaff66,
//    0x0088ff,
//    0xbbbbbb};

//4-bit version
uint32_t colorTable[] = {
    0x000000,
    0x0f0f0f,
    0x080000,
    0x0a0f0e,
    0x0c040c,
    0x000c05,
    0x00000a,
    0x0e0e07,
    0x0d0805,
    0x060400,
    0x0f0707,
    0x030303,
    0x070707,
    0x0a0f06,
    0x00080f,
    0x0b0b0b};
//This is the sim ram and rom code from before
//#include "nopLoop.h"

//TODO change this to actually read the whole port instead of doing a digital read and write
//
//Data is on port PC.  It PC7 is at D30, PC6 is at D31, etc until we get to PC0 at D37.
//D0 on the 6502 is at PC0(D37) and D7 is at PC7(D30)
//
//The address lines are split between two ports.  It would be nice if the mega
//had the ports grouped together on the section of headers that are grouped
//together on the end of the board but that is not the case.  I also need to
//make sure I dont use any ports that that matrix is using
//

//I can use PL0 which is pin D49(PL0) through D42 (PL7)
// and also port PK which is pin A8 through A15

//This need to be listed in descending order A15...A0 of the 6502
const char ADDR_LINES[] = {A15, A14, A13, A12, A11, A10, A9, A8, 42, 43, 44, 45, 46, 47,48, 49};//{49, 48, 47, 46, 45, 44, 43, 42, A8, A9, A10, A11, A12, A13, A14, A15};
//const char data[] = {37, 36, 35, 34, 33, 32, 31, 30};//{31,33,35,37,39,41,43,45};
const char DATA_LINES[] = {30, 31, 32, 33, 34, 35, 36, 37};//{31,33,35,37,39,41,43,45};
//const char data[] = {31,33,35,37,39,41,43,45};

//These would be on PE for these?
#define CLOCK 2
#define RWB 5
//#define STEP_IT 3
#define CLOCK_OUT 7 
#define RNG_CS 19 
#define FRMBUF_CS 18 
#define NOT_RAM_ROM_CLK_LOW 20 
#define SLOWCLK_1 A6
//#define SLOWCLK_2 A7


const unsigned int TOP_RAM = (4 * 1024) + 1;
byte ram[TOP_RAM]; //0xf000 - 0x4090
bool clock_running = false;
//byte rom[4 * 1024]; //0x0000 - 0x1000


//#define CS1_6522 51
//#define CS2_6522 53

void SetupClock(){
    clock_running = true;
    //Increase the frequency of the output pin
    //This code worked in its own project
    //Produces a 2MHz clock
    pinMode(CLOCK_OUT, OUTPUT);
    TCCR4A = _BV(COM4B1) | _BV(WGM41) | _BV(WGM40);
    TCCR4B = _BV(WGM43)  | _BV(WGM42) | _BV(CS40) ;
    TCNT4 = 0;
    OCR4A = 7;
    OCR4B = 3;
    //Also need to set both slow clocks low
    pinMode(SLOWCLK_1, OUTPUT); 
    digitalWrite(SLOWCLK_1, LOW);
}

void TurnClockOn(){
    clock_running = true;
    //Increase the frequency of the output pin
    //This code worked in its own project
    //Produces a 2MHz clock
    //TCNT4 = 0;
    //OCR4A = 7;
    //OCR4B = 3;
    //Serial.println("Clock ON");
    pinMode(CLOCK_OUT, OUTPUT);
}


void TurnClockOff(){    
    clock_running = false;
    //TCCR4A = 0;
    //TCCR4B = 0;
    //TCNT4 = 0;
    //OCR4A = 0;
    //OCR4B = 0;
    pinMode(CLOCK_OUT, INPUT);
}

void setAddrHighZ(){
    for(int i = 0; i < sizeof(ADDR_LINES); i++){
        pinMode(ADDR_LINES[i], INPUT);
    }
}

void setDataHighZ(){
    for(int i = 0; i < sizeof(DATA_LINES); i++){
        pinMode(DATA_LINES[i], INPUT);
    }
}

int count =0;
void setup() {

    //clock_running = true;
    //Color circle
    int      x, y, hue;
    float    dx, dy, d;
    uint8_t  sat, val;
    uint16_t c;

    ringbuffer.readIndex = 0;
    ringbuffer.writeIndex = 0;

    matrix.begin();

//      for(y=0; y < matrix.width(); y++) {
//        dy = 15.5 - (float)y;
//        for(x=0; x < matrix.height(); x++) {
//          dx = 15.5 - (float)x;
//          d  = dx * dx + dy * dy;
//          if(d <= (16.5 * 16.5)) { // Inside the circle(ish)?
//            hue = (int)((atan2(-dy, dx) + PI) * 1536.0 / (PI * 2.0));
//            d = sqrt(d);
//            if(d > 15.5) {
//              // Do a little pseudo anti-aliasing along perimeter
//              sat = 255;
//              val = (int)((1.0 - (d - 15.5)) * 255.0 + 0.5);
//            } else
//            {
//              // White at center
//              sat = (int)(d / 15.5 * 255.0 + 0.5);
//              val = 255;
//            }
//            c = matrix.ColorHSV(hue, sat, val, true);
//          } else {
//            c = 0;
//          }
//          matrix.drawPixel(x, y, c);
//        }
//      }

    //end color circle



    //memory = (byte*)calloc(0xffff, sizeof(byte));

    //pinMode(CLOCK, INPUT);
    //attachInterrupt(digitalPinToInterrupt(CLOCK), onClock, RISING);

    setAddrHighZ();
    setDataHighZ();

    //Set the reset pin low
    pinMode(RESET, OUTPUT);
    digitalWrite(RESET, HIGH);

    pinMode(SLOWCLK_1, OUTPUT); 
    digitalWrite(SLOWCLK_1, LOW);


    //I'm getting so much flicker.  Trying to see if this is tied to the interrupts
    //The adafruit matrix has its own interrupt that it sets up on a timer and then
    //performs the draw calls.

    //TODO (JHE) uncomment these two lines when finished debugging the flickr
    attachInterrupt(digitalPinToInterrupt(RNG_CS), onRNG, RISING);
    attachInterrupt(digitalPinToInterrupt(FRMBUF_CS), onFrameBuffer, RISING);
    //TODO (JHE) remove this it is just for debugging
    //attachInterrupt(digitalPinToInterrupt(RNG_CS), justDebugging, RISING);
    //attachInterrupt(digitalPinToInterrupt(FRMBUF_CS), justDebugging, RISING);





//    attachInterrupt(digitalPinToInterrupt(RNG_CS), onRNG, FALLING);
//    attachInterrupt(digitalPinToInterrupt(FRMBUF_CS), onFrameBuffer, FALLING);
//    attachInterrupt(digitalPinToInterrupt(NOT_RAM_ROM_CLK_LOW), onClockHigh, RISING);

    //pinMode(STEP_IT, INPUT);
    //attachInterrupt(digitalPinToInterrupt(STEP_IT), onStepIt, RISING);

    //TurnClockOn();    
    Reset6502();

    //pinMode(RWB, INPUT);
    //pinMode(CS1_6522, INPUT);
    //pinMode(CS2_6522, INPUT);
    Serial.begin(57600);
    Serial.print("yo yo yo!\n");
    count = 0;
}

void sendByte(unsigned int output){
    byte b = output & 0xff;

    //if (address >= ROM_BASE){
    //    b = pgm_read_byte_near(&(rom[address - ROM_BASE]));

    //    char s[1024];
    //    sprintf(s, "ROM sendByte %.4x %.4x %.2x\n", address, address - ROM_BASE, b);
    //    Serial.print(s);
    //}
    //else {
    //    b = ram[address];

    //    char s[1024];
    //    sprintf(s, "RAM sendByte %.4x %.2x\n", address, b);
    //    Serial.print(s);

    //}

    for(int i = 0; i < sizeof(DATA_LINES); i++){
        pinMode(DATA_LINES[i], OUTPUT);
    }

    for(int i = 0; i < 8; i++){
        byte bit = b & (1 << (7-i));
        if (bit)
            digitalWrite(DATA_LINES[i], HIGH);
        else
            digitalWrite(DATA_LINES[i], LOW);        
    }

}

void storeByte(unsigned int address, byte b){
    if (0 <= address && address <= TOP_RAM)
        ram[address] = b;
}

void clearCount(){
    Serial.println("Clearing count");
    count= 0;
}

void ManualRNG(){
    unsigned int address = getAddr(); 
    if(0xFC <= address && address <= 0xFF){
        if (digitalRead(CLOCK)){
            //Address should be valid
            if (address == 0xFE && digitalRead(RWB)){
                Serial.print("Really an RNG\n");
                int rnd = random(0x100);
                sendByte(rnd);
                char debug[10];
                sprintf(debug, "rng %.2x", rnd);
                Serial.println(debug);
            }
        }
    }
}

#if 1
void onClockHigh(){
}
#else
void onClockHigh(){
    TurnClockOff();
    Serial.println("onClockHigh");
    setDataHighZ();
    printAddr();
    digitalWrite(SLOWCLK_1, HIGH);
    TurnClockOn();
}
#endif


void HandleInterrupts(){
    TurnClockOff();
    //Serial.println("interrupt");
    int addr = getAddr();
    bool gotRng = false;
    bool gotFrmBuf = false;

    while(0xfc <= addr && addr <= 0xff){
        gotRng = true;
        if (addr == 0xFE && digitalRead(RWB) && digitalRead(CLOCK)){
            int rnd = random(0x100);
            sendByte(rnd);
            digitalWrite(SLOWCLK_1, LOW);
            //TODO how long should we wait here?
            setDataHighZ();
        }
        addr = getAddr();
        if (0xfc <= addr && addr <= 0xff){
            if (digitalRead(CLOCK))
                digitalWrite(SLOWCLK_1, LOW);
            else
                digitalWrite(SLOWCLK_1, HIGH);
        }
    }

    while(0x200 <= addr && addr < 0x600){
        gotFrmBuf = true;
        //Serial.println("Got an Frame buffer");
        //The address is valid when the clock is high
        if (digitalRead(CLOCK)){
            if (digitalRead(RWB)){
                sendByte(GetPixel(addr));
                digitalWrite(SLOWCLK_1, LOW);
                //TODO how long should we wait here?
                setDataHighZ();
            }else{
                uint8_t data = getData();
                SavePixel(addr, data);
                //SaveToRingbuffer(addr, data);

                //Instead of writing to the matrix directly here
                //We are going to save all of the writes to a ringbuffer
                //then push them out in the main loop.  In theory the
                //built in backing buffer of the matrix is basically 
                //doing the same thing.  But I'm seeing some tearing.
                //Either I wasn't swaping ofter enough or something about 
                //updating from the interrupt is causing issues.
                //
                //If this doesn't work I might need to consider having away
                //to trigger a backbuffer swap from the 6502.  Or have
                //the driver menu here allow for turning on and off the
                //backing buffer

                PutPixel(addr, data);
                digitalWrite(SLOWCLK_1, LOW);
            }
        } else {
            digitalWrite(SLOWCLK_1, HIGH);
        }
        addr = getAddr();
    }

    //TODO HACK
    //if (!gotFrmBuf && !gotRng){
    //    if (digitalRead(CLOCK))
    //        digitalWrite(SLOWCLK_1, LOW);
    //    else
    //        digitalWrite(SLOWCLK_1, HIGH);
    //}

    TurnClockOn();
}


//Test version that just stops the clock.  This should allow me to step through
//the handlers manually
#if 0
void onRNG(){
    TurnClockOff();
}
#else
void onRNG(){
    HandleInterrupts();
}
#endif

// void onStepIt(){
//     char s[1024];
//     int a = getAddr();
//     int d = getData();
// 
//     sprintf(s, "Step it address %.4x %c Data %.4x clock %c\n", a, digitalRead(RWB) ? 'r' : 'w', d, digitalRead(CLOCK) ? 'H' : 'L');
//     Serial.print(s);
// 
//     if (digitalRead(CLOCK)){
//         digitalWrite(SLOWCLK_2, LOW);
//     } else {
//         digitalWrite(SLOWCLK_2, HIGH);
//     }
// }

unsigned int getAddr(){
    unsigned int a = 0;
    for(int i = 0; i < sizeof(ADDR_LINES); i++){
        int bit = digitalRead(ADDR_LINES[i]) ? 1 : 0;
        //Serial.print(bit);
        a = (a << 1) + bit;
    }
    return a;
}

unsigned int getData(){
    unsigned int d = 0;
    for(int i = 0; i < sizeof(DATA_LINES); i++){
        pinMode(DATA_LINES[i], INPUT);
    }

    for(int i = 0; i < sizeof(DATA_LINES); i++){
        int bit = digitalRead(DATA_LINES[i]) ? 1 : 0;
        //Serial.print(bit);
        d <<= 1;
        d |= bit;
    }
    //Serial.println();
    return d;
}

//unsigned int textBuffer[32*32] = {0};
unsigned int buffer[32*32] = {0};

/*
void dumpBuffer(){
    Serial.println();
    for (int y = 0; y < 32; y++){
        for(int x = 0; x < 32; x++){
            char s[10];
            sprintf(s, "%.2x ", textBuffer[y * 32 + x]);
            Serial.print(s);
        }
        Serial.println();
    }
}
*/

void printAddr(){
    int addr = getAddr();
    char s[20];
    sprintf(s, "add %d 0x%.4x", addr, addr);
    Serial.println(s);
}

uint32_t dumpCount = 0;
unsigned long LastBufferFlush = 0;

void SavePixel(uint16_t addr, uint8_t dataByte){
    addr = addr - 0x200;
    buffer[addr] = dataByte;
}

unsigned int GetPixel(uint16_t addr){
    addr = addr - 0x200;
    return buffer[addr];
}

void SaveToRingbuffer(uint16_t addr, uint8_t dataByte){
    if (ringbuffer.writeIndex >= RINGBUFFER_SZ){
        ringbuffer.writeIndex = 0;
    } 

    pixel_t pixel;
    pixel.address = addr;
    pixel.value = dataByte;
    ringbuffer.data[ringbuffer.writeIndex++] = pixel;
}

pixel_t GetFromRingbuffer(){
    if (ringbuffer.readIndex >= RINGBUFFER_SZ){
        ringbuffer.readIndex = 0;
    }

    pixel_t p = ringbuffer.data[ringbuffer.readIndex++];
    return p;
}

void DrawBuffer(){
    //Serial.println("write buffer out");
    for(int y = 0; y < 32; y++){
        for(int x = 0; x < 32; x++){
            int dataByte = buffer[y * 32 + x];
            uint32_t color = colorTable[dataByte & 0x0f];
            uint32_t red   = (color & 0xff0000) >> 16;
            uint32_t green = (color & 0x00ff00) >> 8;
            uint32_t blue  = (color & 0x0000ff);

            uint32_t c = matrix.Color444(red, green, blue);
            matrix.drawPixel(x, y, c);
            //Serial.print("Data Byte: ");
            //Serial.println(dataByte);
            //Serial.print(x);
            //Serial.print(" ");
            //Serial.print(y);
            //Serial.print(" ");
            //Serial.print(c);
            //Serial.println();
        }
    }
    //Serial.println(millis() - LastBufferFlush);
    //if (millis() - LastBufferFlush >= 1000){
    //    matrix.swapBuffers(false);
    //    LastBufferFlush = millis();
    //}
    //Serial.print("Finished ");
    //Serial.println(LastBufferFlush);
}

void PutPixel(uint16_t addr, uint8_t dataByte){
    uint32_t color = colorTable[dataByte & 0x0f];
    uint32_t red   = (color & 0xff0000) >> 16;
    uint32_t green = (color & 0x00ff00) >> 8;
    uint32_t blue  = (color & 0x0000ff);
    //Serial.println(dataByte);

    //Serial.print(addr);
    //Serial.print(" ");
    //Serial.print(dataByte);
    uint16_t o_addr = addr;

    addr = addr - 0x200;
    uint8_t y = addr / 32;
    uint8_t x = addr - (y * 32);
    uint16_t c = matrix.Color444(red, green, blue);
    matrix.drawPixel(x, y, c);
    //matrix.swapBuffers(false);
//    Serial.println(millis() - LastBufferFlush);

    //textBuffer[y * 32 + x] = dataByte & 0x0f;
    //char s[100];
    //sprintf(s, " putpixel %d %d (%d, %d, %d) addr %d, %d", x, y, red, green, blue, o_addr, dumpCount);
    //Serial.println(s);

    //if (dumpCount % 10 == 0){
        //dumpBuffer();
    //}
    //dumpCount++;
}

/*
void NextSlowClockKeyPress(){
    byte n = Serial.read();
    if (n == 'n'){
        int addr = getAddr();
        Serial.print("Addr ");
        Serial.print(addr);
        Serial.print(" data ");
        Serial.print(getData());
        if (digitalRead(CLOCK)){
            Serial.println("Slow clocking low");
            digitalWrite(SLOWCLK_2, LOW);
        } else {
            Serial.println("Slow clocking high");
            digitalWrite(SLOWCLK_2, HIGH);
        }
    }
}
*/


void ManualFrameBuffer(){
    int addr = getAddr();
    if (0x200 <= addr && addr < 0x600){
        if (digitalRead(CLOCK)){
            Serial.println("Sending data");
            SavePixel(addr, getData());
        }
    }
}

void PrintBackingBuffer(){
    for(int y = 0; y < 32; y++){
        for(int x = 0; x < 32; x++){
            Serial.print(buffer[y * 32 + x]);
            Serial.print(" ");
        }
        Serial.println();
    }
}

/*
void onFrameBuffer(){
    TurnClockOff();
    //Serial.println("Got an Frame buffer");


    //printAddr();
    //printAddr();

    int addr = getAddr();
    if (0x200 <= addr && addr < 0x600){
        //The address is valid when the clock is high
        if (digitalRead(CLOCK)){
            Serial.println("Sending data");
            //What for the data to be valid
            //Takes about 25ns
            delay(500);
            putPixel(addr, getData());
            delay(5000);
            //NextSlowClockKeyPress(); 
            //digitalWrite(SLOWCLK_2, LOW);
        } else {
            //If the clock is low move to the next phase
            //digitalWrite(SLOWCLK_2, HIGH);
            delay(500);
            //NextSlowClockKeyPress(); 
        }
        //addr = getAddr();
        //Serial.println("what the fuck");
        //textBuffer[addr] = getData();
        //char s[20];
        //sprintf(s, "data %.2x", getData());
        //Serial.println(s);
        //dumpBuffer();
    }
    //else {
    //    Serial.print("Invalid add: ");
    //    char s[20];
    //    sprintf(s, "%.4x    %.4x", addr, getAddr());
    //    Serial.println(s);
    //}
    TurnClockOn();
}
*/

//Garbage
/*
void BusyWait(){
    unsigned long myTime = millis();
    while(true){ //Busy wait for 10,000 seconds
        unsigned long now = millis();
        unsigned long delta = now - myTime;
        Serial.print(myTime);
        Serial.print(" ");
        Serial.print(now);
        Serial.print(" ");
        Serial.println(delta);
        if ((now - myTime) > 5000){
            break;
        }
    }
}
*/

//Test version of the interrupt.  This should allow to step through it manually
//using the serial interface
#if 0
void onFrameBuffer(){
    //TurnClockOff();
    //Serial.println("Got an Frame buffer");
}
#else
void onFrameBuffer(){
    HandleInterrupts();
}
#endif

//void justDebugging(){
//    TurnClockOff();
//    int x = 0;
//    for(int i = 0; i < 100; i++){
//        x++;
//    }
//    Serial.println("In interrupt");
//    int b = 10 + x;
//    if (digitalRead(CLOCK))
//        digitalWrite(SLOWCLK_1, LOW);
//    else
//        digitalWrite(SLOWCLK_1, HIGH);
//    //TurnClockOn();
//}
//


unsigned int lastAdd = 0;

void onClock(){
    unsigned int a = getAddr();
    int d = 0;
    char s[1024] = {0};

    count++;
    count %= 100000;


    //sprintf(s, "%.5d:", count);
    //Serial.print(s);

    //sprintf(s, " %.4x\n", a);
    //Serial.print(s);
    //if (a == 0xfff){
    //    Serial.println("We got FFFF");
    //}

    //if (lastAdd == 0xfffc && a == 0xfffd){
    //    Serial.println("We got the interrupt vector");
    //}
    //lastAdd = a;

    //Send a NOP to test the circuit
    // for(int i = 0; i < sizeof(data); i++){
    //     pinMode(data[i], OUTPUT);
    // }

    //d7 1 d6 1 d5 1 d4 0 d3 1 d2 0 d1 1 d0 0

//    int b = 0b11101010;
//
//    for(int i = 0; i < 8; i++){
//        byte bit = b & (1 << (7-i));
//        if (bit)
//            digitalWrite(data[i], HIGH);
//        else
//            digitalWrite(data[i], LOW);        
//    }
//    //end NOP testing
//
//    return;

    //I'm get junk on the address lines since I switched to the new port.  Not
    //sure what is going on.  The boot sequence should look something like.
    //
    //
    // ! But this is actually wrong.  This is not the boot sequence 
    // 0b0000000110011001 0x0196 W 74 
    // 0b0000000110010110 0x0196 W 78
    // 0b0000000110010101 0x0195 W 74 
    // 0b1111111111111110 0xfffe r 74  # Jump vector.  Not sure why I'm not hitting this 
    // 0b1111111111111111 0xffff r 74 
    // 0b1101010001110100 0xd474 r 74 
    // 0b1101010001110101 0xd475 r 74
    //
    // - Is the matrix code jacking up the port that I'm using?  Hmm, A little
    // better.  I'm not getting that weird multiple clock interrupts anymore.
    // - What happens when using the NOP program?  >>> bin(0x6a)
    // 0000000001111111 0123456789012345 '0b0000000001101010' >>> bin(0xea)
    // 0000000001111111 0123456789012345 '0b0000000011101010'
    //
    //      Looks like bit 8 is off
    //
    //
    // The clock starts to fire multiple times when I hook up the external
    // power supply to the LCD display.  I have no idea why this would happen.


    // DEBUG
    // for(int i = 0; i < sizeof(data); i++){
    //     pinMode(data[i], INPUT);
    // }

    d = getData();

   // END DEBUG



//    Serial.print("    ");
//    if (digitalRead(RWB)){
//        sendByte(a);//Send the NOP
//    } else {
//        for(int i = 0; i < sizeof(data); i++){
//            pinMode(data[i], INPUT);
//        }
//
//        for(int i = 0; i < sizeof(data); i++){
//            int bit = digitalRead(data[i]) ? 1 : 0;
//            Serial.print(bit);
//            d <<= 1;
//            d |= bit;
//        }
//
//        storeByte(a, d);
//    }  

    /*
    memAddr = 0x200;
    for(y=0; y < matrix.width(); y++) {
        for(x=0; x < matrix.height(); x++) {
            int v = memory[0x200];
      dx = 15.5 - (float)x;
      d  = dx * dx + dy * dy;
      if(d <= (16.5 * 16.5)) { // Inside the circle(ish)?
        hue = (int)((atan2(-dy, dx) + PI) * 1536.0 / (PI * 2.0));
        d = sqrt(d);
        if(d > 15.5) {
          // Do a little pseudo anti-aliasing along perimeter
          sat = 255;
          val = (int)((1.0 - (d - 15.5)) * 255.0 + 0.5);
        } else
        {
          // White at center
          sat = (int)(d / 15.5 * 255.0 + 0.5);
          val = 255;
        }
        c = matrix.ColorHSV(hue, sat, val, true);
      } else {
        c = 0;
      }
      matrix.drawPixel(x, y, c);
    }
*/



    //sprintf(s, "   Address %.4x %c Data %.4x cs1 %c cs2 %c", a, digitalRead(RWB) ? 'r' : 'w', d, digitalRead(CS1_6522) ? 'y' : 'n', digitalRead(CS2_6522) ? 'y' : 'n' );
//    sprintf(s, "   Address %.4x %c Data %.4x", a, digitalRead(RWB) ? 'r' : 'w', d);
    //sprintf(s, "   Address %.4x %c", a, digitalRead(RWB) ? 'r' : 'w');
    //`sprintf(s, "%.6d Address %.4x data %.2x", count, a, d);
    //Serial.println(s);
}

void PrintBus(){
    uint32_t a = getAddr();
    int d = getData();
    char s[1024] = {0};
    Serial.print("data: ");
    Serial.println(d);
    //TODO for some reason data always prints 00 here eventhough data prints above with the direct println
    sprintf(s, "Address %.4x Data %.2x", a, d);
    Serial.println(s);
    sprintf(s, "r/w %s Clock %s", digitalRead(RWB) ? "r" : "w", digitalRead(CLOCK) ? "HIGH" : "LOW");
    Serial.println(s);
}

//bool HandleFrameBuffer(){
//    static int writeCount = 0;
//    int addr = getAddr();
//    if (0x200 <= addr && addr < 0x600){
//        //The address is valid when the clock is high
//        if (digitalRead(CLOCK)){
//            //Serial.println("Sending data");
//            //What for the data to be valid
//            //Takes about 25ns
//            //delay(500);
//            if (digitalRead(RWB)){
//                unsigned int p = GetPixel(addr);
//                sendByte(p);
//            } else {
//                SavePixel(addr, getData());
//                //putPixel(addr, getData());
//                if (writeCount % 50 == 0){//millis() - LastBufferFlush > 5000){//10 frames per second
//                    writeCount = 0;
//                    //Serial.println("Drawing buffer ");
//                    //Serial.println(millis());
//                    DrawBuffer();    
//                    //PrintBackingBuffer();
//                    //LastBufferFlush = millis();
//                }
//                writeCount++;
//            }
//            //delay(5000);
//            //NextSlowClockKeyPress(); 
//            digitalWrite(SLOWCLK_1, LOW);
//        } else {
//            //If the clock is low move to the next phase
//            //Serial.println("framebuffer clock low");
//            digitalWrite(SLOWCLK_1, HIGH);
//            //delay(500);
//            //NextSlowClockKeyPress(); 
//        }
//        addr = getAddr();
//        //Serial.println("what the fuck");
//        //textBuffer[addr] = getData();
//        //char s[20];
//        //sprintf(s, "data %.2x", getData());
//        //Serial.println(s);
//        //dumpBuffer();
//        return true;
//    }
//    return false;
//}

bool HandleRNG(){
    int addr = getAddr();
    if(0xFC <= addr && addr <= 0xFF){
        //Serial.println("Dude");
        if (digitalRead(CLOCK)){
            //Address should be valid
            if (addr == 0xFE && digitalRead(RWB)){
                //Serial.print("Really an RNG\n");
                int rnd = random(0x100);
                sendByte(rnd);
                //char debug[10];
                //sprintf(debug, "rng %.2x", rnd);
                //Serial.println(debug);
            }
            //Serial.println("Clocking Low");
            digitalWrite(SLOWCLK_1, LOW);
            //delay(500);//Address should only remain for 500ns.  TODO this delay is to long
        }
        else {
            //Serial.println("Clocking High");
            digitalWrite(SLOWCLK_1, HIGH);
            //delay(500);
        }
        addr = getAddr();

        return true;
    }
    return false;
}

void ClockManually(){
    pinMode(CLOCK_OUT, OUTPUT);
    if (digitalRead(CLOCK)){
        Serial.println("Manually clocking low");
        digitalWrite(CLOCK_OUT, LOW);
    } else {
        Serial.println("Manually clocking high");
        digitalWrite(CLOCK_OUT, HIGH);
    }
}

void SlowClockManually(){
    pinMode(SLOWCLK_1, OUTPUT);
    if (digitalRead(CLOCK)){
        Serial.println("Slow clocking low");
        digitalWrite(SLOWCLK_1, LOW);
    } else {
        Serial.println("Slow clocking high");
        digitalWrite(SLOWCLK_1, HIGH);
    }
}
 

void Reset6502(){
    //Turn off the clock
    TurnClockOff();
    //Set the reset pin high
    digitalWrite(RESET, LOW);
    //Step the clock manually for 7 clock cycles (should see FFFC and FFFD)
    for(int i = 0; i < 7; i++){
        //I need to read the clock logic again
        int x = digitalRead(CLOCK);
        SlowClockManually();
        int y = digitalRead(CLOCK);
        if (x == y)
            ClockManually();
        //PrintBus();
    }
    //Clear the matrix
    matrix.fillScreen(0);
    //Set the reset pin low
    digitalWrite(RESET, HIGH);
    //Turn on the clock
    //TurnClockOn();
    SetupClock();
    //TODO (remove) just for debug
    PrintBus();
}

void RandomWalkFrame(){
    uint32_t c = matrix.Color444(random(15), random(15), random(15));
    int x = random(30);
    int y = random(30);
    for(int i = 0; i < random(100); i++){
        matrix.drawPixel(x, y, c);
        x += random(2) - 1;
        y += random(2) - 1;
    }
}

int hack = 0;
void loop() {
    /*
    if (!clock_running){
        bool wasFrameBuffer = HandleFrameBuffer();
        bool wasRNG = HandleRNG();

        if (!(wasFrameBuffer || wasRNG)){
            TurnClockOn();
        }
    }
    */


//    int endIndex = ringbuffer.writeIndex;
//    while(ringbuffer.readIndex != endIndex){
//        pixel_t p = GetFromRingbuffer();
//        PutPixel(p.address, p.value);
//    }
    //matrix.swapBuffers(false);//The boolean controls weither we copy the backing buffer or not.  I'm not sure why I would need to worry about this?

    //if(hack == 1000){
    //    DrawBuffer();    
    //    hack = 0;
    //}
    //hack++;

    // put your main code here, to run repeatedly:
    //if (clock_running){
    //    analogWrite(CLOCK_OUT, 127);
    //}

    //TODO (JHE) remove this
    //RandomWalkFrame();

    byte n = Serial.read();

    //Menu System
    //n - Single step the slow clock
    //m - Single step the main clock
    //s - Print System Info
    //r - Perform RNG code manually
    //f - Perform Framebuffer code manually
    //b - Print out the backing buffer
    //o - Output the backing buffer
    //c - TurnClockOn
    //h - help system
    switch(n){
        case 'n': SlowClockManually();
        break;

        case 'm': ClockManually();
        break;
        
        case 's': PrintBus(); 
        break;

        case 'c': TurnClockOn();
        break;

        case 'r': ManualRNG();
        break;

        case 'f': ManualFrameBuffer();
        break;

        case 'b': PrintBackingBuffer();
        break;
        
        case 'o': DrawBuffer();
        break;

        case 'x': Reset6502();
        break;

        case 'h':{
            Serial.println("Menu System");
            Serial.println("n - Single step the slow clock");
            Serial.println("m - Single step the main clock");
            Serial.println("s - Print System Info");
            Serial.println("r - Perform RNG code manually");
            Serial.println("f - Perform Framebuffer code manually");
            Serial.println("b - Print out the backing buffer");
            Serial.println("o - Output the backing buffer");
            Serial.println("c - TurnClockOn");
            Serial.println("x - Reset 6502");
            Serial.println("h - help system");
        }
        break;
    }
}


