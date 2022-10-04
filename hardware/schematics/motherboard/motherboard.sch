EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "M6502 Motherboard"
Date "2022-10-01"
Rev "1"
Comp "Jeremy English jhe@jeremyenglish.org"
Comment1 "Hardware version of the 6502 XScreenSaver Module"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J2
U 1 1 6331A348
P 2200 3700
F 0 "J2" H 2250 4817 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 2350 2400 50  0000 C CNN
F 2 "motherboard:PinSocket_2x20_P2.54mm_Vertical_Counter_Clockwise" H 2200 3700 50  0001 C CNN
F 3 "~" H 2200 3700 50  0001 C CNN
	1    2200 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 63326677
P 2250 2300
F 0 "C1" H 2365 2346 50  0000 L CNN
F 1 "0.1uF" H 2365 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2288 2150 50  0001 C CNN
F 3 "~" H 2250 2300 50  0001 C CNN
	1    2250 2300
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Barrel_Jack J1
U 1 1 6332B9A7
P 900 2100
F 0 "J1" H 957 2425 50  0000 C CNN
F 1 "Barrel_Jack" H 957 2334 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_CUI_PJ-102AH_Horizontal" H 950 2060 50  0001 C CNN
F 3 "~" H 950 2060 50  0001 C CNN
	1    900  2100
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0101
U 1 1 6332D4BC
P 1250 2350
F 0 "#PWR0101" H 1250 2100 50  0001 C CNN
F 1 "Earth" H 1250 2200 50  0001 C CNN
F 2 "" H 1250 2350 50  0001 C CNN
F 3 "~" H 1250 2350 50  0001 C CNN
	1    1250 2350
	1    0    0    -1  
$EndComp
Entry Wire Line
	1750 2900 1850 3000
Entry Wire Line
	1750 3000 1850 3100
Entry Wire Line
	1750 3100 1850 3200
Entry Wire Line
	1750 3200 1850 3300
Entry Wire Line
	1750 3300 1850 3400
Wire Wire Line
	1850 3000 2000 3000
Wire Wire Line
	1850 3100 2000 3100
Wire Wire Line
	1850 3200 2000 3200
Wire Wire Line
	1850 3300 2000 3300
Wire Wire Line
	1850 3400 2000 3400
Entry Bus Bus
	1650 2750 1750 2850
Entry Wire Line
	1550 2200 1650 2300
Entry Wire Line
	1550 2000 1650 2100
Wire Wire Line
	1550 2200 1450 2200
Wire Wire Line
	1250 2350 1250 2200
Connection ~ 1250 2200
Text Label 1350 2200 0    50   ~ 0
GND
Text Label 1350 2000 0    50   ~ 0
VCC
Entry Wire Line
	1750 2800 1850 2900
Entry Wire Line
	1750 2700 1850 2800
Wire Wire Line
	2000 2800 1850 2800
Wire Wire Line
	2000 2900 1850 2900
Text Label 1850 2800 0    50   ~ 0
GND
Text Label 1850 2900 0    50   ~ 0
RESET
Entry Bus Bus
	2800 4800 2900 4900
Entry Wire Line
	2700 2800 2800 2700
Entry Wire Line
	2700 2900 2800 2800
Entry Wire Line
	2700 3000 2800 2900
Entry Wire Line
	2700 3100 2800 3000
Entry Wire Line
	2700 3200 2800 3100
Entry Wire Line
	2700 3300 2800 3200
Entry Wire Line
	2700 3400 2800 3300
Entry Wire Line
	2700 3500 2800 3400
Entry Wire Line
	2700 3600 2800 3500
Entry Wire Line
	2700 3700 2800 3600
Entry Wire Line
	2700 3800 2800 3700
Entry Wire Line
	2700 3900 2800 3800
Entry Wire Line
	2700 4000 2800 3900
Entry Wire Line
	2700 4100 2800 4000
Entry Wire Line
	2700 4200 2800 4100
Entry Wire Line
	2700 4300 2800 4200
Entry Wire Line
	2700 4400 2800 4300
Entry Wire Line
	2700 4500 2800 4400
Entry Wire Line
	2700 4600 2800 4500
Entry Wire Line
	1750 3400 1850 3500
Entry Wire Line
	1750 3500 1850 3600
Entry Wire Line
	1750 3600 1850 3700
Entry Wire Line
	1750 3700 1850 3800
Entry Wire Line
	1750 3800 1850 3900
Entry Wire Line
	1750 3900 1850 4000
Entry Wire Line
	1750 4000 1850 4100
Entry Wire Line
	1750 4100 1850 4200
Entry Wire Line
	1750 4200 1850 4300
Entry Wire Line
	1750 4300 1850 4400
Entry Wire Line
	1750 4400 1850 4500
Entry Wire Line
	1750 4500 1850 4600
Entry Wire Line
	1750 4600 1850 4700
Wire Wire Line
	1850 3500 2000 3500
Wire Wire Line
	1850 3600 2000 3600
Wire Wire Line
	1850 3700 2000 3700
Wire Wire Line
	1850 3800 2000 3800
Wire Wire Line
	1850 3900 2000 3900
Wire Wire Line
	1850 4000 2000 4000
Wire Wire Line
	1850 4100 2000 4100
Wire Wire Line
	1850 4200 2000 4200
Wire Wire Line
	1850 4300 2000 4300
Wire Wire Line
	1850 4400 2000 4400
Wire Wire Line
	1850 4500 2000 4500
Wire Wire Line
	1850 4600 2000 4600
Wire Wire Line
	1850 4700 2000 4700
Wire Wire Line
	2500 2800 2700 2800
Wire Wire Line
	2500 2900 2700 2900
Wire Wire Line
	2500 3000 2700 3000
Wire Wire Line
	2500 3100 2700 3100
Wire Wire Line
	2500 3200 2700 3200
Wire Wire Line
	2500 3300 2700 3300
Wire Wire Line
	2500 3400 2700 3400
Wire Wire Line
	2500 3500 2700 3500
Wire Wire Line
	2500 3600 2700 3600
Wire Wire Line
	2500 3700 2700 3700
Wire Wire Line
	2500 3800 2700 3800
Wire Wire Line
	2500 3900 2700 3900
Wire Wire Line
	2500 4000 2700 4000
Wire Wire Line
	2500 4100 2700 4100
Wire Wire Line
	2500 4200 2700 4200
Wire Wire Line
	2500 4300 2700 4300
Wire Wire Line
	2500 4400 2700 4400
Wire Wire Line
	2500 4500 2700 4500
Wire Wire Line
	2500 4600 2700 4600
Text Label 2500 2800 0    50   ~ 0
GND
Text Label 2500 2900 0    50   ~ 0
VCC
Text Label 1900 3000 0    50   ~ 0
A0
Text Label 1900 3100 0    50   ~ 0
A1
Text Label 1900 3200 0    50   ~ 0
A2
Text Label 1900 3300 0    50   ~ 0
A3
Text Label 1900 3400 0    50   ~ 0
A4
Text Label 1900 3500 0    50   ~ 0
A5
Text Label 1900 3600 0    50   ~ 0
A6
Text Label 1900 3700 0    50   ~ 0
A7
Text Label 1900 3800 0    50   ~ 0
A8
Text Label 1900 3900 0    50   ~ 0
A9
Text Label 1900 4000 0    50   ~ 0
A10
Text Label 1900 4100 0    50   ~ 0
A11
Text Label 1900 4200 0    50   ~ 0
A12
Text Label 1900 4300 0    50   ~ 0
A13
Text Label 1900 4400 0    50   ~ 0
A14
Text Label 1900 4500 0    50   ~ 0
A15
Text Label 2500 3000 0    50   ~ 0
D0
Text Label 2500 3100 0    50   ~ 0
D1
Text Label 2500 3200 0    50   ~ 0
D2
Text Label 2500 3300 0    50   ~ 0
D3
Text Label 2500 3400 0    50   ~ 0
D4
Text Label 2500 3500 0    50   ~ 0
D5
Text Label 2500 3600 0    50   ~ 0
D6
Text Label 2500 3700 0    50   ~ 0
D7
Text Label 2500 3800 0    50   ~ 0
RW
Text Label 2500 3900 0    50   ~ 0
CLK
Text Label 2500 4000 0    50   ~ 0
FCLK
Text Label 2500 4100 0    50   ~ 0
SCLK
Text Label 2500 4200 0    50   ~ 0
FRMBUF
Text Label 1900 4600 0    50   ~ 0
RAMCS
Text Label 1900 4700 0    50   ~ 0
ROMCS
Entry Wire Line
	1650 2400 1750 2300
Entry Wire Line
	1650 2500 1750 2400
Wire Wire Line
	1750 2300 2100 2300
Wire Wire Line
	1750 2400 2100 2400
Wire Wire Line
	2100 2400 2100 2450
Wire Wire Line
	2100 2450 2400 2450
Wire Wire Line
	2400 2450 2400 2300
Text Label 1800 2300 0    50   ~ 0
VCC
Text Label 1800 2400 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J4
U 1 1 633C504D
P 4000 3700
F 0 "J4" H 4050 4817 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 4200 2400 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 4000 3700 50  0001 C CNN
F 3 "~" H 4000 3700 50  0001 C CNN
	1    4000 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 633C5053
P 4050 2300
F 0 "C2" H 4165 2346 50  0000 L CNN
F 1 "0.1uF" H 4165 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4088 2150 50  0001 C CNN
F 3 "~" H 4050 2300 50  0001 C CNN
	1    4050 2300
	0    -1   -1   0   
$EndComp
Entry Wire Line
	3550 2900 3650 3000
Entry Wire Line
	3550 3000 3650 3100
Entry Wire Line
	3550 3100 3650 3200
Entry Wire Line
	3550 3200 3650 3300
Entry Wire Line
	3550 3300 3650 3400
Wire Wire Line
	3650 3000 3800 3000
Wire Wire Line
	3650 3100 3800 3100
Wire Wire Line
	3650 3200 3800 3200
Wire Wire Line
	3650 3300 3800 3300
Wire Wire Line
	3650 3400 3800 3400
Entry Bus Bus
	3450 2750 3550 2850
Entry Wire Line
	3550 2800 3650 2900
Entry Wire Line
	3550 2700 3650 2800
Wire Wire Line
	3800 2800 3650 2800
Wire Wire Line
	3800 2900 3650 2900
Text Label 3650 2800 0    50   ~ 0
GND
Text Label 3650 2900 0    50   ~ 0
RESET
Entry Bus Bus
	4600 4800 4700 4900
Entry Wire Line
	4500 2800 4600 2700
Entry Wire Line
	4500 2900 4600 2800
Entry Wire Line
	4500 3000 4600 2900
Entry Wire Line
	4500 3100 4600 3000
Entry Wire Line
	4500 3200 4600 3100
Entry Wire Line
	4500 3300 4600 3200
Entry Wire Line
	4500 3400 4600 3300
Entry Wire Line
	4500 3500 4600 3400
Entry Wire Line
	4500 3600 4600 3500
Entry Wire Line
	4500 3700 4600 3600
Entry Wire Line
	4500 3800 4600 3700
Entry Wire Line
	4500 3900 4600 3800
Entry Wire Line
	4500 4000 4600 3900
Entry Wire Line
	4500 4100 4600 4000
Entry Wire Line
	4500 4200 4600 4100
Entry Wire Line
	4500 4300 4600 4200
Entry Wire Line
	4500 4400 4600 4300
Entry Wire Line
	4500 4500 4600 4400
Entry Wire Line
	4500 4600 4600 4500
Entry Wire Line
	3550 3400 3650 3500
Entry Wire Line
	3550 3500 3650 3600
Entry Wire Line
	3550 3600 3650 3700
Entry Wire Line
	3550 3700 3650 3800
Entry Wire Line
	3550 3800 3650 3900
Entry Wire Line
	3550 3900 3650 4000
Entry Wire Line
	3550 4000 3650 4100
Entry Wire Line
	3550 4100 3650 4200
Entry Wire Line
	3550 4200 3650 4300
Entry Wire Line
	3550 4300 3650 4400
Entry Wire Line
	3550 4400 3650 4500
Entry Wire Line
	3550 4500 3650 4600
Entry Wire Line
	3550 4600 3650 4700
Wire Wire Line
	3650 3500 3800 3500
Wire Wire Line
	3650 3600 3800 3600
Wire Wire Line
	3650 3700 3800 3700
Wire Wire Line
	3650 3800 3800 3800
Wire Wire Line
	3650 3900 3800 3900
Wire Wire Line
	3650 4000 3800 4000
Wire Wire Line
	3650 4100 3800 4100
Wire Wire Line
	3650 4200 3800 4200
Wire Wire Line
	3650 4300 3800 4300
Wire Wire Line
	3650 4400 3800 4400
Wire Wire Line
	3650 4500 3800 4500
Wire Wire Line
	3650 4600 3800 4600
Wire Wire Line
	3650 4700 3800 4700
Wire Wire Line
	4300 2800 4500 2800
Wire Wire Line
	4300 2900 4500 2900
Wire Wire Line
	4300 3000 4500 3000
Wire Wire Line
	4300 3100 4500 3100
Wire Wire Line
	4300 3200 4500 3200
Wire Wire Line
	4300 3300 4500 3300
Wire Wire Line
	4300 3400 4500 3400
Wire Wire Line
	4300 3500 4500 3500
Wire Wire Line
	4300 3600 4500 3600
Wire Wire Line
	4300 3700 4500 3700
Wire Wire Line
	4300 3800 4500 3800
Wire Wire Line
	4300 3900 4500 3900
Wire Wire Line
	4300 4000 4500 4000
Wire Wire Line
	4300 4100 4500 4100
Wire Wire Line
	4300 4200 4500 4200
Wire Wire Line
	4300 4300 4500 4300
Wire Wire Line
	4300 4400 4500 4400
Wire Wire Line
	4300 4500 4500 4500
Wire Wire Line
	4300 4600 4500 4600
Text Label 4300 2800 0    50   ~ 0
GND
Text Label 4300 2900 0    50   ~ 0
VCC
Text Label 3700 3000 0    50   ~ 0
A0
Text Label 3700 3100 0    50   ~ 0
A1
Text Label 3700 3200 0    50   ~ 0
A2
Text Label 3700 3300 0    50   ~ 0
A3
Text Label 3700 3400 0    50   ~ 0
A4
Text Label 3700 3500 0    50   ~ 0
A5
Text Label 3700 3600 0    50   ~ 0
A6
Text Label 3700 3700 0    50   ~ 0
A7
Text Label 3700 3800 0    50   ~ 0
A8
Text Label 3700 3900 0    50   ~ 0
A9
Text Label 3700 4000 0    50   ~ 0
A10
Text Label 3700 4100 0    50   ~ 0
A11
Text Label 3700 4200 0    50   ~ 0
A12
Text Label 3700 4300 0    50   ~ 0
A13
Text Label 3700 4400 0    50   ~ 0
A14
Text Label 3700 4500 0    50   ~ 0
A15
Text Label 4300 3000 0    50   ~ 0
D0
Text Label 4300 3100 0    50   ~ 0
D1
Text Label 4300 3200 0    50   ~ 0
D2
Text Label 4300 3300 0    50   ~ 0
D3
Text Label 4300 3400 0    50   ~ 0
D4
Text Label 4300 3500 0    50   ~ 0
D5
Text Label 4300 3600 0    50   ~ 0
D6
Text Label 4300 3700 0    50   ~ 0
D7
Text Label 4300 3800 0    50   ~ 0
RW
Text Label 4300 3900 0    50   ~ 0
CLK
Text Label 4300 4000 0    50   ~ 0
FCLK
Text Label 4300 4100 0    50   ~ 0
SCLK
Text Label 4300 4200 0    50   ~ 0
FRMBUF
Text Label 3700 4600 0    50   ~ 0
RAMCS
Text Label 3700 4700 0    50   ~ 0
ROMCS
Entry Wire Line
	3450 2500 3550 2400
Wire Wire Line
	3550 2300 3900 2300
Wire Wire Line
	3550 2400 3900 2400
Wire Wire Line
	3900 2400 3900 2450
Wire Wire Line
	3900 2450 4200 2450
Wire Wire Line
	4200 2450 4200 2300
Text Label 3600 2300 0    50   ~ 0
VCC
Text Label 3600 2400 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J5
U 1 1 633CDD28
P 5950 3700
F 0 "J5" H 6000 4817 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 6100 2400 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 5950 3700 50  0001 C CNN
F 3 "~" H 5950 3700 50  0001 C CNN
	1    5950 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 633CDD2E
P 6000 2300
F 0 "C3" H 6115 2346 50  0000 L CNN
F 1 "0.1uF" H 6115 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6038 2150 50  0001 C CNN
F 3 "~" H 6000 2300 50  0001 C CNN
	1    6000 2300
	0    -1   -1   0   
$EndComp
Entry Wire Line
	5500 2900 5600 3000
Entry Wire Line
	5500 3000 5600 3100
Entry Wire Line
	5500 3100 5600 3200
Entry Wire Line
	5500 3200 5600 3300
Entry Wire Line
	5500 3300 5600 3400
Wire Wire Line
	5600 3000 5750 3000
Wire Wire Line
	5600 3100 5750 3100
Wire Wire Line
	5600 3200 5750 3200
Wire Wire Line
	5600 3300 5750 3300
Wire Wire Line
	5600 3400 5750 3400
Entry Bus Bus
	5400 2750 5500 2850
Entry Wire Line
	5500 2800 5600 2900
Entry Wire Line
	5500 2700 5600 2800
Wire Wire Line
	5750 2800 5600 2800
Wire Wire Line
	5750 2900 5600 2900
Text Label 5600 2800 0    50   ~ 0
GND
Text Label 5600 2900 0    50   ~ 0
RESET
Entry Bus Bus
	6550 4800 6650 4900
Entry Wire Line
	6450 2800 6550 2700
Entry Wire Line
	6450 2900 6550 2800
Entry Wire Line
	6450 3000 6550 2900
Entry Wire Line
	6450 3100 6550 3000
Entry Wire Line
	6450 3200 6550 3100
Entry Wire Line
	6450 3300 6550 3200
Entry Wire Line
	6450 3400 6550 3300
Entry Wire Line
	6450 3500 6550 3400
Entry Wire Line
	6450 3600 6550 3500
Entry Wire Line
	6450 3700 6550 3600
Entry Wire Line
	6450 3800 6550 3700
Entry Wire Line
	6450 3900 6550 3800
Entry Wire Line
	6450 4000 6550 3900
Entry Wire Line
	6450 4100 6550 4000
Entry Wire Line
	6450 4200 6550 4100
Entry Wire Line
	6450 4300 6550 4200
Entry Wire Line
	6450 4400 6550 4300
Entry Wire Line
	6450 4500 6550 4400
Entry Wire Line
	6450 4600 6550 4500
Entry Wire Line
	5500 3400 5600 3500
Entry Wire Line
	5500 3500 5600 3600
Entry Wire Line
	5500 3600 5600 3700
Entry Wire Line
	5500 3700 5600 3800
Entry Wire Line
	5500 3800 5600 3900
Entry Wire Line
	5500 3900 5600 4000
Entry Wire Line
	5500 4000 5600 4100
Entry Wire Line
	5500 4100 5600 4200
Entry Wire Line
	5500 4200 5600 4300
Entry Wire Line
	5500 4300 5600 4400
Entry Wire Line
	5500 4400 5600 4500
Entry Wire Line
	5500 4500 5600 4600
Entry Wire Line
	5500 4600 5600 4700
Wire Wire Line
	5600 3500 5750 3500
Wire Wire Line
	5600 3600 5750 3600
Wire Wire Line
	5600 3700 5750 3700
Wire Wire Line
	5600 3800 5750 3800
Wire Wire Line
	5600 3900 5750 3900
Wire Wire Line
	5600 4000 5750 4000
Wire Wire Line
	5600 4100 5750 4100
Wire Wire Line
	5600 4200 5750 4200
Wire Wire Line
	5600 4300 5750 4300
Wire Wire Line
	5600 4400 5750 4400
Wire Wire Line
	5600 4500 5750 4500
Wire Wire Line
	5600 4600 5750 4600
Wire Wire Line
	5600 4700 5750 4700
Wire Wire Line
	6250 2800 6450 2800
Wire Wire Line
	6250 2900 6450 2900
Wire Wire Line
	6250 3000 6450 3000
Wire Wire Line
	6250 3100 6450 3100
Wire Wire Line
	6250 3200 6450 3200
Wire Wire Line
	6250 3300 6450 3300
Wire Wire Line
	6250 3400 6450 3400
Wire Wire Line
	6250 3500 6450 3500
Wire Wire Line
	6250 3600 6450 3600
Wire Wire Line
	6250 3700 6450 3700
Wire Wire Line
	6250 3800 6450 3800
Wire Wire Line
	6250 3900 6450 3900
Wire Wire Line
	6250 4000 6450 4000
Wire Wire Line
	6250 4100 6450 4100
Wire Wire Line
	6250 4200 6450 4200
Wire Wire Line
	6250 4300 6450 4300
Wire Wire Line
	6250 4400 6450 4400
Wire Wire Line
	6250 4500 6450 4500
Wire Wire Line
	6250 4600 6450 4600
Text Label 6250 2800 0    50   ~ 0
GND
Text Label 6250 2900 0    50   ~ 0
VCC
Text Label 5650 3000 0    50   ~ 0
A0
Text Label 5650 3100 0    50   ~ 0
A1
Text Label 5650 3200 0    50   ~ 0
A2
Text Label 5650 3300 0    50   ~ 0
A3
Text Label 5650 3400 0    50   ~ 0
A4
Text Label 5650 3500 0    50   ~ 0
A5
Text Label 5650 3600 0    50   ~ 0
A6
Text Label 5650 3700 0    50   ~ 0
A7
Text Label 5650 3800 0    50   ~ 0
A8
Text Label 5650 3900 0    50   ~ 0
A9
Text Label 5650 4000 0    50   ~ 0
A10
Text Label 5650 4100 0    50   ~ 0
A11
Text Label 5650 4200 0    50   ~ 0
A12
Text Label 5650 4300 0    50   ~ 0
A13
Text Label 5650 4400 0    50   ~ 0
A14
Text Label 5650 4500 0    50   ~ 0
A15
Text Label 6250 3000 0    50   ~ 0
D0
Text Label 6250 3100 0    50   ~ 0
D1
Text Label 6250 3200 0    50   ~ 0
D2
Text Label 6250 3300 0    50   ~ 0
D3
Text Label 6250 3400 0    50   ~ 0
D4
Text Label 6250 3500 0    50   ~ 0
D5
Text Label 6250 3600 0    50   ~ 0
D6
Text Label 6250 3700 0    50   ~ 0
D7
Text Label 6250 3800 0    50   ~ 0
RW
Text Label 6250 3900 0    50   ~ 0
CLK
Text Label 6250 4000 0    50   ~ 0
FCLK
Text Label 6250 4100 0    50   ~ 0
SCLK
Text Label 6250 4200 0    50   ~ 0
FRMBUF
Text Label 5650 4600 0    50   ~ 0
RAMCS
Text Label 5650 4700 0    50   ~ 0
ROMCS
Entry Wire Line
	5400 2400 5500 2300
Entry Wire Line
	5400 2500 5500 2400
Wire Wire Line
	5500 2300 5850 2300
Wire Wire Line
	5500 2400 5850 2400
Wire Wire Line
	5850 2400 5850 2450
Wire Wire Line
	5850 2450 6150 2450
Wire Wire Line
	6150 2450 6150 2300
Text Label 5550 2300 0    50   ~ 0
VCC
Text Label 5550 2400 0    50   ~ 0
GND
$Comp
L Device:C C4
U 1 1 633D9FE2
P 7750 2300
F 0 "C4" H 7865 2346 50  0000 L CNN
F 1 "0.1uF" H 7865 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 7788 2150 50  0001 C CNN
F 3 "~" H 7750 2300 50  0001 C CNN
	1    7750 2300
	0    -1   -1   0   
$EndComp
Entry Wire Line
	7250 2900 7350 3000
Entry Wire Line
	7250 3000 7350 3100
Entry Wire Line
	7250 3100 7350 3200
Entry Wire Line
	7250 3200 7350 3300
Entry Wire Line
	7250 3300 7350 3400
Wire Wire Line
	7350 3000 7500 3000
Wire Wire Line
	7350 3100 7500 3100
Wire Wire Line
	7350 3200 7500 3200
Wire Wire Line
	7350 3300 7500 3300
Wire Wire Line
	7350 3400 7500 3400
Entry Bus Bus
	7150 2750 7250 2850
Entry Wire Line
	7250 2800 7350 2900
Entry Wire Line
	7250 2700 7350 2800
Wire Wire Line
	7500 2800 7350 2800
Wire Wire Line
	7500 2900 7350 2900
Text Label 7350 2800 0    50   ~ 0
GND
Text Label 7350 2900 0    50   ~ 0
RESET
Entry Bus Bus
	8300 4800 8400 4900
Entry Wire Line
	8200 2800 8300 2700
Entry Wire Line
	8200 2900 8300 2800
Entry Wire Line
	8200 3000 8300 2900
Entry Wire Line
	8200 3100 8300 3000
Entry Wire Line
	8200 3200 8300 3100
Entry Wire Line
	8200 3300 8300 3200
Entry Wire Line
	8200 3400 8300 3300
Entry Wire Line
	8200 3500 8300 3400
Entry Wire Line
	8200 3600 8300 3500
Entry Wire Line
	8200 3700 8300 3600
Entry Wire Line
	8200 3800 8300 3700
Entry Wire Line
	8200 3900 8300 3800
Entry Wire Line
	8200 4000 8300 3900
Entry Wire Line
	8200 4100 8300 4000
Entry Wire Line
	8200 4200 8300 4100
Entry Wire Line
	8200 4300 8300 4200
Entry Wire Line
	8200 4400 8300 4300
Entry Wire Line
	8200 4500 8300 4400
Entry Wire Line
	8200 4600 8300 4500
Entry Wire Line
	7250 3400 7350 3500
Entry Wire Line
	7250 3500 7350 3600
Entry Wire Line
	7250 3600 7350 3700
Entry Wire Line
	7250 3700 7350 3800
Entry Wire Line
	7250 3800 7350 3900
Entry Wire Line
	7250 3900 7350 4000
Entry Wire Line
	7250 4000 7350 4100
Entry Wire Line
	7250 4100 7350 4200
Entry Wire Line
	7250 4200 7350 4300
Entry Wire Line
	7250 4300 7350 4400
Entry Wire Line
	7250 4400 7350 4500
Entry Wire Line
	7250 4500 7350 4600
Entry Wire Line
	7250 4600 7350 4700
Wire Wire Line
	7350 3500 7500 3500
Wire Wire Line
	7350 3600 7500 3600
Wire Wire Line
	7350 3700 7500 3700
Wire Wire Line
	7350 3800 7500 3800
Wire Wire Line
	7350 3900 7500 3900
Wire Wire Line
	7350 4000 7500 4000
Wire Wire Line
	7350 4100 7500 4100
Wire Wire Line
	7350 4200 7500 4200
Wire Wire Line
	7350 4300 7500 4300
Wire Wire Line
	7350 4400 7500 4400
Wire Wire Line
	7350 4500 7500 4500
Wire Wire Line
	7350 4600 7500 4600
Wire Wire Line
	8000 2800 8200 2800
Text Label 8000 2800 0    50   ~ 0
GND
Text Label 8000 2900 0    50   ~ 0
VCC
Text Label 7400 3000 0    50   ~ 0
A0
Text Label 7400 3100 0    50   ~ 0
A1
Text Label 7400 3200 0    50   ~ 0
A2
Text Label 7400 3300 0    50   ~ 0
A3
Text Label 7400 3400 0    50   ~ 0
A4
Text Label 7400 3500 0    50   ~ 0
A5
Text Label 7400 3600 0    50   ~ 0
A6
Text Label 7400 3700 0    50   ~ 0
A7
Text Label 7400 3800 0    50   ~ 0
A8
Text Label 7400 3900 0    50   ~ 0
A9
Text Label 7400 4000 0    50   ~ 0
A10
Text Label 7400 4100 0    50   ~ 0
A11
Text Label 7400 4200 0    50   ~ 0
A12
Text Label 7400 4300 0    50   ~ 0
A13
Text Label 7400 4400 0    50   ~ 0
A14
Text Label 7400 4500 0    50   ~ 0
A15
Text Label 8000 3000 0    50   ~ 0
D0
Text Label 8000 3100 0    50   ~ 0
D1
Text Label 8000 3200 0    50   ~ 0
D2
Text Label 8000 3300 0    50   ~ 0
D3
Text Label 8000 3400 0    50   ~ 0
D4
Text Label 8000 3500 0    50   ~ 0
D5
Text Label 8000 3600 0    50   ~ 0
D6
Text Label 8000 3700 0    50   ~ 0
D7
Text Label 8000 3800 0    50   ~ 0
RW
Text Label 8000 3900 0    50   ~ 0
CLK
Text Label 8000 4000 0    50   ~ 0
FCLK
Text Label 8000 4100 0    50   ~ 0
SCLK
Text Label 8000 4200 0    50   ~ 0
FRMBUF
Text Label 7400 4600 0    50   ~ 0
RAMCS
Text Label 7400 4700 0    50   ~ 0
ROMCS
Entry Wire Line
	7150 2400 7250 2300
Entry Wire Line
	7150 2500 7250 2400
Wire Wire Line
	7250 2300 7600 2300
Wire Wire Line
	7250 2400 7600 2400
Wire Wire Line
	7600 2400 7600 2450
Wire Wire Line
	7600 2450 7900 2450
Wire Wire Line
	7900 2450 7900 2300
Text Label 7300 2300 0    50   ~ 0
VCC
Text Label 7300 2400 0    50   ~ 0
GND
Entry Wire Line
	3450 2400 3550 2300
Text Label 2500 4300 0    50   ~ 0
IRQ
Text Label 4300 4300 0    50   ~ 0
IRQ
Text Label 6250 4300 0    50   ~ 0
IRQ
Text Label 8000 4300 0    50   ~ 0
IRQ
Text Label 6250 4400 0    50   ~ 0
PHI1out
Text Label 4300 4400 0    50   ~ 0
PHI1out
Text Label 2500 4400 0    50   ~ 0
PHI1out
Text Label 8000 4400 0    50   ~ 0
PHI1out
Text Label 2500 4500 0    50   ~ 0
PHI2out
Text Label 4300 4500 0    50   ~ 0
PHI2out
Text Label 6250 4500 0    50   ~ 0
PHI2out
Text Label 8000 4500 0    50   ~ 0
PHI2out
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J7
U 1 1 634FBDD9
P 9350 3700
F 0 "J7" H 9400 4817 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 9550 2400 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 9350 3700 50  0001 C CNN
F 3 "~" H 9350 3700 50  0001 C CNN
	1    9350 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 634FBDDF
P 9400 2300
F 0 "C5" H 9515 2346 50  0000 L CNN
F 1 "0.1uF" H 9515 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 9438 2150 50  0001 C CNN
F 3 "~" H 9400 2300 50  0001 C CNN
	1    9400 2300
	0    -1   -1   0   
$EndComp
Entry Wire Line
	8900 2900 9000 3000
Entry Wire Line
	8900 3000 9000 3100
Entry Wire Line
	8900 3100 9000 3200
Entry Wire Line
	8900 3200 9000 3300
Entry Wire Line
	8900 3300 9000 3400
Wire Wire Line
	9000 3000 9150 3000
Wire Wire Line
	9000 3100 9150 3100
Wire Wire Line
	9000 3200 9150 3200
Wire Wire Line
	9000 3300 9150 3300
Wire Wire Line
	9000 3400 9150 3400
Entry Bus Bus
	8800 2750 8900 2850
Entry Wire Line
	8900 2800 9000 2900
Entry Wire Line
	8900 2700 9000 2800
Wire Wire Line
	9150 2800 9000 2800
Wire Wire Line
	9150 2900 9000 2900
Text Label 9000 2800 0    50   ~ 0
GND
Text Label 9000 2900 0    50   ~ 0
RESET
Entry Bus Bus
	9950 4800 10050 4900
Entry Wire Line
	9850 2800 9950 2700
Entry Wire Line
	9850 2900 9950 2800
Entry Wire Line
	9850 3000 9950 2900
Entry Wire Line
	9850 3100 9950 3000
Entry Wire Line
	9850 3200 9950 3100
Entry Wire Line
	9850 3300 9950 3200
Entry Wire Line
	9850 3400 9950 3300
Entry Wire Line
	9850 3500 9950 3400
Entry Wire Line
	9850 3600 9950 3500
Entry Wire Line
	9850 3700 9950 3600
Entry Wire Line
	9850 3800 9950 3700
Entry Wire Line
	9850 3900 9950 3800
Entry Wire Line
	9850 4000 9950 3900
Entry Wire Line
	9850 4100 9950 4000
Entry Wire Line
	9850 4200 9950 4100
Entry Wire Line
	9850 4300 9950 4200
Entry Wire Line
	9850 4400 9950 4300
Entry Wire Line
	9850 4500 9950 4400
Entry Wire Line
	9850 4600 9950 4500
Entry Wire Line
	8900 3400 9000 3500
Entry Wire Line
	8900 3500 9000 3600
Entry Wire Line
	8900 3600 9000 3700
Entry Wire Line
	8900 3700 9000 3800
Entry Wire Line
	8900 3800 9000 3900
Entry Wire Line
	8900 3900 9000 4000
Entry Wire Line
	8900 4000 9000 4100
Entry Wire Line
	8900 4100 9000 4200
Entry Wire Line
	8900 4200 9000 4300
Entry Wire Line
	8900 4300 9000 4400
Entry Wire Line
	8900 4400 9000 4500
Entry Wire Line
	8900 4500 9000 4600
Entry Wire Line
	8900 4600 9000 4700
Wire Wire Line
	9000 3500 9150 3500
Wire Wire Line
	9000 3600 9150 3600
Wire Wire Line
	9000 3700 9150 3700
Wire Wire Line
	9000 3800 9150 3800
Wire Wire Line
	9000 3900 9150 3900
Wire Wire Line
	9000 4000 9150 4000
Wire Wire Line
	9000 4100 9150 4100
Wire Wire Line
	9000 4200 9150 4200
Wire Wire Line
	9000 4300 9150 4300
Wire Wire Line
	9000 4400 9150 4400
Wire Wire Line
	9000 4500 9150 4500
Wire Wire Line
	9000 4600 9150 4600
Wire Wire Line
	9000 4700 9150 4700
Wire Wire Line
	9650 2800 9850 2800
Wire Wire Line
	9650 2900 9850 2900
Wire Wire Line
	9650 3000 9850 3000
Wire Wire Line
	9650 3100 9850 3100
Wire Wire Line
	9650 3200 9850 3200
Wire Wire Line
	9650 3300 9850 3300
Wire Wire Line
	9650 3400 9850 3400
Wire Wire Line
	9650 3500 9850 3500
Wire Wire Line
	9650 3600 9850 3600
Wire Wire Line
	9650 3700 9850 3700
Wire Wire Line
	9650 3800 9850 3800
Wire Wire Line
	9650 3900 9850 3900
Wire Wire Line
	9650 4000 9850 4000
Wire Wire Line
	9650 4100 9850 4100
Wire Wire Line
	9650 4200 9850 4200
Wire Wire Line
	9650 4300 9850 4300
Wire Wire Line
	9650 4400 9850 4400
Wire Wire Line
	9650 4500 9850 4500
Wire Wire Line
	9650 4600 9850 4600
Text Label 9650 2800 0    50   ~ 0
GND
Text Label 9650 2900 0    50   ~ 0
VCC
Text Label 9050 3000 0    50   ~ 0
A0
Text Label 9050 3100 0    50   ~ 0
A1
Text Label 9050 3200 0    50   ~ 0
A2
Text Label 9050 3300 0    50   ~ 0
A3
Text Label 9050 3400 0    50   ~ 0
A4
Text Label 9050 3500 0    50   ~ 0
A5
Text Label 9050 3600 0    50   ~ 0
A6
Text Label 9050 3700 0    50   ~ 0
A7
Text Label 9050 3800 0    50   ~ 0
A8
Text Label 9050 3900 0    50   ~ 0
A9
Text Label 9050 4000 0    50   ~ 0
A10
Text Label 9050 4100 0    50   ~ 0
A11
Text Label 9050 4200 0    50   ~ 0
A12
Text Label 9050 4300 0    50   ~ 0
A13
Text Label 9050 4400 0    50   ~ 0
A14
Text Label 9050 4500 0    50   ~ 0
A15
Text Label 9650 3000 0    50   ~ 0
D0
Text Label 9650 3100 0    50   ~ 0
D1
Text Label 9650 3200 0    50   ~ 0
D2
Text Label 9650 3300 0    50   ~ 0
D3
Text Label 9650 3400 0    50   ~ 0
D4
Text Label 9650 3500 0    50   ~ 0
D5
Text Label 9650 3600 0    50   ~ 0
D6
Text Label 9650 3700 0    50   ~ 0
D7
Text Label 9650 3800 0    50   ~ 0
RW
Text Label 9650 3900 0    50   ~ 0
CLK
Text Label 9650 4000 0    50   ~ 0
FCLK
Text Label 9650 4100 0    50   ~ 0
SCLK
Text Label 9650 4200 0    50   ~ 0
FRMBUF
Text Label 9050 4600 0    50   ~ 0
RAMCS
Text Label 9050 4700 0    50   ~ 0
ROMCS
Entry Wire Line
	8800 2400 8900 2300
Entry Wire Line
	8800 2500 8900 2400
Wire Wire Line
	8900 2300 9250 2300
Wire Wire Line
	8900 2400 9250 2400
Wire Wire Line
	9250 2400 9250 2450
Wire Wire Line
	9250 2450 9550 2450
Wire Wire Line
	9550 2450 9550 2300
Text Label 8950 2300 0    50   ~ 0
VCC
Text Label 8950 2400 0    50   ~ 0
GND
Text Label 9650 4300 0    50   ~ 0
IRQ
Text Label 9650 4400 0    50   ~ 0
PHI1out
Text Label 9650 4500 0    50   ~ 0
PHI2out
Text Label 2500 4600 0    50   ~ 0
RNG
Text Label 4300 4600 0    50   ~ 0
RNG
Text Label 6250 4600 0    50   ~ 0
RNG
Text Label 8000 4600 0    50   ~ 0
RNG
Text Label 9650 4600 0    50   ~ 0
RNG
Entry Bus Bus
	3550 4800 3650 4900
Entry Bus Bus
	5500 4800 5600 4900
Entry Bus Bus
	7250 4800 7350 4900
Entry Bus Bus
	8900 4800 9000 4900
Entry Bus Bus
	3300 4900 3400 5000
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 6342A12F
P 2900 5400
F 0 "J3" H 3008 5581 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3008 5490 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2900 5400 50  0001 C CNN
F 3 "~" H 2900 5400 50  0001 C CNN
	1    2900 5400
	1    0    0    -1  
$EndComp
Entry Wire Line
	3300 5400 3400 5300
Entry Wire Line
	3300 5500 3400 5400
Wire Wire Line
	3100 5400 3300 5400
Wire Wire Line
	3100 5500 3300 5500
Text Label 3100 5400 0    50   ~ 0
VCC
Text Label 3100 5500 0    50   ~ 0
GND
Wire Wire Line
	1200 2000 1300 2000
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 634C1FF7
P 1300 1850
F 0 "#FLG0101" H 1300 1925 50  0001 C CNN
F 1 "PWR_FLAG" H 1300 2023 50  0000 C CNN
F 2 "" H 1300 1850 50  0001 C CNN
F 3 "~" H 1300 1850 50  0001 C CNN
	1    1300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2000 1300 1850
Connection ~ 1300 2000
Wire Wire Line
	1300 2000 1550 2000
Wire Wire Line
	1450 2300 1450 2200
Connection ~ 1450 2200
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6350DA8B
P 1450 2300
F 0 "#FLG0102" H 1450 2375 50  0001 C CNN
F 1 "PWR_FLAG" H 1450 2473 50  0000 C CNN
F 2 "" H 1450 2300 50  0001 C CNN
F 3 "~" H 1450 2300 50  0001 C CNN
	1    1450 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	1250 2200 1200 2200
Wire Wire Line
	1250 2200 1450 2200
NoConn ~ 9700 4700
Wire Wire Line
	9650 4700 9700 4700
Wire Wire Line
	8000 4600 8200 4600
Wire Wire Line
	8000 4500 8200 4500
Wire Wire Line
	8000 4400 8200 4400
Wire Wire Line
	8000 4300 8200 4300
Wire Wire Line
	8000 4200 8200 4200
Wire Wire Line
	8000 4100 8200 4100
Wire Wire Line
	8000 4000 8200 4000
Wire Wire Line
	8000 3900 8200 3900
Wire Wire Line
	8000 3800 8200 3800
Wire Wire Line
	8000 3700 8200 3700
Wire Wire Line
	8000 3600 8200 3600
Wire Wire Line
	8000 3500 8200 3500
Wire Wire Line
	8000 3400 8200 3400
Wire Wire Line
	8000 3300 8200 3300
Wire Wire Line
	8000 3200 8200 3200
Wire Wire Line
	8000 3100 8200 3100
Wire Wire Line
	8000 3000 8200 3000
Wire Wire Line
	8000 2900 8200 2900
NoConn ~ 8100 4700
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J6
U 1 1 633D9FDC
P 7700 3700
F 0 "J6" H 7750 4817 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 7850 2400 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 7700 3700 50  0001 C CNN
F 3 "~" H 7700 3700 50  0001 C CNN
	1    7700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4700 8100 4700
Wire Wire Line
	7350 4700 7500 4700
NoConn ~ 6300 4700
Wire Wire Line
	6250 4700 6300 4700
NoConn ~ 4350 4700
Wire Wire Line
	4300 4700 4350 4700
NoConn ~ 2550 4700
Wire Wire Line
	2550 4700 2500 4700
Wire Bus Line
	8800 2400 8800 2750
Wire Bus Line
	7150 2400 7150 2750
Wire Bus Line
	5400 2400 5400 2750
Wire Bus Line
	3450 2400 3450 2750
Wire Bus Line
	3400 5000 3400 5550
Wire Bus Line
	1650 2100 1650 2750
Wire Bus Line
	1750 4900 10050 4900
Wire Bus Line
	9950 2650 9950 4800
Wire Bus Line
	8300 2650 8300 4800
Wire Bus Line
	6550 2650 6550 4800
Wire Bus Line
	4600 2650 4600 4800
Wire Bus Line
	2800 2650 2800 4800
Wire Bus Line
	1750 2650 1750 4900
Wire Bus Line
	3550 2700 3550 4800
Wire Bus Line
	5500 2700 5500 4800
Wire Bus Line
	7250 2700 7250 4800
Wire Bus Line
	8900 2700 8900 4800
$EndSCHEMATC
