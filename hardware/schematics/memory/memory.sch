EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "M6502 Memory Card"
Date "2022-10-01"
Rev "1"
Comp "Jeremy English jhe@jeremyenglish.org"
Comment1 "Hardware version of the 6502 XScreenSaver Module"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 28c256:28C256 U1
U 1 1 63387EE1
P 5350 3500
F 0 "U1" H 5350 4731 50  0000 C CNN
F 1 "28C256" H 5350 4640 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 5350 3500 50  0001 C CNN
F 3 "memory/28c256.pdf" H 5350 3500 50  0001 C CNN
	1    5350 3500
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:HM62256BLP U2
U 1 1 6338947A
P 8200 3500
F 0 "U2" H 8200 4581 50  0000 C CNN
F 1 "HM62256BLP" H 8200 4490 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 8200 3400 50  0001 C CNN
F 3 "https://web.mit.edu/6.115/www/document/62256.pdf" H 8200 3400 50  0001 C CNN
	1    8200 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J1
U 1 1 63389FA6
P 2100 3350
F 0 "J1" H 2100 2200 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 2100 2100 50  0000 C CNN
F 2 "m6502:PinHeader_2x20_P2.54mm_Horizontal_Counter_Clockwise" H 2100 3350 50  0001 C CNN
F 3 "~" H 2100 3350 50  0001 C CNN
	1    2100 3350
	1    0    0    -1  
$EndComp
Entry Bus Bus
	3350 4900 3450 5000
Entry Bus Bus
	3750 4900 3850 5000
Entry Bus Bus
	6800 4900 6900 5000
Entry Bus Bus
	7100 4900 7200 5000
Entry Bus Bus
	9600 4900 9700 5000
Entry Wire Line
	1250 2350 1350 2450
Entry Wire Line
	1250 2550 1350 2650
Entry Wire Line
	1250 2650 1350 2750
Entry Wire Line
	1250 2750 1350 2850
Entry Wire Line
	1250 2850 1350 2950
Entry Wire Line
	1250 2950 1350 3050
Entry Wire Line
	1250 3050 1350 3150
Entry Wire Line
	1250 3150 1350 3250
Entry Wire Line
	1250 3250 1350 3350
Entry Wire Line
	1250 3350 1350 3450
Entry Wire Line
	1250 3450 1350 3550
Entry Wire Line
	1250 3550 1350 3650
Entry Wire Line
	1250 3650 1350 3750
Entry Wire Line
	1250 3750 1350 3850
Entry Wire Line
	1250 3850 1350 3950
Entry Wire Line
	1250 3950 1350 4050
Entry Wire Line
	1250 4150 1350 4250
Entry Wire Line
	1250 4250 1350 4350
Wire Wire Line
	1350 2450 1900 2450
Wire Wire Line
	1350 2650 1900 2650
Wire Wire Line
	1350 2750 1900 2750
Wire Wire Line
	1350 2850 1900 2850
Wire Wire Line
	1350 2950 1900 2950
Wire Wire Line
	1350 3050 1900 3050
Wire Wire Line
	1350 3150 1900 3150
Wire Wire Line
	1350 3250 1900 3250
Wire Wire Line
	1350 3350 1900 3350
Wire Wire Line
	1350 3450 1900 3450
Wire Wire Line
	1350 3550 1900 3550
Wire Wire Line
	1350 3650 1900 3650
Wire Wire Line
	1350 3750 1900 3750
Wire Wire Line
	1350 3850 1900 3850
Wire Wire Line
	1350 3950 1900 3950
Wire Wire Line
	1350 4050 1900 4050
Wire Wire Line
	1350 4250 1900 4250
Wire Wire Line
	1350 4350 1900 4350
Entry Wire Line
	3250 2450 3350 2350
Wire Wire Line
	2400 2450 2950 2450
Entry Wire Line
	3250 2550 3350 2450
Wire Wire Line
	2400 2550 2800 2550
Entry Wire Line
	3250 2650 3350 2550
Wire Wire Line
	2400 2650 3250 2650
Entry Wire Line
	3250 2750 3350 2650
Wire Wire Line
	2400 2750 3250 2750
Entry Wire Line
	3250 2850 3350 2750
Wire Wire Line
	2400 2850 3250 2850
Entry Wire Line
	3250 2950 3350 2850
Wire Wire Line
	2400 2950 3250 2950
Entry Wire Line
	3250 3050 3350 2950
Wire Wire Line
	2400 3050 3250 3050
Entry Wire Line
	3250 3150 3350 3050
Wire Wire Line
	2400 3150 3250 3150
Entry Wire Line
	3250 3250 3350 3150
Wire Wire Line
	2400 3250 3250 3250
Entry Wire Line
	3250 3350 3350 3250
Wire Wire Line
	2400 3350 3250 3350
Entry Wire Line
	3250 3450 3350 3350
Wire Wire Line
	2400 3450 3250 3450
Text Label 1450 2450 0    50   ~ 0
GND
Text Label 1450 2550 0    50   ~ 0
RESET
Text Label 1450 2650 0    50   ~ 0
A0
Text Label 1450 2750 0    50   ~ 0
A1
Text Label 1450 2850 0    50   ~ 0
A2
Text Label 1450 2950 0    50   ~ 0
A3
Text Label 1450 3050 0    50   ~ 0
A4
Text Label 1450 3150 0    50   ~ 0
A5
Text Label 1450 3250 0    50   ~ 0
A6
Text Label 1450 3350 0    50   ~ 0
A7
Text Label 1450 3450 0    50   ~ 0
A8
Text Label 1450 3550 0    50   ~ 0
A9
Text Label 1450 3650 0    50   ~ 0
A10
Text Label 1450 3750 0    50   ~ 0
A11
Text Label 1450 3850 0    50   ~ 0
A12
Text Label 1450 3950 0    50   ~ 0
A13
Text Label 1450 4050 0    50   ~ 0
A14
Text Label 1450 4150 0    50   ~ 0
A15
Text Label 1450 4250 0    50   ~ 0
RAMCS
Text Label 1450 4350 0    50   ~ 0
ROMCS
Text Label 2550 2450 0    50   ~ 0
GND
Text Label 2550 2550 0    50   ~ 0
VCC
Text Label 2550 2650 0    50   ~ 0
D0
Text Label 2550 2750 0    50   ~ 0
D1
Text Label 2550 2850 0    50   ~ 0
D2
Text Label 2550 2950 0    50   ~ 0
D3
Text Label 2550 3050 0    50   ~ 0
D4
Text Label 2550 3150 0    50   ~ 0
D5
Text Label 2550 3250 0    50   ~ 0
D6
Text Label 2550 3350 0    50   ~ 0
D7
Text Label 2550 3450 0    50   ~ 0
RW
Text Label 2550 3550 0    50   ~ 0
CLK
Text Label 2550 3650 0    50   ~ 0
FCLK
Text Label 2550 3750 0    50   ~ 0
SCLK
Text Label 2550 3850 0    50   ~ 0
FRMBUF
Text Label 2550 3950 0    50   ~ 0
IRQ
Text Label 2550 4050 0    50   ~ 0
PHI1out
Text Label 2550 4150 0    50   ~ 0
PHI2out
Text Label 2550 4250 0    50   ~ 0
RNG
Entry Wire Line
	3750 4100 3850 4200
Entry Wire Line
	3750 4300 3850 4400
Entry Wire Line
	6800 3400 6700 3300
Entry Wire Line
	6800 3300 6700 3200
Entry Wire Line
	6800 3200 6700 3100
Entry Wire Line
	6800 3100 6700 3000
Entry Wire Line
	6800 3000 6700 2900
Entry Wire Line
	6800 2900 6700 2800
Entry Wire Line
	6800 2800 6700 2700
Entry Wire Line
	6800 2700 6700 2600
Text Label 4000 2600 0    50   ~ 0
A0
Text Label 4000 2700 0    50   ~ 0
A1
Text Label 4000 2800 0    50   ~ 0
A2
Text Label 4000 2900 0    50   ~ 0
A3
Text Label 4000 3000 0    50   ~ 0
A4
Text Label 4000 3100 0    50   ~ 0
A5
Text Label 4000 3200 0    50   ~ 0
A6
Text Label 4000 3300 0    50   ~ 0
A7
Text Label 4000 3400 0    50   ~ 0
A8
Text Label 4000 3500 0    50   ~ 0
A9
Text Label 4000 3600 0    50   ~ 0
A10
Text Label 4000 3700 0    50   ~ 0
A11
Text Label 4000 3800 0    50   ~ 0
A12
Text Label 4000 3900 0    50   ~ 0
A13
Text Label 4000 4000 0    50   ~ 0
A14
Wire Wire Line
	6050 2600 6700 2600
Wire Wire Line
	6050 2700 6700 2700
Wire Wire Line
	6050 2800 6700 2800
Wire Wire Line
	6050 2900 6700 2900
Wire Wire Line
	6050 3000 6700 3000
Wire Wire Line
	6050 3100 6700 3100
Wire Wire Line
	6050 3200 6700 3200
Wire Wire Line
	6050 3300 6700 3300
Text Label 6050 2600 0    50   ~ 0
D0
Text Label 6050 2700 0    50   ~ 0
D1
Text Label 6050 2800 0    50   ~ 0
D2
Text Label 6050 2900 0    50   ~ 0
D3
Text Label 6050 3000 0    50   ~ 0
D4
Text Label 6050 3100 0    50   ~ 0
D5
Text Label 6050 3200 0    50   ~ 0
D6
Text Label 6050 3300 0    50   ~ 0
D7
Wire Wire Line
	4650 4200 4550 4200
Text Label 4000 4200 0    50   ~ 0
VCC
Wire Wire Line
	3850 4400 4650 4400
Text Label 4000 4400 0    50   ~ 0
ROMCS
Wire Wire Line
	3850 3900 4650 3900
Wire Wire Line
	3850 3800 4650 3800
Wire Wire Line
	3850 3700 4650 3700
Wire Wire Line
	3850 3600 4650 3600
Wire Wire Line
	3850 3500 4650 3500
Wire Wire Line
	3850 3400 4650 3400
Wire Wire Line
	3850 3300 4650 3300
Wire Wire Line
	3850 3200 4650 3200
Wire Wire Line
	3850 3100 4650 3100
Wire Wire Line
	3850 3000 4650 3000
Wire Wire Line
	3850 2900 4650 2900
Wire Wire Line
	3850 2800 4650 2800
Wire Wire Line
	3850 2700 4650 2700
Wire Wire Line
	3850 2600 4650 2600
Entry Wire Line
	3750 3900 3850 4000
Entry Wire Line
	3750 3800 3850 3900
Entry Wire Line
	3750 3700 3850 3800
Entry Wire Line
	3750 3600 3850 3700
Entry Wire Line
	3750 3500 3850 3600
Entry Wire Line
	3750 3400 3850 3500
Entry Wire Line
	3750 3300 3850 3400
Entry Wire Line
	3750 3200 3850 3300
Entry Wire Line
	3750 3100 3850 3200
Entry Wire Line
	3750 3000 3850 3100
Entry Wire Line
	3750 2900 3850 3000
Entry Wire Line
	3750 2800 3850 2900
Entry Wire Line
	3750 2700 3850 2800
Entry Wire Line
	3750 2600 3850 2700
Entry Wire Line
	3750 2500 3850 2600
Entry Wire Line
	7100 4100 7200 4200
Entry Wire Line
	7100 4000 7200 4100
Entry Wire Line
	7100 3900 7200 4000
Entry Wire Line
	7100 3800 7200 3900
Entry Wire Line
	7100 3700 7200 3800
Entry Wire Line
	7100 3600 7200 3700
Entry Wire Line
	7100 3500 7200 3600
Entry Wire Line
	7100 3400 7200 3500
Entry Wire Line
	7100 3300 7200 3400
Entry Wire Line
	7100 3200 7200 3300
Entry Wire Line
	7100 3100 7200 3200
Entry Wire Line
	7100 3000 7200 3100
Entry Wire Line
	7100 2900 7200 3000
Entry Wire Line
	7100 2800 7200 2900
Entry Wire Line
	7100 2700 7200 2800
Wire Wire Line
	3850 4000 4650 4000
Entry Wire Line
	3750 4200 3850 4300
Wire Wire Line
	3850 4300 4500 4300
Text Label 4000 4300 0    50   ~ 0
GND
Wire Wire Line
	4500 4300 4500 4550
Wire Wire Line
	4500 4550 4850 4550
Connection ~ 4500 4300
Wire Wire Line
	4500 4300 4650 4300
Wire Wire Line
	4550 4200 4550 2450
Wire Wire Line
	4550 2450 5350 2450
Connection ~ 4550 4200
Wire Wire Line
	4550 4200 4350 4200
Wire Wire Line
	7200 2800 7700 2800
Wire Wire Line
	7200 2900 7700 2900
Wire Wire Line
	7200 3000 7700 3000
Wire Wire Line
	7200 3100 7700 3100
Wire Wire Line
	7200 3200 7700 3200
Wire Wire Line
	7200 3300 7700 3300
Wire Wire Line
	7200 3400 7700 3400
Wire Wire Line
	7200 3500 7700 3500
Wire Wire Line
	7200 3600 7700 3600
Wire Wire Line
	7200 3700 7700 3700
Wire Wire Line
	7200 3800 7700 3800
Wire Wire Line
	7200 3900 7700 3900
Wire Wire Line
	7200 4000 7700 4000
Wire Wire Line
	7200 4100 7700 4100
Wire Wire Line
	7200 4200 7550 4200
Text Label 7300 2800 0    50   ~ 0
A0
Text Label 7300 2900 0    50   ~ 0
A1
Text Label 7300 3000 0    50   ~ 0
A2
Text Label 7300 3100 0    50   ~ 0
A3
Text Label 7300 3200 0    50   ~ 0
A4
Text Label 7300 3300 0    50   ~ 0
A5
Text Label 7300 3400 0    50   ~ 0
A6
Text Label 7300 3500 0    50   ~ 0
A7
Text Label 7300 3600 0    50   ~ 0
A8
Text Label 7300 3700 0    50   ~ 0
A9
Text Label 7300 3800 0    50   ~ 0
A10
Text Label 7300 3900 0    50   ~ 0
A11
Text Label 7300 4000 0    50   ~ 0
A12
Text Label 7300 4100 0    50   ~ 0
A13
Text Label 7300 4200 0    50   ~ 0
A14
Entry Wire Line
	9500 2800 9600 2900
Wire Wire Line
	9500 2800 8700 2800
Entry Wire Line
	9500 2900 9600 3000
Wire Wire Line
	9500 2900 8700 2900
Entry Wire Line
	9500 3000 9600 3100
Wire Wire Line
	9500 3000 8700 3000
Entry Wire Line
	9500 3100 9600 3200
Wire Wire Line
	9500 3100 8700 3100
Entry Wire Line
	9500 3200 9600 3300
Wire Wire Line
	9500 3200 8700 3200
Entry Wire Line
	9500 3300 9600 3400
Wire Wire Line
	9500 3300 8700 3300
Entry Wire Line
	9500 3400 9600 3500
Wire Wire Line
	9500 3400 8700 3400
Entry Wire Line
	9500 3500 9600 3600
Wire Wire Line
	9500 3500 8700 3500
Entry Wire Line
	9500 3900 9600 4000
Wire Wire Line
	9500 3900 8850 3900
Entry Wire Line
	9500 4000 9600 4100
Wire Wire Line
	9500 4000 8700 4000
Entry Wire Line
	9500 3700 9600 3800
Wire Wire Line
	9500 3700 8700 3700
Text Label 8800 2800 0    50   ~ 0
D0
Text Label 8800 2900 0    50   ~ 0
D1
Text Label 8800 3000 0    50   ~ 0
D2
Text Label 8800 3100 0    50   ~ 0
D3
Text Label 8800 3200 0    50   ~ 0
D4
Text Label 8800 3300 0    50   ~ 0
D5
Text Label 8800 3400 0    50   ~ 0
D6
Text Label 8800 3500 0    50   ~ 0
D7
Text Label 8800 3700 0    50   ~ 0
RAMCS
Wire Wire Line
	7550 4200 7550 4550
Wire Wire Line
	7550 4550 7800 4550
Wire Wire Line
	8850 4550 8850 3900
Connection ~ 7550 4200
Wire Wire Line
	7550 4200 7700 4200
Connection ~ 8850 3900
Wire Wire Line
	8850 3900 8700 3900
Text Label 8900 4000 0    50   ~ 0
RW
Entry Wire Line
	7100 4300 7200 4400
Wire Wire Line
	8200 4400 7200 4400
Text Label 7300 4400 0    50   ~ 0
GND
Entry Wire Line
	7100 2500 7200 2600
Wire Wire Line
	7200 2600 7450 2600
Text Label 7300 2600 0    50   ~ 0
VCC
$Comp
L Device:C C1
U 1 1 63501102
P 4550 4700
F 0 "C1" V 4298 4700 50  0000 C CNN
F 1 "0.1uF" V 4389 4700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4588 4550 50  0001 C CNN
F 3 "~" H 4550 4700 50  0001 C CNN
	1    4550 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 4200 4350 4700
Wire Wire Line
	4350 4700 4400 4700
Connection ~ 4350 4200
Wire Wire Line
	4350 4200 3850 4200
Wire Wire Line
	4700 4700 4850 4700
Wire Wire Line
	4850 4700 4850 4550
Connection ~ 4850 4550
Wire Wire Line
	4850 4550 5350 4550
$Comp
L Device:C C2
U 1 1 6350C827
P 7650 4750
F 0 "C2" V 7398 4750 50  0000 C CNN
F 1 "0.1uF" V 7489 4750 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 7688 4600 50  0001 C CNN
F 3 "~" H 7650 4750 50  0001 C CNN
	1    7650 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 2600 7450 4750
Wire Wire Line
	7450 4750 7500 4750
Connection ~ 7450 2600
Wire Wire Line
	7450 2600 8200 2600
Wire Wire Line
	7800 4750 7800 4550
Connection ~ 7800 4550
Wire Wire Line
	7800 4550 8850 4550
$Comp
L power:PWR_FLAG #FLG02
U 1 1 633C0D61
P 2950 2450
F 0 "#FLG02" H 2950 2525 50  0001 C CNN
F 1 "PWR_FLAG" H 2700 2550 50  0000 C CNN
F 2 "" H 2950 2450 50  0001 C CNN
F 3 "~" H 2950 2450 50  0001 C CNN
	1    2950 2450
	1    0    0    -1  
$EndComp
Connection ~ 2950 2450
Wire Wire Line
	2950 2450 3100 2450
$Comp
L power:GND #PWR02
U 1 1 633C1330
P 3100 2450
F 0 "#PWR02" H 3100 2200 50  0001 C CNN
F 1 "GND" H 3000 2350 50  0000 C CNN
F 2 "" H 3100 2450 50  0001 C CNN
F 3 "" H 3100 2450 50  0001 C CNN
	1    3100 2450
	-1   0    0    1   
$EndComp
Connection ~ 3100 2450
Wire Wire Line
	3100 2450 3250 2450
$Comp
L power:+5V #PWR01
U 1 1 633C1B8D
P 2750 2550
F 0 "#PWR01" H 2750 2400 50  0001 C CNN
F 1 "+5V" H 2750 2500 50  0000 C CNN
F 2 "" H 2750 2550 50  0001 C CNN
F 3 "" H 2750 2550 50  0001 C CNN
	1    2750 2550
	1    0    0    -1  
$EndComp
Connection ~ 2750 2550
Wire Wire Line
	2800 2550 2850 2550
NoConn ~ 2400 3550
NoConn ~ 2400 3650
NoConn ~ 2400 3750
NoConn ~ 2400 3850
NoConn ~ 2400 3950
NoConn ~ 2400 4050
NoConn ~ 2400 4150
NoConn ~ 2400 4250
NoConn ~ 2400 4350
NoConn ~ 1900 4150
NoConn ~ 1900 2550
Wire Bus Line
	1250 5000 9700 5000
Wire Bus Line
	3350 2300 3350 4900
Wire Bus Line
	6800 2250 6800 4900
Wire Bus Line
	9600 2200 9600 4900
Wire Bus Line
	7100 2200 7100 4900
Wire Bus Line
	1250 2300 1250 5000
Wire Bus Line
	3750 2250 3750 4900
$Comp
L power:PWR_FLAG #FLG01
U 1 1 6340AEA7
P 2850 2550
F 0 "#FLG01" H 2850 2625 50  0001 C CNN
F 1 "PWR_FLAG" H 3050 2500 50  0000 C CNN
F 2 "" H 2850 2550 50  0001 C CNN
F 3 "~" H 2850 2550 50  0001 C CNN
	1    2850 2550
	1    0    0    -1  
$EndComp
Connection ~ 2850 2550
Wire Wire Line
	2850 2550 3250 2550
$EndSCHEMATC
