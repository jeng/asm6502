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
L 28c256:28C256 U?
U 1 1 63387EE1
P 5450 3500
F 0 "U?" H 5450 4731 50  0000 C CNN
F 1 "28C256" H 5450 4640 50  0000 C CNN
F 2 "" H 5450 3500 50  0001 C CNN
F 3 "memory/28c256.pdf" H 5450 3500 50  0001 C CNN
	1    5450 3500
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:HM62256BLP U?
U 1 1 6338947A
P 8800 3500
F 0 "U?" H 8800 4581 50  0000 C CNN
F 1 "HM62256BLP" H 8800 4490 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 8800 3400 50  0001 C CNN
F 3 "https://web.mit.edu/6.115/www/document/62256.pdf" H 8800 3400 50  0001 C CNN
	1    8800 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J?
U 1 1 63389FA6
P 1550 3350
F 0 "J?" H 1600 4467 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 1600 4376 50  0000 C CNN
F 2 "" H 1550 3350 50  0001 C CNN
F 3 "~" H 1550 3350 50  0001 C CNN
	1    1550 3350
	1    0    0    -1  
$EndComp
Entry Bus Bus
	2800 4900 2900 5000
Entry Bus Bus
	3850 4900 3950 5000
Entry Bus Bus
	6900 4900 7000 5000
Entry Bus Bus
	7700 4900 7800 5000
Entry Bus Bus
	10200 4900 10300 5000
Entry Wire Line
	700  2350 800  2450
Entry Wire Line
	700  2450 800  2550
Entry Wire Line
	700  2550 800  2650
Entry Wire Line
	700  2650 800  2750
Entry Wire Line
	700  2750 800  2850
Entry Wire Line
	700  2850 800  2950
Entry Wire Line
	700  2950 800  3050
Entry Wire Line
	700  3050 800  3150
Entry Wire Line
	700  3150 800  3250
Entry Wire Line
	700  3250 800  3350
Entry Wire Line
	700  3350 800  3450
Entry Wire Line
	700  3450 800  3550
Entry Wire Line
	700  3550 800  3650
Entry Wire Line
	700  3650 800  3750
Entry Wire Line
	700  3750 800  3850
Entry Wire Line
	700  3850 800  3950
Entry Wire Line
	700  3950 800  4050
Entry Wire Line
	700  4050 800  4150
Entry Wire Line
	700  4150 800  4250
Entry Wire Line
	700  4250 800  4350
Wire Wire Line
	800  2450 1350 2450
Wire Wire Line
	800  2550 1350 2550
Wire Wire Line
	800  2650 1350 2650
Wire Wire Line
	800  2750 1350 2750
Wire Wire Line
	800  2850 1350 2850
Wire Wire Line
	800  2950 1350 2950
Wire Wire Line
	800  3050 1350 3050
Wire Wire Line
	800  3150 1350 3150
Wire Wire Line
	800  3250 1350 3250
Wire Wire Line
	800  3350 1350 3350
Wire Wire Line
	800  3450 1350 3450
Wire Wire Line
	800  3550 1350 3550
Wire Wire Line
	800  3650 1350 3650
Wire Wire Line
	800  3750 1350 3750
Wire Wire Line
	800  3850 1350 3850
Wire Wire Line
	800  3950 1350 3950
Wire Wire Line
	800  4050 1350 4050
Wire Wire Line
	800  4150 1350 4150
Wire Wire Line
	800  4250 1350 4250
Wire Wire Line
	800  4350 1350 4350
Entry Wire Line
	2700 2450 2800 2350
Wire Wire Line
	1850 2450 2700 2450
Entry Wire Line
	2700 2550 2800 2450
Wire Wire Line
	1850 2550 2700 2550
Entry Wire Line
	2700 2650 2800 2550
Wire Wire Line
	1850 2650 2700 2650
Entry Wire Line
	2700 2750 2800 2650
Wire Wire Line
	1850 2750 2700 2750
Entry Wire Line
	2700 2850 2800 2750
Wire Wire Line
	1850 2850 2700 2850
Entry Wire Line
	2700 2950 2800 2850
Wire Wire Line
	1850 2950 2700 2950
Entry Wire Line
	2700 3050 2800 2950
Wire Wire Line
	1850 3050 2700 3050
Entry Wire Line
	2700 3150 2800 3050
Wire Wire Line
	1850 3150 2700 3150
Entry Wire Line
	2700 3250 2800 3150
Wire Wire Line
	1850 3250 2700 3250
Entry Wire Line
	2700 3350 2800 3250
Wire Wire Line
	1850 3350 2700 3350
Entry Wire Line
	2700 3450 2800 3350
Wire Wire Line
	1850 3450 2700 3450
Entry Wire Line
	2700 3550 2800 3450
Wire Wire Line
	1850 3550 2700 3550
Entry Wire Line
	2700 3650 2800 3550
Wire Wire Line
	1850 3650 2700 3650
Entry Wire Line
	2700 3750 2800 3650
Wire Wire Line
	1850 3750 2700 3750
Entry Wire Line
	2700 3850 2800 3750
Wire Wire Line
	1850 3850 2700 3850
Entry Wire Line
	2700 3950 2800 3850
Wire Wire Line
	1850 3950 2700 3950
Entry Wire Line
	2700 4050 2800 3950
Wire Wire Line
	1850 4050 2700 4050
Entry Wire Line
	2700 4150 2800 4050
Wire Wire Line
	1850 4150 2700 4150
Entry Wire Line
	2700 4250 2800 4150
Wire Wire Line
	1850 4250 2700 4250
Entry Wire Line
	2700 4350 2800 4250
Wire Wire Line
	1850 4350 2700 4350
Text Label 900  2450 0    50   ~ 0
GND
Text Label 900  2550 0    50   ~ 0
RESET
Text Label 900  2650 0    50   ~ 0
A0
Text Label 900  2750 0    50   ~ 0
A1
Text Label 900  2850 0    50   ~ 0
A2
Text Label 900  2950 0    50   ~ 0
A3
Text Label 900  3050 0    50   ~ 0
A4
Text Label 900  3150 0    50   ~ 0
A5
Text Label 900  3250 0    50   ~ 0
A6
Text Label 900  3350 0    50   ~ 0
A7
Text Label 900  3450 0    50   ~ 0
A8
Text Label 900  3550 0    50   ~ 0
A9
Text Label 900  3650 0    50   ~ 0
A10
Text Label 900  3750 0    50   ~ 0
A11
Text Label 900  3850 0    50   ~ 0
A12
Text Label 900  3950 0    50   ~ 0
A13
Text Label 900  4050 0    50   ~ 0
A14
Text Label 900  4150 0    50   ~ 0
A15
Text Label 900  4250 0    50   ~ 0
RAMCS
Text Label 900  4350 0    50   ~ 0
ROMCS
Text Label 2000 2450 0    50   ~ 0
GND
Text Label 2000 2550 0    50   ~ 0
VCC
Text Label 2000 2650 0    50   ~ 0
D0
Text Label 2000 2750 0    50   ~ 0
D1
Text Label 2000 2850 0    50   ~ 0
D2
Text Label 2000 2950 0    50   ~ 0
D3
Text Label 2000 3050 0    50   ~ 0
D4
Text Label 2000 3150 0    50   ~ 0
D5
Text Label 2000 3250 0    50   ~ 0
D6
Text Label 2000 3350 0    50   ~ 0
D7
Text Label 2000 3450 0    50   ~ 0
RW
Text Label 2000 3550 0    50   ~ 0
CLK
Text Label 2000 3650 0    50   ~ 0
FCLK
Text Label 2000 3750 0    50   ~ 0
SCLK
Text Label 2000 3850 0    50   ~ 0
FRMBUF
Text Label 2000 3950 0    50   ~ 0
IRQ
Text Label 2000 4050 0    50   ~ 0
PHI1out
Text Label 2000 4150 0    50   ~ 0
PHI2out
Text Label 2000 4250 0    50   ~ 0
RNG
Entry Wire Line
	3850 4100 3950 4200
Entry Wire Line
	3850 4300 3950 4400
Entry Wire Line
	6900 3400 6800 3300
Entry Wire Line
	6900 3300 6800 3200
Entry Wire Line
	6900 3200 6800 3100
Entry Wire Line
	6900 3100 6800 3000
Entry Wire Line
	6900 3000 6800 2900
Entry Wire Line
	6900 2900 6800 2800
Entry Wire Line
	6900 2800 6800 2700
Entry Wire Line
	6900 2700 6800 2600
Text Label 4100 2600 0    50   ~ 0
A0
Text Label 4100 2700 0    50   ~ 0
A1
Text Label 4100 2800 0    50   ~ 0
A2
Text Label 4100 2900 0    50   ~ 0
A3
Text Label 4100 3000 0    50   ~ 0
A4
Text Label 4100 3100 0    50   ~ 0
A5
Text Label 4100 3200 0    50   ~ 0
A6
Text Label 4100 3300 0    50   ~ 0
A7
Text Label 4100 3400 0    50   ~ 0
A8
Text Label 4100 3500 0    50   ~ 0
A9
Text Label 4100 3600 0    50   ~ 0
A10
Text Label 4100 3700 0    50   ~ 0
A11
Text Label 4100 3800 0    50   ~ 0
A12
Text Label 4100 3900 0    50   ~ 0
A13
Text Label 4100 4000 0    50   ~ 0
A14
Wire Wire Line
	6150 2600 6800 2600
Wire Wire Line
	6150 2700 6800 2700
Wire Wire Line
	6150 2800 6800 2800
Wire Wire Line
	6150 2900 6800 2900
Wire Wire Line
	6150 3000 6800 3000
Wire Wire Line
	6150 3100 6800 3100
Wire Wire Line
	6150 3200 6800 3200
Wire Wire Line
	6150 3300 6800 3300
Text Label 6150 2600 0    50   ~ 0
D0
Text Label 6150 2700 0    50   ~ 0
D1
Text Label 6150 2800 0    50   ~ 0
D2
Text Label 6150 2900 0    50   ~ 0
D3
Text Label 6150 3000 0    50   ~ 0
D4
Text Label 6150 3100 0    50   ~ 0
D5
Text Label 6150 3200 0    50   ~ 0
D6
Text Label 6150 3300 0    50   ~ 0
D7
Wire Wire Line
	4750 4200 4650 4200
Text Label 4100 4200 0    50   ~ 0
VCC
Wire Wire Line
	3950 4400 4750 4400
Text Label 4100 4400 0    50   ~ 0
ROMCS
Wire Wire Line
	3950 3900 4750 3900
Wire Wire Line
	3950 3800 4750 3800
Wire Wire Line
	3950 3700 4750 3700
Wire Wire Line
	3950 3600 4750 3600
Wire Wire Line
	3950 3500 4750 3500
Wire Wire Line
	3950 3400 4750 3400
Wire Wire Line
	3950 3300 4750 3300
Wire Wire Line
	3950 3200 4750 3200
Wire Wire Line
	3950 3100 4750 3100
Wire Wire Line
	3950 3000 4750 3000
Wire Wire Line
	3950 2900 4750 2900
Wire Wire Line
	3950 2800 4750 2800
Wire Wire Line
	3950 2700 4750 2700
Wire Wire Line
	3950 2600 4750 2600
Entry Wire Line
	3850 3900 3950 4000
Entry Wire Line
	3850 3800 3950 3900
Entry Wire Line
	3850 3700 3950 3800
Entry Wire Line
	3850 3600 3950 3700
Entry Wire Line
	3850 3500 3950 3600
Entry Wire Line
	3850 3400 3950 3500
Entry Wire Line
	3850 3300 3950 3400
Entry Wire Line
	3850 3200 3950 3300
Entry Wire Line
	3850 3100 3950 3200
Entry Wire Line
	3850 3000 3950 3100
Entry Wire Line
	3850 2900 3950 3000
Entry Wire Line
	3850 2800 3950 2900
Entry Wire Line
	3850 2700 3950 2800
Entry Wire Line
	3850 2600 3950 2700
Entry Wire Line
	3850 2500 3950 2600
Entry Wire Line
	7700 4100 7800 4200
Entry Wire Line
	7700 4000 7800 4100
Entry Wire Line
	7700 3900 7800 4000
Entry Wire Line
	7700 3800 7800 3900
Entry Wire Line
	7700 3700 7800 3800
Entry Wire Line
	7700 3600 7800 3700
Entry Wire Line
	7700 3500 7800 3600
Entry Wire Line
	7700 3400 7800 3500
Entry Wire Line
	7700 3300 7800 3400
Entry Wire Line
	7700 3200 7800 3300
Entry Wire Line
	7700 3100 7800 3200
Entry Wire Line
	7700 3000 7800 3100
Entry Wire Line
	7700 2900 7800 3000
Entry Wire Line
	7700 2800 7800 2900
Entry Wire Line
	7700 2700 7800 2800
Wire Wire Line
	3950 4000 4750 4000
Entry Wire Line
	3850 4200 3950 4300
Wire Wire Line
	3950 4300 4600 4300
Text Label 4100 4300 0    50   ~ 0
GND
Wire Wire Line
	4600 4300 4600 4550
Wire Wire Line
	4600 4550 4950 4550
Connection ~ 4600 4300
Wire Wire Line
	4600 4300 4750 4300
Wire Wire Line
	4650 4200 4650 2450
Wire Wire Line
	4650 2450 5450 2450
Connection ~ 4650 4200
Wire Wire Line
	4650 4200 4450 4200
Wire Wire Line
	7800 2800 8300 2800
Wire Wire Line
	7800 2900 8300 2900
Wire Wire Line
	7800 3000 8300 3000
Wire Wire Line
	7800 3100 8300 3100
Wire Wire Line
	7800 3200 8300 3200
Wire Wire Line
	7800 3300 8300 3300
Wire Wire Line
	7800 3400 8300 3400
Wire Wire Line
	7800 3500 8300 3500
Wire Wire Line
	7800 3600 8300 3600
Wire Wire Line
	7800 3700 8300 3700
Wire Wire Line
	7800 3800 8300 3800
Wire Wire Line
	7800 3900 8300 3900
Wire Wire Line
	7800 4000 8300 4000
Wire Wire Line
	7800 4100 8300 4100
Wire Wire Line
	7800 4200 8150 4200
Text Label 7900 2800 0    50   ~ 0
A0
Text Label 7900 2900 0    50   ~ 0
A1
Text Label 7900 3000 0    50   ~ 0
A2
Text Label 7900 3100 0    50   ~ 0
A3
Text Label 7900 3200 0    50   ~ 0
A4
Text Label 7900 3300 0    50   ~ 0
A5
Text Label 7900 3400 0    50   ~ 0
A6
Text Label 7900 3500 0    50   ~ 0
A7
Text Label 7900 3600 0    50   ~ 0
A8
Text Label 7900 3700 0    50   ~ 0
A9
Text Label 7900 3800 0    50   ~ 0
A10
Text Label 7900 3900 0    50   ~ 0
A11
Text Label 7900 4000 0    50   ~ 0
A12
Text Label 7900 4100 0    50   ~ 0
A13
Text Label 7900 4200 0    50   ~ 0
A14
Entry Wire Line
	10100 2800 10200 2900
Wire Wire Line
	10100 2800 9300 2800
Entry Wire Line
	10100 2900 10200 3000
Wire Wire Line
	10100 2900 9300 2900
Entry Wire Line
	10100 3000 10200 3100
Wire Wire Line
	10100 3000 9300 3000
Entry Wire Line
	10100 3100 10200 3200
Wire Wire Line
	10100 3100 9300 3100
Entry Wire Line
	10100 3200 10200 3300
Wire Wire Line
	10100 3200 9300 3200
Entry Wire Line
	10100 3300 10200 3400
Wire Wire Line
	10100 3300 9300 3300
Entry Wire Line
	10100 3400 10200 3500
Wire Wire Line
	10100 3400 9300 3400
Entry Wire Line
	10100 3500 10200 3600
Wire Wire Line
	10100 3500 9300 3500
Entry Wire Line
	10100 3900 10200 4000
Wire Wire Line
	10100 3900 9450 3900
Entry Wire Line
	10100 4000 10200 4100
Wire Wire Line
	10100 4000 9300 4000
Entry Wire Line
	10100 3700 10200 3800
Wire Wire Line
	10100 3700 9300 3700
Text Label 9400 2800 0    50   ~ 0
D0
Text Label 9400 2900 0    50   ~ 0
D1
Text Label 9400 3000 0    50   ~ 0
D2
Text Label 9400 3100 0    50   ~ 0
D3
Text Label 9400 3200 0    50   ~ 0
D4
Text Label 9400 3300 0    50   ~ 0
D5
Text Label 9400 3400 0    50   ~ 0
D6
Text Label 9400 3500 0    50   ~ 0
D7
Text Label 9400 3700 0    50   ~ 0
RAMCS
Wire Wire Line
	8150 4200 8150 4550
Wire Wire Line
	8150 4550 8400 4550
Wire Wire Line
	9450 4550 9450 3900
Connection ~ 8150 4200
Wire Wire Line
	8150 4200 8300 4200
Connection ~ 9450 3900
Wire Wire Line
	9450 3900 9300 3900
Text Label 9500 4000 0    50   ~ 0
RW
Entry Wire Line
	7700 4300 7800 4400
Wire Wire Line
	8800 4400 7800 4400
Text Label 7900 4400 0    50   ~ 0
GND
Entry Wire Line
	7700 2500 7800 2600
Wire Wire Line
	7800 2600 8050 2600
Text Label 7900 2600 0    50   ~ 0
VCC
$Comp
L Device:C C?
U 1 1 63501102
P 4650 4700
F 0 "C?" V 4398 4700 50  0000 C CNN
F 1 "0.1uF" V 4489 4700 50  0000 C CNN
F 2 "" H 4688 4550 50  0001 C CNN
F 3 "~" H 4650 4700 50  0001 C CNN
	1    4650 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 4200 4450 4700
Wire Wire Line
	4450 4700 4500 4700
Connection ~ 4450 4200
Wire Wire Line
	4450 4200 3950 4200
Wire Wire Line
	4800 4700 4950 4700
Wire Wire Line
	4950 4700 4950 4550
Connection ~ 4950 4550
Wire Wire Line
	4950 4550 5450 4550
$Comp
L Device:C C?
U 1 1 6350C827
P 8250 4750
F 0 "C?" V 7998 4750 50  0000 C CNN
F 1 "C" V 8089 4750 50  0000 C CNN
F 2 "" H 8288 4600 50  0001 C CNN
F 3 "~" H 8250 4750 50  0001 C CNN
	1    8250 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 2600 8050 4750
Wire Wire Line
	8050 4750 8100 4750
Connection ~ 8050 2600
Wire Wire Line
	8050 2600 8800 2600
Wire Wire Line
	8400 4750 8400 4550
Wire Bus Line
	700  5000 10700 5000
Wire Bus Line
	6900 2250 6900 4900
Wire Bus Line
	10200 2200 10200 4900
Wire Bus Line
	7700 2200 7700 4900
Wire Bus Line
	2800 2300 2800 4900
Wire Bus Line
	700  2300 700  5000
Wire Bus Line
	3850 2250 3850 4900
Connection ~ 8400 4550
Wire Wire Line
	8400 4550 9450 4550
$EndSCHEMATC
