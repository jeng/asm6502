EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "M6502 CPU Card"
Date "2022-10-01"
Rev "1"
Comp "Jeremy English jhe@jeremyenglish.org"
Comment1 "Hardware version of the 6502 XScreenSaver Module"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J1
U 1 1 63389230
P 2650 3300
F 0 "J1" H 2700 4417 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 2700 4326 50  0000 C CNN
F 2 "m6502:PinHeader_2x20_P2.54mm_Horizontal_Counter_Clockwise" H 2650 3300 50  0001 C CNN
F 3 "~" H 2650 3300 50  0001 C CNN
	1    2650 3300
	1    0    0    -1  
$EndComp
Entry Bus Bus
	3250 4600 3350 4700
Entry Wire Line
	2250 2300 2350 2400
Entry Wire Line
	2250 2400 2350 2500
Entry Wire Line
	2250 2500 2350 2600
Entry Wire Line
	2250 2600 2350 2700
Entry Wire Line
	2250 2700 2350 2800
Entry Wire Line
	2250 2800 2350 2900
Entry Wire Line
	2250 2900 2350 3000
Entry Wire Line
	2250 3000 2350 3100
Entry Wire Line
	2250 3100 2350 3200
Entry Wire Line
	2250 3200 2350 3300
Entry Wire Line
	2250 3300 2350 3400
Entry Wire Line
	2250 3400 2350 3500
Entry Wire Line
	2250 3500 2350 3600
Entry Wire Line
	2250 3600 2350 3700
Entry Wire Line
	2250 3700 2350 3800
Entry Wire Line
	2250 3800 2350 3900
Entry Wire Line
	2250 3900 2350 4000
Entry Wire Line
	2250 4000 2350 4100
Wire Wire Line
	2350 2400 2450 2400
Wire Wire Line
	2350 2500 2450 2500
Wire Wire Line
	2350 2600 2450 2600
Wire Wire Line
	2350 2700 2450 2700
Wire Wire Line
	2350 2800 2450 2800
Wire Wire Line
	2350 2900 2450 2900
Wire Wire Line
	2350 3000 2450 3000
Wire Wire Line
	2350 3100 2450 3100
Wire Wire Line
	2350 3200 2450 3200
Wire Wire Line
	2350 3300 2450 3300
Wire Wire Line
	2350 3400 2450 3400
Wire Wire Line
	2350 3500 2450 3500
Wire Wire Line
	2350 3600 2450 3600
Wire Wire Line
	2350 3700 2450 3700
Wire Wire Line
	2350 3800 2450 3800
Wire Wire Line
	2350 3900 2450 3900
Wire Wire Line
	2350 4000 2450 4000
Wire Wire Line
	2350 4100 2450 4100
Text Label 2350 2400 0    50   ~ 0
GND
Text Label 2350 2500 0    50   ~ 0
RESET
Text Label 2350 2600 0    50   ~ 0
A0
Text Label 2350 2700 0    50   ~ 0
A1
Text Label 2350 2800 0    50   ~ 0
A2
Text Label 2350 2900 0    50   ~ 0
A3
Text Label 2350 3000 0    50   ~ 0
A4
Text Label 2350 3100 0    50   ~ 0
A5
Text Label 2350 3200 0    50   ~ 0
A6
Text Label 2350 3300 0    50   ~ 0
A7
Text Label 2350 3400 0    50   ~ 0
A8
Text Label 2350 3500 0    50   ~ 0
A9
Text Label 2350 3600 0    50   ~ 0
A10
Text Label 2350 3700 0    50   ~ 0
A11
Text Label 2350 3800 0    50   ~ 0
A12
Text Label 2350 3900 0    50   ~ 0
A13
Text Label 2350 4000 0    50   ~ 0
A14
Text Label 2350 4100 0    50   ~ 0
A15
Text Label 2350 4200 0    50   ~ 0
RAMCS
Text Label 2350 4300 0    50   ~ 0
ROMCS
Entry Wire Line
	3150 2400 3250 2300
Entry Wire Line
	3150 2500 3250 2400
Entry Wire Line
	3150 2600 3250 2500
Entry Wire Line
	3150 2700 3250 2600
Entry Wire Line
	3150 2800 3250 2700
Entry Wire Line
	3150 2900 3250 2800
Entry Wire Line
	3150 3000 3250 2900
Entry Wire Line
	3150 3100 3250 3000
Entry Wire Line
	3150 3200 3250 3100
Entry Wire Line
	3150 3300 3250 3200
Entry Wire Line
	3150 3400 3250 3300
Entry Wire Line
	3150 3500 3250 3400
Entry Wire Line
	3150 3900 3250 3800
Entry Wire Line
	3150 4000 3250 3900
Entry Wire Line
	3150 4100 3250 4000
Wire Wire Line
	2950 2400 3150 2400
Wire Wire Line
	2950 2500 3150 2500
Wire Wire Line
	2950 2600 3150 2600
Wire Wire Line
	2950 2700 3150 2700
Wire Wire Line
	2950 2800 3150 2800
Wire Wire Line
	2950 2900 3150 2900
Wire Wire Line
	2950 3000 3150 3000
Wire Wire Line
	2950 3100 3150 3100
Wire Wire Line
	2950 3200 3150 3200
Wire Wire Line
	2950 3300 3150 3300
Wire Wire Line
	2950 3400 3150 3400
Wire Wire Line
	2950 3500 3150 3500
Wire Wire Line
	2950 3900 3150 3900
Wire Wire Line
	2950 4000 3150 4000
Wire Wire Line
	2950 4100 3150 4100
Text Label 2950 2400 0    50   ~ 0
GND
Text Label 2950 2500 0    50   ~ 0
VCC
Text Label 2950 2600 0    50   ~ 0
D0
Text Label 2950 2700 0    50   ~ 0
D1
Text Label 2950 2800 0    50   ~ 0
D2
Text Label 2950 2900 0    50   ~ 0
D3
Text Label 2950 3000 0    50   ~ 0
D4
Text Label 2950 3100 0    50   ~ 0
D5
Text Label 2950 3200 0    50   ~ 0
D6
Text Label 2950 3300 0    50   ~ 0
D7
Text Label 2950 3400 0    50   ~ 0
RW
Text Label 2950 3500 0    50   ~ 0
CLK
Text Label 2950 3600 0    50   ~ 0
FCLK
Text Label 2950 3700 0    50   ~ 0
SCLK
Text Label 2950 3800 0    50   ~ 0
FRMBUF
Text Label 2950 3900 0    50   ~ 0
IRQ
Text Label 2950 4000 0    50   ~ 0
PHI1out
Text Label 2950 4100 0    50   ~ 0
PHI2out
Text Label 2950 4200 0    50   ~ 0
RNG
Entry Bus Bus
	6950 4600 7050 4700
Entry Bus Bus
	4200 4600 4300 4700
Entry Wire Line
	4200 3100 4300 3200
Entry Wire Line
	4200 3200 4300 3300
Entry Wire Line
	4200 3300 4300 3400
Entry Wire Line
	4200 3400 4300 3500
Entry Wire Line
	4200 3500 4300 3600
Entry Wire Line
	4200 3600 4300 3700
Entry Wire Line
	4200 3700 4300 3800
Entry Wire Line
	4200 3800 4300 3900
Entry Wire Line
	4200 3900 4300 4000
Entry Wire Line
	4200 4000 4300 4100
Entry Wire Line
	4200 4100 4300 4200
Entry Wire Line
	4200 4200 4300 4300
Text Label 4650 3200 0    50   ~ 0
A0
Text Label 4650 3300 0    50   ~ 0
A1
Text Label 4650 3400 0    50   ~ 0
A2
Text Label 4650 3500 0    50   ~ 0
A3
Text Label 4650 3600 0    50   ~ 0
A4
Text Label 4650 3700 0    50   ~ 0
A5
Text Label 4650 3800 0    50   ~ 0
A6
Text Label 4650 3900 0    50   ~ 0
A7
Text Label 4650 4000 0    50   ~ 0
A8
Text Label 4650 4100 0    50   ~ 0
A9
Text Label 4650 4200 0    50   ~ 0
A10
Text Label 4650 4300 0    50   ~ 0
A11
Entry Wire Line
	6850 3100 6950 3000
Entry Wire Line
	6850 3200 6950 3100
Entry Wire Line
	6850 3300 6950 3200
Entry Wire Line
	6850 3400 6950 3300
Entry Wire Line
	6850 3500 6950 3400
Entry Wire Line
	6850 3600 6950 3500
Entry Wire Line
	6850 3700 6950 3600
Entry Wire Line
	6850 3800 6950 3700
Entry Wire Line
	6850 3900 6950 3800
Entry Wire Line
	6850 4000 6950 3900
Entry Wire Line
	6850 4100 6950 4000
Entry Wire Line
	6850 4200 6950 4100
Wire Wire Line
	6200 3100 6850 3100
Wire Wire Line
	6200 3200 6850 3200
Wire Wire Line
	6200 3400 6850 3400
Wire Wire Line
	6200 3500 6850 3500
Wire Wire Line
	6200 3600 6850 3600
Wire Wire Line
	6200 3700 6850 3700
Wire Wire Line
	6200 3800 6850 3800
Wire Wire Line
	6200 3900 6850 3900
Wire Wire Line
	6200 4100 6850 4100
Wire Wire Line
	6200 4200 6850 4200
Text Label 6250 3100 0    50   ~ 0
D0
Text Label 6250 3200 0    50   ~ 0
D1
Text Label 6250 3300 0    50   ~ 0
D2
Text Label 6250 3400 0    50   ~ 0
D3
Text Label 6250 3500 0    50   ~ 0
D4
Text Label 6250 3600 0    50   ~ 0
D5
Text Label 6250 3700 0    50   ~ 0
D6
Text Label 6250 3800 0    50   ~ 0
D7
Text Label 6250 3900 0    50   ~ 0
A15
Text Label 6250 4000 0    50   ~ 0
A14
Text Label 6250 4100 0    50   ~ 0
A13
Text Label 6250 4200 0    50   ~ 0
A12
Entry Wire Line
	6850 2400 6950 2300
Entry Wire Line
	6850 2500 6950 2400
Entry Wire Line
	6850 3000 6950 2900
Entry Wire Line
	6850 3100 6950 3000
Wire Wire Line
	6200 2400 6850 2400
Wire Wire Line
	6200 2500 6850 2500
Wire Wire Line
	6200 2700 6850 2700
Wire Wire Line
	6200 3000 6850 3000
Text Label 6200 2400 0    50   ~ 0
RESET
Text Label 6200 2500 0    50   ~ 0
PHI2out
Entry Wire Line
	6850 2700 6950 2600
Text Label 6200 2700 0    50   ~ 0
CLK
Entry Wire Line
	4200 2400 4300 2500
Entry Wire Line
	4200 2500 4300 2600
Entry Wire Line
	4200 2600 4300 2700
Text Label 4650 2600 0    50   ~ 0
PHI1out
Text Label 4650 2700 0    50   ~ 0
IRQ
NoConn ~ 4800 3000
NoConn ~ 6200 2600
NoConn ~ 4800 2400
Entry Wire Line
	4200 4400 4300 4500
Text Label 4300 4500 0    50   ~ 0
GND
Entry Wire Line
	4200 2100 4300 2200
Text Label 4300 2200 0    50   ~ 0
VCC
$Comp
L Device:R R1
U 1 1 6342AFA2
P 4550 2500
F 0 "R1" V 4343 2500 50  0000 C CNN
F 1 "1k" V 4434 2500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4480 2500 50  0001 C CNN
F 3 "~" H 4550 2500 50  0001 C CNN
	1    4550 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 2200 4600 2200
Wire Wire Line
	4300 2500 4400 2500
Wire Wire Line
	4700 2500 4800 2500
Wire Wire Line
	4300 2700 4800 2700
Wire Wire Line
	4300 3200 4800 3200
Wire Wire Line
	4300 3300 4800 3300
Wire Wire Line
	4300 3400 4800 3400
Wire Wire Line
	4300 3500 4800 3500
Wire Wire Line
	4300 3600 4800 3600
Wire Wire Line
	4300 3700 4800 3700
Wire Wire Line
	4300 3800 4800 3800
Wire Wire Line
	4300 3900 4800 3900
Wire Wire Line
	4300 4100 4800 4100
Wire Wire Line
	4300 4200 4800 4200
Wire Wire Line
	4300 4300 4800 4300
Wire Wire Line
	4300 4500 4650 4500
Entry Wire Line
	4200 2800 4300 2900
Wire Wire Line
	4300 2900 4800 2900
Text Label 4650 2900 0    50   ~ 0
VCC
Wire Wire Line
	6200 2800 6850 2800
Entry Wire Line
	6850 2800 6950 2700
Text Label 6200 2800 0    50   ~ 0
VCC
Text Label 6250 3000 0    50   ~ 0
RW
NoConn ~ 2950 3600
NoConn ~ 2950 3700
NoConn ~ 2950 3800
NoConn ~ 2950 4200
NoConn ~ 2950 4300
NoConn ~ 2450 4300
NoConn ~ 2450 4200
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 633BE01C
P 4900 2200
F 0 "#FLG0101" H 4900 2275 50  0001 C CNN
F 1 "PWR_FLAG" H 4900 2373 50  0000 C CNN
F 2 "" H 4900 2200 50  0001 C CNN
F 3 "~" H 4900 2200 50  0001 C CNN
	1    4900 2200
	1    0    0    -1  
$EndComp
Connection ~ 4900 2200
Wire Wire Line
	4900 2200 5200 2200
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 633BE7E3
P 4900 4500
F 0 "#FLG0102" H 4900 4575 50  0001 C CNN
F 1 "PWR_FLAG" H 4900 4673 50  0000 C CNN
F 2 "" H 4900 4500 50  0001 C CNN
F 3 "~" H 4900 4500 50  0001 C CNN
	1    4900 4500
	-1   0    0    1   
$EndComp
Connection ~ 4900 4500
Wire Wire Line
	4900 4500 5200 4500
Wire Wire Line
	4300 4000 4800 4000
Wire Wire Line
	6200 4000 6850 4000
Wire Wire Line
	4300 2600 4800 2600
Wire Wire Line
	6200 3300 6850 3300
$Comp
L 6502:W65C02 U1
U 1 1 633874FB
P 5500 3300
F 0 "U1" H 5500 4603 60  0000 C CNN
F 1 "W65C02" H 5500 4497 60  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 5000 3500 60  0001 C CNN
F 3 "" H 5000 3500 60  0000 C CNN
	1    5500 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 633C76FB
P 4600 2200
F 0 "#PWR0101" H 4600 2050 50  0001 C CNN
F 1 "+5V" H 4615 2373 50  0000 C CNN
F 2 "" H 4600 2200 50  0001 C CNN
F 3 "" H 4600 2200 50  0001 C CNN
	1    4600 2200
	1    0    0    -1  
$EndComp
Connection ~ 4600 2200
Wire Wire Line
	4600 2200 4900 2200
$Comp
L power:GND #PWR0102
U 1 1 633C804D
P 4650 4500
F 0 "#PWR0102" H 4650 4250 50  0001 C CNN
F 1 "GND" H 4655 4327 50  0000 C CNN
F 2 "" H 4650 4500 50  0001 C CNN
F 3 "" H 4650 4500 50  0001 C CNN
	1    4650 4500
	1    0    0    -1  
$EndComp
Connection ~ 4650 4500
Wire Wire Line
	4650 4500 4900 4500
Text Label 4300 2500 0    50   ~ 0
VCC
$Comp
L Device:C C1
U 1 1 633B9BE4
P 5450 1550
F 0 "C1" V 5198 1550 50  0000 C CNN
F 1 "0.1uF" V 5289 1550 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5488 1400 50  0001 C CNN
F 3 "~" H 5450 1550 50  0001 C CNN
	1    5450 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 2200 5200 1550
Wire Wire Line
	5200 1550 5300 1550
Connection ~ 5200 2200
Wire Wire Line
	5200 2200 5500 2200
Wire Wire Line
	5200 4500 5200 4600
Wire Wire Line
	7150 4600 7150 1550
Wire Wire Line
	7150 1550 5600 1550
Wire Wire Line
	5200 4600 7150 4600
Wire Bus Line
	2250 4700 7050 4700
Wire Bus Line
	6950 2200 6950 4600
Wire Bus Line
	4200 2100 4200 4600
Wire Bus Line
	3250 2250 3250 4600
Wire Bus Line
	2250 2250 2250 4700
Connection ~ 5200 4500
Wire Wire Line
	5200 4500 5500 4500
$EndSCHEMATC
