EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J?
U 1 1 6331A348
P 2800 3750
F 0 "J?" H 2850 4867 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 2850 4776 50  0000 C CNN
F 2 "" H 2800 3750 50  0001 C CNN
F 3 "~" H 2800 3750 50  0001 C CNN
	1    2800 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 63326677
P 2850 2350
F 0 "C?" H 2965 2396 50  0000 L CNN
F 1 "C" H 2965 2305 50  0000 L CNN
F 2 "" H 2888 2200 50  0001 C CNN
F 3 "~" H 2850 2350 50  0001 C CNN
	1    2850 2350
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Barrel_Jack J?
U 1 1 6332B9A7
P 1500 2150
F 0 "J?" H 1557 2475 50  0000 C CNN
F 1 "Barrel_Jack" H 1557 2384 50  0000 C CNN
F 2 "" H 1550 2110 50  0001 C CNN
F 3 "~" H 1550 2110 50  0001 C CNN
	1    1500 2150
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 6332D4BC
P 1900 2400
F 0 "#PWR?" H 1900 2150 50  0001 C CNN
F 1 "Earth" H 1900 2250 50  0001 C CNN
F 2 "" H 1900 2400 50  0001 C CNN
F 3 "~" H 1900 2400 50  0001 C CNN
	1    1900 2400
	1    0    0    -1  
$EndComp
Entry Wire Line
	2350 2950 2450 3050
Entry Wire Line
	2350 3050 2450 3150
Entry Wire Line
	2350 3150 2450 3250
Entry Wire Line
	2350 3250 2450 3350
Entry Wire Line
	2350 3350 2450 3450
Wire Wire Line
	2450 3050 2600 3050
Wire Wire Line
	2450 3150 2600 3150
Wire Wire Line
	2450 3250 2600 3250
Wire Wire Line
	2450 3350 2600 3350
Wire Wire Line
	2450 3450 2600 3450
Entry Bus Bus
	2250 2800 2350 2900
Entry Wire Line
	2150 2250 2250 2350
Entry Wire Line
	2150 2050 2250 2150
Wire Wire Line
	2150 2050 1900 2050
Wire Wire Line
	2150 2250 1900 2250
Wire Wire Line
	1900 2400 1900 2250
Connection ~ 1900 2250
Wire Wire Line
	1900 2250 1800 2250
$Comp
L power:+5V #PWR?
U 1 1 6333E52A
P 1900 1850
F 0 "#PWR?" H 1900 1700 50  0001 C CNN
F 1 "+5V" H 1915 2023 50  0000 C CNN
F 2 "" H 1900 1850 50  0001 C CNN
F 3 "" H 1900 1850 50  0001 C CNN
	1    1900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1850 1900 2050
Connection ~ 1900 2050
Wire Wire Line
	1900 2050 1800 2050
Text Label 1950 2250 0    50   ~ 0
GND
Text Label 1950 2050 0    50   ~ 0
VCC
Entry Wire Line
	2350 2850 2450 2950
Entry Wire Line
	2350 2750 2450 2850
Wire Wire Line
	2600 2850 2450 2850
Wire Wire Line
	2600 2950 2450 2950
Text Label 2450 2850 0    50   ~ 0
GND
Text Label 2450 2950 0    50   ~ 0
RESET
Entry Bus Bus
	3400 4850 3500 4950
Entry Wire Line
	3300 2850 3400 2750
Entry Wire Line
	3300 2950 3400 2850
Entry Wire Line
	3300 3050 3400 2950
Entry Wire Line
	3300 3150 3400 3050
Entry Wire Line
	3300 3250 3400 3150
Entry Wire Line
	3300 3350 3400 3250
Entry Wire Line
	3300 3450 3400 3350
Entry Wire Line
	3300 3550 3400 3450
Entry Wire Line
	3300 3650 3400 3550
Entry Wire Line
	3300 3750 3400 3650
Entry Wire Line
	3300 3850 3400 3750
Entry Wire Line
	3300 3950 3400 3850
Entry Wire Line
	3300 4050 3400 3950
Entry Wire Line
	3300 4150 3400 4050
Entry Wire Line
	3300 4250 3400 4150
Entry Wire Line
	3300 4350 3400 4250
Entry Wire Line
	3300 4450 3400 4350
Entry Wire Line
	3300 4550 3400 4450
Entry Wire Line
	3300 4650 3400 4550
Entry Wire Line
	3300 4750 3400 4650
Entry Wire Line
	2350 3450 2450 3550
Entry Wire Line
	2350 3550 2450 3650
Entry Wire Line
	2350 3650 2450 3750
Entry Wire Line
	2350 3750 2450 3850
Entry Wire Line
	2350 3850 2450 3950
Entry Wire Line
	2350 3950 2450 4050
Entry Wire Line
	2350 4050 2450 4150
Entry Wire Line
	2350 4150 2450 4250
Entry Wire Line
	2350 4250 2450 4350
Entry Wire Line
	2350 4350 2450 4450
Entry Wire Line
	2350 4450 2450 4550
Entry Wire Line
	2350 4550 2450 4650
Entry Wire Line
	2350 4650 2450 4750
Wire Wire Line
	2450 3550 2600 3550
Wire Wire Line
	2450 3650 2600 3650
Wire Wire Line
	2450 3750 2600 3750
Wire Wire Line
	2450 3850 2600 3850
Wire Wire Line
	2450 3950 2600 3950
Wire Wire Line
	2450 4050 2600 4050
Wire Wire Line
	2450 4150 2600 4150
Wire Wire Line
	2450 4250 2600 4250
Wire Wire Line
	2450 4350 2600 4350
Wire Wire Line
	2450 4450 2600 4450
Wire Wire Line
	2450 4550 2600 4550
Wire Wire Line
	2450 4650 2600 4650
Wire Wire Line
	2450 4750 2600 4750
Wire Wire Line
	3100 2850 3300 2850
Wire Wire Line
	3100 2950 3300 2950
Wire Wire Line
	3100 3050 3300 3050
Wire Wire Line
	3100 3150 3300 3150
Wire Wire Line
	3100 3250 3300 3250
Wire Wire Line
	3100 3350 3300 3350
Wire Wire Line
	3100 3450 3300 3450
Wire Wire Line
	3100 3550 3300 3550
Wire Wire Line
	3100 3650 3300 3650
Wire Wire Line
	3100 3750 3300 3750
Wire Wire Line
	3100 3850 3300 3850
Wire Wire Line
	3100 3950 3300 3950
Wire Wire Line
	3100 4050 3300 4050
Wire Wire Line
	3100 4150 3300 4150
Wire Wire Line
	3100 4250 3300 4250
Wire Wire Line
	3100 4350 3300 4350
Wire Wire Line
	3100 4450 3300 4450
Wire Wire Line
	3100 4550 3300 4550
Wire Wire Line
	3100 4650 3300 4650
Wire Wire Line
	3100 4750 3300 4750
Text Label 3100 2850 0    50   ~ 0
GND
Text Label 3100 2950 0    50   ~ 0
VCC
Text Label 2500 3050 0    50   ~ 0
A0
Text Label 2500 3150 0    50   ~ 0
A1
Text Label 2500 3250 0    50   ~ 0
A2
Text Label 2500 3350 0    50   ~ 0
A3
Text Label 2500 3450 0    50   ~ 0
A4
Text Label 2500 3550 0    50   ~ 0
A5
Text Label 2500 3650 0    50   ~ 0
A6
Text Label 2500 3750 0    50   ~ 0
A7
Text Label 2500 3850 0    50   ~ 0
A8
Text Label 2500 3950 0    50   ~ 0
A9
Text Label 2500 4050 0    50   ~ 0
A10
Text Label 2500 4150 0    50   ~ 0
A11
Text Label 2500 4250 0    50   ~ 0
A12
Text Label 2500 4350 0    50   ~ 0
A13
Text Label 2500 4450 0    50   ~ 0
A14
Text Label 2500 4550 0    50   ~ 0
A15
Text Label 3100 3050 0    50   ~ 0
D0
Text Label 3100 3150 0    50   ~ 0
D1
Text Label 3100 3250 0    50   ~ 0
D2
Text Label 3100 3350 0    50   ~ 0
D3
Text Label 3100 3450 0    50   ~ 0
D4
Text Label 3100 3550 0    50   ~ 0
D5
Text Label 3100 3650 0    50   ~ 0
D6
Text Label 3100 3750 0    50   ~ 0
D7
Text Label 3100 3850 0    50   ~ 0
RW
Text Label 3100 3950 0    50   ~ 0
CLK
Text Label 3100 4050 0    50   ~ 0
FCLK
Text Label 3100 4150 0    50   ~ 0
SCLK
Text Label 3100 4250 0    50   ~ 0
FRMBUF
Text Label 2500 4650 0    50   ~ 0
RAMCS
Text Label 2500 4750 0    50   ~ 0
ROMCS
Entry Wire Line
	2250 2450 2350 2350
Entry Wire Line
	2250 2550 2350 2450
Wire Wire Line
	2350 2350 2700 2350
Wire Wire Line
	2350 2450 2700 2450
Wire Wire Line
	2700 2450 2700 2500
Wire Wire Line
	2700 2500 3000 2500
Wire Wire Line
	3000 2500 3000 2350
Text Label 2400 2350 0    50   ~ 0
VCC
Text Label 2400 2450 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J?
U 1 1 633C504D
P 4600 3750
F 0 "J?" H 4650 4867 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 4650 4776 50  0000 C CNN
F 2 "" H 4600 3750 50  0001 C CNN
F 3 "~" H 4600 3750 50  0001 C CNN
	1    4600 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 633C5053
P 4650 2350
F 0 "C?" H 4765 2396 50  0000 L CNN
F 1 "C" H 4765 2305 50  0000 L CNN
F 2 "" H 4688 2200 50  0001 C CNN
F 3 "~" H 4650 2350 50  0001 C CNN
	1    4650 2350
	0    -1   -1   0   
$EndComp
Entry Wire Line
	4150 2950 4250 3050
Entry Wire Line
	4150 3050 4250 3150
Entry Wire Line
	4150 3150 4250 3250
Entry Wire Line
	4150 3250 4250 3350
Entry Wire Line
	4150 3350 4250 3450
Wire Wire Line
	4250 3050 4400 3050
Wire Wire Line
	4250 3150 4400 3150
Wire Wire Line
	4250 3250 4400 3250
Wire Wire Line
	4250 3350 4400 3350
Wire Wire Line
	4250 3450 4400 3450
Entry Bus Bus
	4050 2800 4150 2900
Entry Wire Line
	4150 2850 4250 2950
Entry Wire Line
	4150 2750 4250 2850
Wire Wire Line
	4400 2850 4250 2850
Wire Wire Line
	4400 2950 4250 2950
Text Label 4250 2850 0    50   ~ 0
GND
Text Label 4250 2950 0    50   ~ 0
RESET
Entry Bus Bus
	5200 4850 5300 4950
Entry Wire Line
	5100 2850 5200 2750
Entry Wire Line
	5100 2950 5200 2850
Entry Wire Line
	5100 3050 5200 2950
Entry Wire Line
	5100 3150 5200 3050
Entry Wire Line
	5100 3250 5200 3150
Entry Wire Line
	5100 3350 5200 3250
Entry Wire Line
	5100 3450 5200 3350
Entry Wire Line
	5100 3550 5200 3450
Entry Wire Line
	5100 3650 5200 3550
Entry Wire Line
	5100 3750 5200 3650
Entry Wire Line
	5100 3850 5200 3750
Entry Wire Line
	5100 3950 5200 3850
Entry Wire Line
	5100 4050 5200 3950
Entry Wire Line
	5100 4150 5200 4050
Entry Wire Line
	5100 4250 5200 4150
Entry Wire Line
	5100 4350 5200 4250
Entry Wire Line
	5100 4450 5200 4350
Entry Wire Line
	5100 4550 5200 4450
Entry Wire Line
	5100 4650 5200 4550
Entry Wire Line
	5100 4750 5200 4650
Entry Wire Line
	4150 3450 4250 3550
Entry Wire Line
	4150 3550 4250 3650
Entry Wire Line
	4150 3650 4250 3750
Entry Wire Line
	4150 3750 4250 3850
Entry Wire Line
	4150 3850 4250 3950
Entry Wire Line
	4150 3950 4250 4050
Entry Wire Line
	4150 4050 4250 4150
Entry Wire Line
	4150 4150 4250 4250
Entry Wire Line
	4150 4250 4250 4350
Entry Wire Line
	4150 4350 4250 4450
Entry Wire Line
	4150 4450 4250 4550
Entry Wire Line
	4150 4550 4250 4650
Entry Wire Line
	4150 4650 4250 4750
Wire Wire Line
	4250 3550 4400 3550
Wire Wire Line
	4250 3650 4400 3650
Wire Wire Line
	4250 3750 4400 3750
Wire Wire Line
	4250 3850 4400 3850
Wire Wire Line
	4250 3950 4400 3950
Wire Wire Line
	4250 4050 4400 4050
Wire Wire Line
	4250 4150 4400 4150
Wire Wire Line
	4250 4250 4400 4250
Wire Wire Line
	4250 4350 4400 4350
Wire Wire Line
	4250 4450 4400 4450
Wire Wire Line
	4250 4550 4400 4550
Wire Wire Line
	4250 4650 4400 4650
Wire Wire Line
	4250 4750 4400 4750
Wire Wire Line
	4900 2850 5100 2850
Wire Wire Line
	4900 2950 5100 2950
Wire Wire Line
	4900 3050 5100 3050
Wire Wire Line
	4900 3150 5100 3150
Wire Wire Line
	4900 3250 5100 3250
Wire Wire Line
	4900 3350 5100 3350
Wire Wire Line
	4900 3450 5100 3450
Wire Wire Line
	4900 3550 5100 3550
Wire Wire Line
	4900 3650 5100 3650
Wire Wire Line
	4900 3750 5100 3750
Wire Wire Line
	4900 3850 5100 3850
Wire Wire Line
	4900 3950 5100 3950
Wire Wire Line
	4900 4050 5100 4050
Wire Wire Line
	4900 4150 5100 4150
Wire Wire Line
	4900 4250 5100 4250
Wire Wire Line
	4900 4350 5100 4350
Wire Wire Line
	4900 4450 5100 4450
Wire Wire Line
	4900 4550 5100 4550
Wire Wire Line
	4900 4650 5100 4650
Wire Wire Line
	4900 4750 5100 4750
Text Label 4900 2850 0    50   ~ 0
GND
Text Label 4900 2950 0    50   ~ 0
VCC
Text Label 4300 3050 0    50   ~ 0
A0
Text Label 4300 3150 0    50   ~ 0
A1
Text Label 4300 3250 0    50   ~ 0
A2
Text Label 4300 3350 0    50   ~ 0
A3
Text Label 4300 3450 0    50   ~ 0
A4
Text Label 4300 3550 0    50   ~ 0
A5
Text Label 4300 3650 0    50   ~ 0
A6
Text Label 4300 3750 0    50   ~ 0
A7
Text Label 4300 3850 0    50   ~ 0
A8
Text Label 4300 3950 0    50   ~ 0
A9
Text Label 4300 4050 0    50   ~ 0
A10
Text Label 4300 4150 0    50   ~ 0
A11
Text Label 4300 4250 0    50   ~ 0
A12
Text Label 4300 4350 0    50   ~ 0
A13
Text Label 4300 4450 0    50   ~ 0
A14
Text Label 4300 4550 0    50   ~ 0
A15
Text Label 4900 3050 0    50   ~ 0
D0
Text Label 4900 3150 0    50   ~ 0
D1
Text Label 4900 3250 0    50   ~ 0
D2
Text Label 4900 3350 0    50   ~ 0
D3
Text Label 4900 3450 0    50   ~ 0
D4
Text Label 4900 3550 0    50   ~ 0
D5
Text Label 4900 3650 0    50   ~ 0
D6
Text Label 4900 3750 0    50   ~ 0
D7
Text Label 4900 3850 0    50   ~ 0
RW
Text Label 4900 3950 0    50   ~ 0
CLK
Text Label 4900 4050 0    50   ~ 0
FCLK
Text Label 4900 4150 0    50   ~ 0
SCLK
Text Label 4900 4250 0    50   ~ 0
FRMBUF
Text Label 4300 4650 0    50   ~ 0
RAMCS
Text Label 4300 4750 0    50   ~ 0
ROMCS
Entry Wire Line
	4050 2550 4150 2450
Wire Wire Line
	4150 2350 4500 2350
Wire Wire Line
	4150 2450 4500 2450
Wire Wire Line
	4500 2450 4500 2500
Wire Wire Line
	4500 2500 4800 2500
Wire Wire Line
	4800 2500 4800 2350
Text Label 4200 2350 0    50   ~ 0
VCC
Text Label 4200 2450 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J?
U 1 1 633CDD28
P 6550 3750
F 0 "J?" H 6600 4867 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 6600 4776 50  0000 C CNN
F 2 "" H 6550 3750 50  0001 C CNN
F 3 "~" H 6550 3750 50  0001 C CNN
	1    6550 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 633CDD2E
P 6600 2350
F 0 "C?" H 6715 2396 50  0000 L CNN
F 1 "C" H 6715 2305 50  0000 L CNN
F 2 "" H 6638 2200 50  0001 C CNN
F 3 "~" H 6600 2350 50  0001 C CNN
	1    6600 2350
	0    -1   -1   0   
$EndComp
Entry Wire Line
	6100 2950 6200 3050
Entry Wire Line
	6100 3050 6200 3150
Entry Wire Line
	6100 3150 6200 3250
Entry Wire Line
	6100 3250 6200 3350
Entry Wire Line
	6100 3350 6200 3450
Wire Wire Line
	6200 3050 6350 3050
Wire Wire Line
	6200 3150 6350 3150
Wire Wire Line
	6200 3250 6350 3250
Wire Wire Line
	6200 3350 6350 3350
Wire Wire Line
	6200 3450 6350 3450
Entry Bus Bus
	6000 2800 6100 2900
Entry Wire Line
	6100 2850 6200 2950
Entry Wire Line
	6100 2750 6200 2850
Wire Wire Line
	6350 2850 6200 2850
Wire Wire Line
	6350 2950 6200 2950
Text Label 6200 2850 0    50   ~ 0
GND
Text Label 6200 2950 0    50   ~ 0
RESET
Entry Bus Bus
	7150 4850 7250 4950
Entry Wire Line
	7050 2850 7150 2750
Entry Wire Line
	7050 2950 7150 2850
Entry Wire Line
	7050 3050 7150 2950
Entry Wire Line
	7050 3150 7150 3050
Entry Wire Line
	7050 3250 7150 3150
Entry Wire Line
	7050 3350 7150 3250
Entry Wire Line
	7050 3450 7150 3350
Entry Wire Line
	7050 3550 7150 3450
Entry Wire Line
	7050 3650 7150 3550
Entry Wire Line
	7050 3750 7150 3650
Entry Wire Line
	7050 3850 7150 3750
Entry Wire Line
	7050 3950 7150 3850
Entry Wire Line
	7050 4050 7150 3950
Entry Wire Line
	7050 4150 7150 4050
Entry Wire Line
	7050 4250 7150 4150
Entry Wire Line
	7050 4350 7150 4250
Entry Wire Line
	7050 4450 7150 4350
Entry Wire Line
	7050 4550 7150 4450
Entry Wire Line
	7050 4650 7150 4550
Entry Wire Line
	7050 4750 7150 4650
Entry Wire Line
	6100 3450 6200 3550
Entry Wire Line
	6100 3550 6200 3650
Entry Wire Line
	6100 3650 6200 3750
Entry Wire Line
	6100 3750 6200 3850
Entry Wire Line
	6100 3850 6200 3950
Entry Wire Line
	6100 3950 6200 4050
Entry Wire Line
	6100 4050 6200 4150
Entry Wire Line
	6100 4150 6200 4250
Entry Wire Line
	6100 4250 6200 4350
Entry Wire Line
	6100 4350 6200 4450
Entry Wire Line
	6100 4450 6200 4550
Entry Wire Line
	6100 4550 6200 4650
Entry Wire Line
	6100 4650 6200 4750
Wire Wire Line
	6200 3550 6350 3550
Wire Wire Line
	6200 3650 6350 3650
Wire Wire Line
	6200 3750 6350 3750
Wire Wire Line
	6200 3850 6350 3850
Wire Wire Line
	6200 3950 6350 3950
Wire Wire Line
	6200 4050 6350 4050
Wire Wire Line
	6200 4150 6350 4150
Wire Wire Line
	6200 4250 6350 4250
Wire Wire Line
	6200 4350 6350 4350
Wire Wire Line
	6200 4450 6350 4450
Wire Wire Line
	6200 4550 6350 4550
Wire Wire Line
	6200 4650 6350 4650
Wire Wire Line
	6200 4750 6350 4750
Wire Wire Line
	6850 2850 7050 2850
Wire Wire Line
	6850 2950 7050 2950
Wire Wire Line
	6850 3050 7050 3050
Wire Wire Line
	6850 3150 7050 3150
Wire Wire Line
	6850 3250 7050 3250
Wire Wire Line
	6850 3350 7050 3350
Wire Wire Line
	6850 3450 7050 3450
Wire Wire Line
	6850 3550 7050 3550
Wire Wire Line
	6850 3650 7050 3650
Wire Wire Line
	6850 3750 7050 3750
Wire Wire Line
	6850 3850 7050 3850
Wire Wire Line
	6850 3950 7050 3950
Wire Wire Line
	6850 4050 7050 4050
Wire Wire Line
	6850 4150 7050 4150
Wire Wire Line
	6850 4250 7050 4250
Wire Wire Line
	6850 4350 7050 4350
Wire Wire Line
	6850 4450 7050 4450
Wire Wire Line
	6850 4550 7050 4550
Wire Wire Line
	6850 4650 7050 4650
Wire Wire Line
	6850 4750 7050 4750
Text Label 6850 2850 0    50   ~ 0
GND
Text Label 6850 2950 0    50   ~ 0
VCC
Text Label 6250 3050 0    50   ~ 0
A0
Text Label 6250 3150 0    50   ~ 0
A1
Text Label 6250 3250 0    50   ~ 0
A2
Text Label 6250 3350 0    50   ~ 0
A3
Text Label 6250 3450 0    50   ~ 0
A4
Text Label 6250 3550 0    50   ~ 0
A5
Text Label 6250 3650 0    50   ~ 0
A6
Text Label 6250 3750 0    50   ~ 0
A7
Text Label 6250 3850 0    50   ~ 0
A8
Text Label 6250 3950 0    50   ~ 0
A9
Text Label 6250 4050 0    50   ~ 0
A10
Text Label 6250 4150 0    50   ~ 0
A11
Text Label 6250 4250 0    50   ~ 0
A12
Text Label 6250 4350 0    50   ~ 0
A13
Text Label 6250 4450 0    50   ~ 0
A14
Text Label 6250 4550 0    50   ~ 0
A15
Text Label 6850 3050 0    50   ~ 0
D0
Text Label 6850 3150 0    50   ~ 0
D1
Text Label 6850 3250 0    50   ~ 0
D2
Text Label 6850 3350 0    50   ~ 0
D3
Text Label 6850 3450 0    50   ~ 0
D4
Text Label 6850 3550 0    50   ~ 0
D5
Text Label 6850 3650 0    50   ~ 0
D6
Text Label 6850 3750 0    50   ~ 0
D7
Text Label 6850 3850 0    50   ~ 0
RW
Text Label 6850 3950 0    50   ~ 0
CLK
Text Label 6850 4050 0    50   ~ 0
FCLK
Text Label 6850 4150 0    50   ~ 0
SCLK
Text Label 6850 4250 0    50   ~ 0
FRMBUF
Text Label 6250 4650 0    50   ~ 0
RAMCS
Text Label 6250 4750 0    50   ~ 0
ROMCS
Entry Wire Line
	6000 2450 6100 2350
Entry Wire Line
	6000 2550 6100 2450
Wire Wire Line
	6100 2350 6450 2350
Wire Wire Line
	6100 2450 6450 2450
Wire Wire Line
	6450 2450 6450 2500
Wire Wire Line
	6450 2500 6750 2500
Wire Wire Line
	6750 2500 6750 2350
Text Label 6150 2350 0    50   ~ 0
VCC
Text Label 6150 2450 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J?
U 1 1 633D9FDC
P 8300 3750
F 0 "J?" H 8350 4867 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 8350 4776 50  0000 C CNN
F 2 "" H 8300 3750 50  0001 C CNN
F 3 "~" H 8300 3750 50  0001 C CNN
	1    8300 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 633D9FE2
P 8350 2350
F 0 "C?" H 8465 2396 50  0000 L CNN
F 1 "C" H 8465 2305 50  0000 L CNN
F 2 "" H 8388 2200 50  0001 C CNN
F 3 "~" H 8350 2350 50  0001 C CNN
	1    8350 2350
	0    -1   -1   0   
$EndComp
Entry Wire Line
	7850 2950 7950 3050
Entry Wire Line
	7850 3050 7950 3150
Entry Wire Line
	7850 3150 7950 3250
Entry Wire Line
	7850 3250 7950 3350
Entry Wire Line
	7850 3350 7950 3450
Wire Wire Line
	7950 3050 8100 3050
Wire Wire Line
	7950 3150 8100 3150
Wire Wire Line
	7950 3250 8100 3250
Wire Wire Line
	7950 3350 8100 3350
Wire Wire Line
	7950 3450 8100 3450
Entry Bus Bus
	7750 2800 7850 2900
Entry Wire Line
	7850 2850 7950 2950
Entry Wire Line
	7850 2750 7950 2850
Wire Wire Line
	8100 2850 7950 2850
Wire Wire Line
	8100 2950 7950 2950
Text Label 7950 2850 0    50   ~ 0
GND
Text Label 7950 2950 0    50   ~ 0
RESET
Entry Bus Bus
	8900 4850 9000 4950
Entry Wire Line
	8800 2850 8900 2750
Entry Wire Line
	8800 2950 8900 2850
Entry Wire Line
	8800 3050 8900 2950
Entry Wire Line
	8800 3150 8900 3050
Entry Wire Line
	8800 3250 8900 3150
Entry Wire Line
	8800 3350 8900 3250
Entry Wire Line
	8800 3450 8900 3350
Entry Wire Line
	8800 3550 8900 3450
Entry Wire Line
	8800 3650 8900 3550
Entry Wire Line
	8800 3750 8900 3650
Entry Wire Line
	8800 3850 8900 3750
Entry Wire Line
	8800 3950 8900 3850
Entry Wire Line
	8800 4050 8900 3950
Entry Wire Line
	8800 4150 8900 4050
Entry Wire Line
	8800 4250 8900 4150
Entry Wire Line
	8800 4350 8900 4250
Entry Wire Line
	8800 4450 8900 4350
Entry Wire Line
	8800 4550 8900 4450
Entry Wire Line
	8800 4650 8900 4550
Entry Wire Line
	8800 4750 8900 4650
Entry Wire Line
	7850 3450 7950 3550
Entry Wire Line
	7850 3550 7950 3650
Entry Wire Line
	7850 3650 7950 3750
Entry Wire Line
	7850 3750 7950 3850
Entry Wire Line
	7850 3850 7950 3950
Entry Wire Line
	7850 3950 7950 4050
Entry Wire Line
	7850 4050 7950 4150
Entry Wire Line
	7850 4150 7950 4250
Entry Wire Line
	7850 4250 7950 4350
Entry Wire Line
	7850 4350 7950 4450
Entry Wire Line
	7850 4450 7950 4550
Entry Wire Line
	7850 4550 7950 4650
Entry Wire Line
	7850 4650 7950 4750
Wire Wire Line
	7950 3550 8100 3550
Wire Wire Line
	7950 3650 8100 3650
Wire Wire Line
	7950 3750 8100 3750
Wire Wire Line
	7950 3850 8100 3850
Wire Wire Line
	7950 3950 8100 3950
Wire Wire Line
	7950 4050 8100 4050
Wire Wire Line
	7950 4150 8100 4150
Wire Wire Line
	7950 4250 8100 4250
Wire Wire Line
	7950 4350 8100 4350
Wire Wire Line
	7950 4450 8100 4450
Wire Wire Line
	7950 4550 8100 4550
Wire Wire Line
	7950 4650 8100 4650
Wire Wire Line
	7950 4750 8100 4750
Wire Wire Line
	8600 2850 8800 2850
Wire Wire Line
	8600 2950 8800 2950
Wire Wire Line
	8600 3050 8800 3050
Wire Wire Line
	8600 3150 8800 3150
Wire Wire Line
	8600 3250 8800 3250
Wire Wire Line
	8600 3350 8800 3350
Wire Wire Line
	8600 3450 8800 3450
Wire Wire Line
	8600 3550 8800 3550
Wire Wire Line
	8600 3650 8800 3650
Wire Wire Line
	8600 3750 8800 3750
Wire Wire Line
	8600 3850 8800 3850
Wire Wire Line
	8600 3950 8800 3950
Wire Wire Line
	8600 4050 8800 4050
Wire Wire Line
	8600 4150 8800 4150
Wire Wire Line
	8600 4250 8800 4250
Wire Wire Line
	8600 4350 8800 4350
Wire Wire Line
	8600 4450 8800 4450
Wire Wire Line
	8600 4550 8800 4550
Wire Wire Line
	8600 4650 8800 4650
Wire Wire Line
	8600 4750 8800 4750
Text Label 8600 2850 0    50   ~ 0
GND
Text Label 8600 2950 0    50   ~ 0
VCC
Text Label 8000 3050 0    50   ~ 0
A0
Text Label 8000 3150 0    50   ~ 0
A1
Text Label 8000 3250 0    50   ~ 0
A2
Text Label 8000 3350 0    50   ~ 0
A3
Text Label 8000 3450 0    50   ~ 0
A4
Text Label 8000 3550 0    50   ~ 0
A5
Text Label 8000 3650 0    50   ~ 0
A6
Text Label 8000 3750 0    50   ~ 0
A7
Text Label 8000 3850 0    50   ~ 0
A8
Text Label 8000 3950 0    50   ~ 0
A9
Text Label 8000 4050 0    50   ~ 0
A10
Text Label 8000 4150 0    50   ~ 0
A11
Text Label 8000 4250 0    50   ~ 0
A12
Text Label 8000 4350 0    50   ~ 0
A13
Text Label 8000 4450 0    50   ~ 0
A14
Text Label 8000 4550 0    50   ~ 0
A15
Text Label 8600 3050 0    50   ~ 0
D0
Text Label 8600 3150 0    50   ~ 0
D1
Text Label 8600 3250 0    50   ~ 0
D2
Text Label 8600 3350 0    50   ~ 0
D3
Text Label 8600 3450 0    50   ~ 0
D4
Text Label 8600 3550 0    50   ~ 0
D5
Text Label 8600 3650 0    50   ~ 0
D6
Text Label 8600 3750 0    50   ~ 0
D7
Text Label 8600 3850 0    50   ~ 0
RW
Text Label 8600 3950 0    50   ~ 0
CLK
Text Label 8600 4050 0    50   ~ 0
FCLK
Text Label 8600 4150 0    50   ~ 0
SCLK
Text Label 8600 4250 0    50   ~ 0
FRMBUF
Text Label 8000 4650 0    50   ~ 0
RAMCS
Text Label 8000 4750 0    50   ~ 0
ROMCS
Entry Wire Line
	7750 2450 7850 2350
Entry Wire Line
	7750 2550 7850 2450
Wire Wire Line
	7850 2350 8200 2350
Wire Wire Line
	7850 2450 8200 2450
Wire Wire Line
	8200 2450 8200 2500
Wire Wire Line
	8200 2500 8500 2500
Wire Wire Line
	8500 2500 8500 2350
Text Label 7900 2350 0    50   ~ 0
VCC
Text Label 7900 2450 0    50   ~ 0
GND
Entry Wire Line
	4050 2450 4150 2350
Connection ~ 4150 4950
Connection ~ 6100 4950
Connection ~ 7850 4950
Text Label 3100 4350 0    50   ~ 0
IRQ
Text Label 4900 4350 0    50   ~ 0
IRQ
Text Label 6850 4350 0    50   ~ 0
IRQ
Text Label 8600 4350 0    50   ~ 0
IRQ
Text Label 6850 4450 0    50   ~ 0
PHI1out
Text Label 4900 4450 0    50   ~ 0
PHI1out
Text Label 3100 4450 0    50   ~ 0
PHI1out
Text Label 8600 4450 0    50   ~ 0
PHI1out
Text Label 3100 4550 0    50   ~ 0
PHI2out
Text Label 4900 4550 0    50   ~ 0
PHI2out
Text Label 6850 4550 0    50   ~ 0
PHI2out
Text Label 8600 4550 0    50   ~ 0
PHI2out
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J?
U 1 1 634FBDD9
P 9950 3750
F 0 "J?" H 10000 4867 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 10000 4776 50  0000 C CNN
F 2 "" H 9950 3750 50  0001 C CNN
F 3 "~" H 9950 3750 50  0001 C CNN
	1    9950 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 634FBDDF
P 10000 2350
F 0 "C?" H 10115 2396 50  0000 L CNN
F 1 "C" H 10115 2305 50  0000 L CNN
F 2 "" H 10038 2200 50  0001 C CNN
F 3 "~" H 10000 2350 50  0001 C CNN
	1    10000 2350
	0    -1   -1   0   
$EndComp
Entry Wire Line
	9500 2950 9600 3050
Entry Wire Line
	9500 3050 9600 3150
Entry Wire Line
	9500 3150 9600 3250
Entry Wire Line
	9500 3250 9600 3350
Entry Wire Line
	9500 3350 9600 3450
Wire Wire Line
	9600 3050 9750 3050
Wire Wire Line
	9600 3150 9750 3150
Wire Wire Line
	9600 3250 9750 3250
Wire Wire Line
	9600 3350 9750 3350
Wire Wire Line
	9600 3450 9750 3450
Entry Bus Bus
	9400 2800 9500 2900
Entry Wire Line
	9500 2850 9600 2950
Entry Wire Line
	9500 2750 9600 2850
Wire Wire Line
	9750 2850 9600 2850
Wire Wire Line
	9750 2950 9600 2950
Text Label 9600 2850 0    50   ~ 0
GND
Text Label 9600 2950 0    50   ~ 0
RESET
Entry Bus Bus
	10550 4850 10650 4950
Entry Wire Line
	10450 2850 10550 2750
Entry Wire Line
	10450 2950 10550 2850
Entry Wire Line
	10450 3050 10550 2950
Entry Wire Line
	10450 3150 10550 3050
Entry Wire Line
	10450 3250 10550 3150
Entry Wire Line
	10450 3350 10550 3250
Entry Wire Line
	10450 3450 10550 3350
Entry Wire Line
	10450 3550 10550 3450
Entry Wire Line
	10450 3650 10550 3550
Entry Wire Line
	10450 3750 10550 3650
Entry Wire Line
	10450 3850 10550 3750
Entry Wire Line
	10450 3950 10550 3850
Entry Wire Line
	10450 4050 10550 3950
Entry Wire Line
	10450 4150 10550 4050
Entry Wire Line
	10450 4250 10550 4150
Entry Wire Line
	10450 4350 10550 4250
Entry Wire Line
	10450 4450 10550 4350
Entry Wire Line
	10450 4550 10550 4450
Entry Wire Line
	10450 4650 10550 4550
Entry Wire Line
	10450 4750 10550 4650
Entry Wire Line
	9500 3450 9600 3550
Entry Wire Line
	9500 3550 9600 3650
Entry Wire Line
	9500 3650 9600 3750
Entry Wire Line
	9500 3750 9600 3850
Entry Wire Line
	9500 3850 9600 3950
Entry Wire Line
	9500 3950 9600 4050
Entry Wire Line
	9500 4050 9600 4150
Entry Wire Line
	9500 4150 9600 4250
Entry Wire Line
	9500 4250 9600 4350
Entry Wire Line
	9500 4350 9600 4450
Entry Wire Line
	9500 4450 9600 4550
Entry Wire Line
	9500 4550 9600 4650
Entry Wire Line
	9500 4650 9600 4750
Wire Wire Line
	9600 3550 9750 3550
Wire Wire Line
	9600 3650 9750 3650
Wire Wire Line
	9600 3750 9750 3750
Wire Wire Line
	9600 3850 9750 3850
Wire Wire Line
	9600 3950 9750 3950
Wire Wire Line
	9600 4050 9750 4050
Wire Wire Line
	9600 4150 9750 4150
Wire Wire Line
	9600 4250 9750 4250
Wire Wire Line
	9600 4350 9750 4350
Wire Wire Line
	9600 4450 9750 4450
Wire Wire Line
	9600 4550 9750 4550
Wire Wire Line
	9600 4650 9750 4650
Wire Wire Line
	9600 4750 9750 4750
Wire Wire Line
	10250 2850 10450 2850
Wire Wire Line
	10250 2950 10450 2950
Wire Wire Line
	10250 3050 10450 3050
Wire Wire Line
	10250 3150 10450 3150
Wire Wire Line
	10250 3250 10450 3250
Wire Wire Line
	10250 3350 10450 3350
Wire Wire Line
	10250 3450 10450 3450
Wire Wire Line
	10250 3550 10450 3550
Wire Wire Line
	10250 3650 10450 3650
Wire Wire Line
	10250 3750 10450 3750
Wire Wire Line
	10250 3850 10450 3850
Wire Wire Line
	10250 3950 10450 3950
Wire Wire Line
	10250 4050 10450 4050
Wire Wire Line
	10250 4150 10450 4150
Wire Wire Line
	10250 4250 10450 4250
Wire Wire Line
	10250 4350 10450 4350
Wire Wire Line
	10250 4450 10450 4450
Wire Wire Line
	10250 4550 10450 4550
Wire Wire Line
	10250 4650 10450 4650
Wire Wire Line
	10250 4750 10450 4750
Text Label 10250 2850 0    50   ~ 0
GND
Text Label 10250 2950 0    50   ~ 0
VCC
Text Label 9650 3050 0    50   ~ 0
A0
Text Label 9650 3150 0    50   ~ 0
A1
Text Label 9650 3250 0    50   ~ 0
A2
Text Label 9650 3350 0    50   ~ 0
A3
Text Label 9650 3450 0    50   ~ 0
A4
Text Label 9650 3550 0    50   ~ 0
A5
Text Label 9650 3650 0    50   ~ 0
A6
Text Label 9650 3750 0    50   ~ 0
A7
Text Label 9650 3850 0    50   ~ 0
A8
Text Label 9650 3950 0    50   ~ 0
A9
Text Label 9650 4050 0    50   ~ 0
A10
Text Label 9650 4150 0    50   ~ 0
A11
Text Label 9650 4250 0    50   ~ 0
A12
Text Label 9650 4350 0    50   ~ 0
A13
Text Label 9650 4450 0    50   ~ 0
A14
Text Label 9650 4550 0    50   ~ 0
A15
Text Label 10250 3050 0    50   ~ 0
D0
Text Label 10250 3150 0    50   ~ 0
D1
Text Label 10250 3250 0    50   ~ 0
D2
Text Label 10250 3350 0    50   ~ 0
D3
Text Label 10250 3450 0    50   ~ 0
D4
Text Label 10250 3550 0    50   ~ 0
D5
Text Label 10250 3650 0    50   ~ 0
D6
Text Label 10250 3750 0    50   ~ 0
D7
Text Label 10250 3850 0    50   ~ 0
RW
Text Label 10250 3950 0    50   ~ 0
CLK
Text Label 10250 4050 0    50   ~ 0
FCLK
Text Label 10250 4150 0    50   ~ 0
SCLK
Text Label 10250 4250 0    50   ~ 0
FRMBUF
Text Label 9650 4650 0    50   ~ 0
RAMCS
Text Label 9650 4750 0    50   ~ 0
ROMCS
Entry Wire Line
	9400 2450 9500 2350
Entry Wire Line
	9400 2550 9500 2450
Wire Wire Line
	9500 2350 9850 2350
Wire Wire Line
	9500 2450 9850 2450
Wire Wire Line
	9850 2450 9850 2500
Wire Wire Line
	9850 2500 10150 2500
Wire Wire Line
	10150 2500 10150 2350
Text Label 9550 2350 0    50   ~ 0
VCC
Text Label 9550 2450 0    50   ~ 0
GND
Connection ~ 9500 4950
Wire Bus Line
	9500 4950 10650 4950
Wire Bus Line
	7750 4950 7850 4950
Text Label 10250 4350 0    50   ~ 0
IRQ
Text Label 10250 4450 0    50   ~ 0
PHI1out
Text Label 10250 4550 0    50   ~ 0
PHI2out
Wire Bus Line
	7850 4950 9500 4950
Wire Bus Line
	4050 2450 4050 2800
Wire Bus Line
	6000 2450 6000 2800
Wire Bus Line
	7750 2450 7750 2800
Wire Bus Line
	2350 4950 4150 4950
Wire Bus Line
	4150 4950 6100 4950
Wire Bus Line
	6100 4950 7850 4950
Wire Bus Line
	9400 2450 9400 2800
Wire Bus Line
	2250 2150 2250 2800
Wire Bus Line
	8900 2700 8900 4850
Wire Bus Line
	7850 2700 7850 4950
Wire Bus Line
	7150 2700 7150 4850
Wire Bus Line
	6100 2700 6100 4950
Wire Bus Line
	5200 2700 5200 4850
Wire Bus Line
	4150 2700 4150 4950
Wire Bus Line
	3400 2700 3400 4850
Wire Bus Line
	2350 2700 2350 4950
Wire Bus Line
	10550 2700 10550 4850
Wire Bus Line
	9500 2700 9500 4950
Text Label 3100 4650 0    50   ~ 0
RNG
Text Label 4900 4650 0    50   ~ 0
RNG
Text Label 6850 4650 0    50   ~ 0
RNG
Text Label 8600 4650 0    50   ~ 0
RNG
Text Label 10250 4650 0    50   ~ 0
RNG
$EndSCHEMATC
