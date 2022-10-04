EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "M6502 Address Logic Card"
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
U 1 1 6336468B
P 1200 2450
F 0 "J1" H 1250 3567 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 1250 3476 50  0000 C CNN
F 2 "m6502:PinHeader_2x20_P2.54mm_Horizontal_Counter_Clockwise" H 1200 2450 50  0001 C CNN
F 3 "~" H 1200 2450 50  0001 C CNN
	1    1200 2450
	1    0    0    -1  
$EndComp
Entry Wire Line
	750  1450 850  1550
Entry Wire Line
	750  1850 850  1950
Entry Wire Line
	750  1950 850  2050
Entry Wire Line
	750  2050 850  2150
Entry Wire Line
	750  2150 850  2250
Entry Wire Line
	750  2250 850  2350
Entry Wire Line
	750  2350 850  2450
Entry Wire Line
	750  2450 850  2550
Entry Wire Line
	750  2550 850  2650
Entry Wire Line
	750  2650 850  2750
Entry Wire Line
	750  2750 850  2850
Entry Wire Line
	750  2850 850  2950
Entry Wire Line
	750  2950 850  3050
Entry Wire Line
	750  3050 850  3150
Entry Wire Line
	750  3150 850  3250
Entry Wire Line
	750  3250 850  3350
Entry Wire Line
	750  3350 850  3450
Wire Wire Line
	850  1550 950  1550
Wire Wire Line
	850  1950 1000 1950
Wire Wire Line
	850  2050 1000 2050
Wire Wire Line
	850  2150 1000 2150
Wire Wire Line
	850  2250 1000 2250
Wire Wire Line
	850  2350 1000 2350
Wire Wire Line
	850  2450 1000 2450
Wire Wire Line
	850  2550 1000 2550
Wire Wire Line
	850  2650 1000 2650
Wire Wire Line
	850  2750 1000 2750
Wire Wire Line
	850  2850 1000 2850
Wire Wire Line
	850  2950 1000 2950
Wire Wire Line
	850  3050 1000 3050
Wire Wire Line
	850  3150 1000 3150
Wire Wire Line
	850  3250 1000 3250
Wire Wire Line
	850  3350 1000 3350
Wire Wire Line
	850  3450 1000 3450
Text Label 850  1550 0    50   ~ 0
GND
Text Label 850  1650 0    50   ~ 0
RESET
Text Label 850  1750 0    50   ~ 0
A0
Text Label 850  1850 0    50   ~ 0
A1
Text Label 850  1950 0    50   ~ 0
A2
Text Label 850  2050 0    50   ~ 0
A3
Text Label 850  2150 0    50   ~ 0
A4
Text Label 850  2250 0    50   ~ 0
A5
Text Label 850  2350 0    50   ~ 0
A6
Text Label 850  2450 0    50   ~ 0
A7
Text Label 850  2550 0    50   ~ 0
A8
Text Label 850  2650 0    50   ~ 0
A9
Text Label 850  2750 0    50   ~ 0
A10
Text Label 850  2850 0    50   ~ 0
A11
Text Label 850  2950 0    50   ~ 0
A12
Text Label 850  3050 0    50   ~ 0
A13
Text Label 850  3150 0    50   ~ 0
A14
Text Label 850  3250 0    50   ~ 0
A15
Text Label 850  3350 0    50   ~ 0
RAMCS
Text Label 850  3450 0    50   ~ 0
ROMCS
Entry Bus Bus
	1700 4100 1800 4200
Entry Wire Line
	1600 1550 1700 1450
Entry Wire Line
	1600 1650 1700 1550
Entry Wire Line
	1600 2650 1700 2550
Entry Wire Line
	1600 2750 1700 2650
Entry Wire Line
	1600 2850 1700 2750
Entry Wire Line
	1600 2950 1700 2850
Entry Wire Line
	1600 3350 1700 3250
Wire Wire Line
	1500 1550 1550 1550
Wire Wire Line
	1500 1650 1550 1650
Wire Wire Line
	1500 2650 1600 2650
Wire Wire Line
	1500 2750 1600 2750
Wire Wire Line
	1500 2850 1600 2850
Wire Wire Line
	1500 2950 1600 2950
Wire Wire Line
	1500 3350 1600 3350
Text Label 1500 1550 0    50   ~ 0
GND
Text Label 1500 1650 0    50   ~ 0
VCC
Text Label 1500 1750 0    50   ~ 0
D0
Text Label 1500 1850 0    50   ~ 0
D1
Text Label 1500 1950 0    50   ~ 0
D2
Text Label 1500 2050 0    50   ~ 0
D3
Text Label 1500 2150 0    50   ~ 0
D4
Text Label 1500 2250 0    50   ~ 0
D5
Text Label 1500 2350 0    50   ~ 0
D6
Text Label 1500 2450 0    50   ~ 0
D7
Text Label 1500 2550 0    50   ~ 0
RW
Text Label 1500 2650 0    50   ~ 0
CLK
Text Label 1500 2750 0    50   ~ 0
FCLK
Text Label 1500 2850 0    50   ~ 0
SCLK
Text Label 1500 2950 0    50   ~ 0
FRMBUF
Text Label 1500 3050 0    50   ~ 0
IRQ
Text Label 1500 3150 0    50   ~ 0
PH1out
Text Label 1500 3250 0    50   ~ 0
PH2out
Entry Bus Bus
	750  4100 850  4200
$Comp
L 74xx:74LS14 U4
U 1 1 636D5D0E
P 2800 1500
F 0 "U4" H 2800 1817 50  0000 C CNN
F 1 "74LS14" H 2800 1726 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2800 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 2800 1500 50  0001 C CNN
	1    2800 1500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U4
U 2 1 636D7584
P 2800 2050
F 0 "U4" H 2800 2367 50  0000 C CNN
F 1 "74LS14" H 2800 2276 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2800 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 2800 2050 50  0001 C CNN
	2    2800 2050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U4
U 3 1 636D83C0
P 2800 2550
F 0 "U4" H 2800 2867 50  0000 C CNN
F 1 "74LS14" H 2800 2776 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2800 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 2800 2550 50  0001 C CNN
	3    2800 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U4
U 4 1 636D8DD2
P 2800 3050
F 0 "U4" H 2800 3367 50  0000 C CNN
F 1 "74LS14" H 2800 3276 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2800 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 2800 3050 50  0001 C CNN
	4    2800 3050
	1    0    0    -1  
$EndComp
Entry Wire Line
	2250 1400 2350 1500
Entry Wire Line
	2250 1950 2350 2050
Entry Wire Line
	2250 2450 2350 2550
Entry Wire Line
	2250 2950 2350 3050
Wire Wire Line
	2350 1500 2500 1500
Wire Wire Line
	2350 2050 2500 2050
Wire Wire Line
	2350 2550 2500 2550
Wire Wire Line
	2350 3050 2500 3050
Text Label 2350 1500 0    50   ~ 0
A12
Text Label 2350 2050 0    50   ~ 0
A13
Text Label 2350 2550 0    50   ~ 0
A14
Text Label 2350 3050 0    50   ~ 0
A15
$Comp
L 74xx:74LS21 U6
U 1 1 636E97D1
P 4000 2300
F 0 "U6" H 3750 2550 50  0000 C CNN
F 1 "74LS21" H 4000 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4000 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 4000 2300 50  0001 C CNN
	1    4000 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2150 3600 2150
Wire Wire Line
	3600 2150 3600 1500
Wire Wire Line
	3600 1500 3100 1500
Wire Wire Line
	3700 2250 3550 2250
Wire Wire Line
	3550 2250 3550 2050
Wire Wire Line
	3550 2050 3100 2050
Wire Wire Line
	3700 2350 3550 2350
Wire Wire Line
	3550 2350 3550 2550
Wire Wire Line
	3550 2550 3100 2550
Wire Wire Line
	3700 2450 3600 2450
Wire Wire Line
	3600 2450 3600 3050
Text GLabel 4450 2300 2    50   Input ~ 0
HB_HN_CLEAR
Wire Wire Line
	4300 2300 4450 2300
Connection ~ 2250 4200
Entry Bus Bus
	6050 4100 6150 4200
Entry Wire Line
	6050 1000 6150 1100
Entry Wire Line
	6050 1500 6150 1600
Entry Wire Line
	6050 2500 6150 2600
Entry Wire Line
	6050 2000 6150 2100
$Comp
L 74xx:74LS14 U4
U 5 1 636F7004
P 6700 1100
F 0 "U4" H 6700 1417 50  0000 C CNN
F 1 "74LS14" H 6700 1326 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6700 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 6700 1100 50  0001 C CNN
	5    6700 1100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U4
U 6 1 636F8304
P 6700 1600
F 0 "U4" H 6700 1917 50  0000 C CNN
F 1 "74LS14" H 6700 1826 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6700 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 6700 1600 50  0001 C CNN
	6    6700 1600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U7
U 1 1 636F9BE1
P 6700 2100
F 0 "U7" H 6700 2417 50  0000 C CNN
F 1 "74LS14" H 6700 2326 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6700 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 6700 2100 50  0001 C CNN
	1    6700 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1100 6400 1100
Wire Wire Line
	6150 1600 6400 1600
Wire Wire Line
	6150 2100 6400 2100
Wire Wire Line
	6150 2600 6400 2600
Text Label 6200 1100 0    50   ~ 0
A8
Text Label 6200 1600 0    50   ~ 0
A9
Text Label 6200 2100 0    50   ~ 0
A10
Text Label 6200 2600 0    50   ~ 0
A11
$Comp
L 74xx:74LS21 U6
U 2 1 6370AB83
P 7850 1850
F 0 "U6" H 7850 2225 50  0000 C CNN
F 1 "74LS21" H 7850 2134 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7850 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 7850 1850 50  0001 C CNN
	2    7850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1700 7450 1700
Wire Wire Line
	7450 1700 7450 1100
Wire Wire Line
	7450 1100 7000 1100
Wire Wire Line
	7550 1800 7400 1800
Wire Wire Line
	7400 1800 7400 1600
Wire Wire Line
	7400 1600 7200 1600
Wire Wire Line
	7550 1900 7400 1900
Wire Wire Line
	7400 1900 7400 2100
Wire Wire Line
	7400 2100 7150 2100
Wire Wire Line
	7550 2000 7450 2000
Wire Wire Line
	7450 2000 7450 2450
Wire Wire Line
	7450 2600 7000 2600
Text GLabel 8300 1850 2    50   Input ~ 0
HB_LN_CLEAR
Wire Wire Line
	8150 1850 8300 1850
Text GLabel 7700 2450 2    50   Input ~ 0
A11_CLEAR
Wire Wire Line
	7700 2450 7450 2450
Connection ~ 7450 2450
Wire Wire Line
	7450 2450 7450 2600
$Comp
L 74xx:74LS08 U8
U 1 1 6371ACBF
P 7500 3150
F 0 "U8" H 7500 3475 50  0000 C CNN
F 1 "74LS08" H 7500 3384 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7500 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7500 3150 50  0001 C CNN
	1    7500 3150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U8
U 2 1 6371C13D
P 7500 3750
F 0 "U8" H 7500 4075 50  0000 C CNN
F 1 "74LS08" H 7500 3984 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7500 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7500 3750 50  0001 C CNN
	2    7500 3750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U7
U 3 1 637245C2
P 8500 4950
F 0 "U7" H 8500 5267 50  0000 C CNN
F 1 "74LS14" H 8500 5176 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8500 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 8500 4950 50  0001 C CNN
	3    8500 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U7
U 4 1 63725FCF
P 8500 5500
F 0 "U7" H 8500 5817 50  0000 C CNN
F 1 "74LS14" H 8500 5726 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8500 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 8500 5500 50  0001 C CNN
	4    8500 5500
	1    0    0    -1  
$EndComp
Entry Wire Line
	6050 3550 6150 3650
Entry Wire Line
	6050 3150 6150 3250
Text Label 6200 3650 0    50   ~ 0
A9
Text Label 6200 3250 0    50   ~ 0
A10
$Comp
L 74xx:74LS32 U3
U 1 1 637445CC
P 8400 3450
F 0 "U3" H 8400 3775 50  0000 C CNN
F 1 "74LS32" H 8400 3684 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8400 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8400 3450 50  0001 C CNN
	1    8400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3150 8100 3150
Wire Wire Line
	8100 3150 8100 3350
Wire Wire Line
	7800 3750 8100 3750
Wire Wire Line
	8100 3750 8100 3550
Text GLabel 8850 3450 2    50   Input ~ 0
HB_LN_FBUF
Wire Wire Line
	8700 3450 8850 3450
Entry Bus Bus
	900  4200 1000 4300
$Comp
L 74xx:74LS21 U1
U 1 1 637562EA
P 1650 4700
F 0 "U1" H 1650 5075 50  0000 C CNN
F 1 "74LS21" H 1650 4984 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1650 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 1650 4700 50  0001 C CNN
	1    1650 4700
	1    0    0    -1  
$EndComp
Entry Wire Line
	1000 4450 1100 4550
Entry Wire Line
	1000 4550 1100 4650
Entry Wire Line
	1000 4650 1100 4750
Entry Wire Line
	1000 4750 1100 4850
Wire Wire Line
	1100 4550 1350 4550
Wire Wire Line
	1100 4650 1350 4650
Wire Wire Line
	1100 4750 1350 4750
Wire Wire Line
	1100 4850 1350 4850
Text Label 1100 4550 0    50   ~ 0
A4
Text Label 1100 4650 0    50   ~ 0
A5
Text Label 1100 4750 0    50   ~ 0
A6
Text Label 1100 4850 0    50   ~ 0
A7
$Comp
L 74xx:74LS08 U2
U 3 1 63774FF5
P 1650 5300
F 0 "U2" H 1650 5625 50  0000 C CNN
F 1 "74LS08" H 1650 5534 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1650 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 1650 5300 50  0001 C CNN
	3    1650 5300
	1    0    0    -1  
$EndComp
Entry Wire Line
	1000 5100 1100 5200
Entry Wire Line
	1000 5300 1100 5400
Wire Wire Line
	1100 5200 1350 5200
Wire Wire Line
	1100 5400 1350 5400
Text Label 1100 5200 0    50   ~ 0
A2
Text Label 1100 5400 0    50   ~ 0
A3
Text GLabel 2100 4700 2    50   Input ~ 0
LB_HN_SET
Text GLabel 2100 5300 2    50   Input ~ 0
LB_LN_RNG
Wire Wire Line
	1950 4700 2100 4700
Wire Wire Line
	1950 5300 2100 5300
Text GLabel 1600 6050 0    50   Input ~ 0
RAM
$Comp
L 74xx:74LS32 U3
U 2 1 63790230
P 2000 5950
F 0 "U3" H 2000 6275 50  0000 C CNN
F 1 "74LS32" H 2000 6184 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2000 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2000 5950 50  0001 C CNN
	2    2000 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 6050 1700 6050
$Comp
L 74xx:74LS08 U2
U 4 1 6379BF2F
P 2750 6050
F 0 "U2" H 2750 6375 50  0000 C CNN
F 1 "74LS08" H 2750 6284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2750 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2750 6050 50  0001 C CNN
	4    2750 6050
	1    0    0    -1  
$EndComp
Entry Wire Line
	1000 6050 1100 6150
Wire Wire Line
	1100 6150 2450 6150
Text Label 1100 6150 0    50   ~ 0
FCLK
Wire Wire Line
	2300 5950 2450 5950
$Comp
L 74xx:74LS32 U3
U 3 1 637A9D78
P 3500 6150
F 0 "U3" H 3500 6475 50  0000 C CNN
F 1 "74LS32" H 3500 6384 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3500 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3500 6150 50  0001 C CNN
	3    3500 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 6050 3200 6050
Entry Wire Line
	1000 6150 1100 6250
Wire Wire Line
	1100 6250 3200 6250
Text Label 1100 6250 0    50   ~ 0
SCLK
Entry Wire Line
	1000 6300 1100 6400
Wire Wire Line
	1100 6400 3950 6400
Wire Wire Line
	3950 6400 3950 6300
Wire Wire Line
	3950 6150 3800 6150
Text Label 1100 6400 0    50   ~ 0
CLK
Text GLabel 4100 6300 2    50   Input ~ 0
CLK
Wire Wire Line
	4100 6300 3950 6300
Connection ~ 3950 6300
Wire Wire Line
	3950 6300 3950 6150
Entry Bus Bus
	4300 4200 4400 4300
Text GLabel 3300 4500 0    50   Input ~ 0
RAM
Text GLabel 3300 4700 0    50   Input ~ 0
CLK
$Comp
L 74xx:74LS00 U5
U 1 1 637DC510
P 3650 4600
F 0 "U5" H 3650 4925 50  0000 C CNN
F 1 "74LS00" H 3650 4834 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3650 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3650 4600 50  0001 C CNN
	1    3650 4600
	1    0    0    -1  
$EndComp
Entry Wire Line
	4300 4600 4400 4500
Wire Wire Line
	3300 4500 3350 4500
Wire Wire Line
	3300 4700 3350 4700
Text Label 3950 4600 0    50   ~ 0
RAMCS
Text GLabel 5400 4550 0    50   Input ~ 0
HB_LN_FBUF
Text GLabel 5400 4750 0    50   Input ~ 0
A11_CLEAR
Text GLabel 5400 4950 0    50   Input ~ 0
HB_HN_CLEAR
Wire Wire Line
	3950 4600 4300 4600
$Comp
L 74xx:74LS08 U2
U 1 1 638149FB
P 5850 4650
F 0 "U2" H 5850 4975 50  0000 C CNN
F 1 "74LS08" H 5850 4884 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5850 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5850 4650 50  0001 C CNN
	1    5850 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U2
U 2 1 63817390
P 6700 4850
F 0 "U2" H 6700 5175 50  0000 C CNN
F 1 "74LS08" H 6700 5084 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6700 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6700 4850 50  0001 C CNN
	2    6700 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4550 5550 4550
Wire Wire Line
	5400 4750 5550 4750
Wire Wire Line
	6150 4650 6300 4650
Wire Wire Line
	6300 4650 6300 4750
Wire Wire Line
	6300 4750 6400 4750
Wire Wire Line
	5400 4950 6400 4950
Wire Wire Line
	7000 4850 7100 4850
Wire Wire Line
	7100 4850 7100 5000
Entry Wire Line
	4400 5100 4500 5200
Wire Wire Line
	4500 5200 7100 5200
Text Label 4550 5200 0    50   ~ 0
FRMBUF
Text GLabel 5200 5550 0    50   Input ~ 0
HB_HN_CLEAR
Text GLabel 5200 5650 0    50   Input ~ 0
HB_LN_CLEAR
Text GLabel 5200 5750 0    50   Input ~ 0
LB_HN_SET
Text GLabel 5200 5850 0    50   Input ~ 0
LB_LN_RNG
$Comp
L 74xx:74LS21 U1
U 2 1 638496A7
P 5650 5700
F 0 "U1" H 5650 6075 50  0000 C CNN
F 1 "74LS21" H 5650 5984 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5650 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 5650 5700 50  0001 C CNN
	2    5650 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 5550 5350 5550
Wire Wire Line
	5200 5650 5350 5650
Wire Wire Line
	5200 5750 5350 5750
Wire Wire Line
	5200 5850 5350 5850
Entry Wire Line
	4400 5250 4500 5350
Wire Wire Line
	4500 5350 6100 5350
Wire Wire Line
	6100 5350 6100 5550
Wire Wire Line
	6100 5700 5950 5700
Text Label 1500 3350 0    50   ~ 0
RNG
Text Label 4550 5350 0    50   ~ 0
RNG
Text GLabel 7350 5000 2    50   Input ~ 0
FRMBUF
Text GLabel 6350 5550 2    50   Input ~ 0
RNG
Wire Wire Line
	7100 5000 7350 5000
Connection ~ 7100 5000
Wire Wire Line
	7100 5000 7100 5200
Wire Wire Line
	6100 5550 6350 5550
Connection ~ 6100 5550
Wire Wire Line
	6100 5550 6100 5700
Text GLabel 7800 4350 0    50   Input ~ 0
ROM_CS
Text GLabel 7800 4450 0    50   Input ~ 0
FRMBUF
Text GLabel 7800 4550 0    50   Input ~ 0
RNG
Entry Wire Line
	2250 3400 2350 3500
Wire Wire Line
	3600 3050 3350 3050
Wire Wire Line
	3350 3050 3350 3350
Wire Wire Line
	3350 3500 2350 3500
Connection ~ 3350 3050
Wire Wire Line
	3350 3050 3100 3050
Text Label 2400 3500 0    50   ~ 0
ROMCS
Text GLabel 3650 3350 2    50   Input ~ 0
ROM_CS
Wire Wire Line
	3350 3350 3650 3350
Connection ~ 3350 3350
Wire Wire Line
	3350 3350 3350 3500
Wire Wire Line
	7800 4550 7850 4550
Wire Wire Line
	7850 4550 7850 5500
Wire Wire Line
	7850 5500 8200 5500
Wire Wire Line
	7800 4450 7900 4450
Wire Wire Line
	7900 4450 7900 4950
Wire Wire Line
	7900 4950 8200 4950
$Comp
L 74xx:74LS08 U8
U 3 1 6390FD17
P 9250 5050
F 0 "U8" H 9250 5375 50  0000 C CNN
F 1 "74LS08" H 9250 5284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 9250 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 9250 5050 50  0001 C CNN
	3    9250 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U8
U 4 1 63912D9D
P 9700 5500
F 0 "U8" H 9700 5825 50  0000 C CNN
F 1 "74LS08" H 9700 5734 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 9700 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 9700 5500 50  0001 C CNN
	4    9700 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 4950 8950 4350
Wire Wire Line
	8950 4350 7800 4350
Wire Wire Line
	8800 4950 8800 5150
Wire Wire Line
	8800 5150 8950 5150
Wire Wire Line
	9550 5050 9550 5250
Wire Wire Line
	9550 5250 9350 5250
Wire Wire Line
	9350 5250 9350 5400
Wire Wire Line
	9350 5400 9400 5400
Wire Wire Line
	8800 5500 9300 5500
Wire Wire Line
	9300 5500 9300 5600
Wire Wire Line
	9300 5600 9400 5600
Text GLabel 10150 5500 2    50   Input ~ 0
RAM
Wire Wire Line
	10000 5500 10150 5500
Wire Wire Line
	7200 1600 7200 3050
$Comp
L 74xx:74LS14 U7
U 2 1 636FB05D
P 6700 2600
F 0 "U7" H 6700 2917 50  0000 C CNN
F 1 "74LS14" H 6700 2826 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6700 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 6700 2600 50  0001 C CNN
	2    6700 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3250 7200 3250
Wire Wire Line
	6150 3650 7200 3650
Connection ~ 7200 1600
Wire Wire Line
	7000 1600 7200 1600
Connection ~ 7150 2100
Wire Wire Line
	7000 2100 7150 2100
Wire Wire Line
	7150 2100 7150 3850
Wire Wire Line
	7150 3850 7200 3850
Wire Wire Line
	1550 1650 1550 1600
Wire Wire Line
	1550 1600 1750 1600
Connection ~ 1550 1650
Wire Wire Line
	1550 1650 1600 1650
$Comp
L power:+5V #PWR02
U 1 1 633B2D8C
P 1800 1600
F 0 "#PWR02" H 1800 1450 50  0001 C CNN
F 1 "+5V" H 1950 1650 50  0000 C CNN
F 2 "" H 1800 1600 50  0001 C CNN
F 3 "" H 1800 1600 50  0001 C CNN
	1    1800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1550 950  1350
Connection ~ 950  1550
Wire Wire Line
	950  1550 1000 1550
Wire Wire Line
	1550 1550 1550 1350
Wire Wire Line
	1550 1350 1100 1350
Connection ~ 1550 1550
Wire Wire Line
	1550 1550 1600 1550
Connection ~ 950  1350
Wire Wire Line
	950  1350 950  1300
$Comp
L power:GND #PWR01
U 1 1 633C645A
P 950 1300
F 0 "#PWR01" H 950 1050 50  0001 C CNN
F 1 "GND" H 955 1127 50  0000 C CNN
F 2 "" H 950 1300 50  0001 C CNN
F 3 "" H 950 1300 50  0001 C CNN
	1    950  1300
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS14 U4
U 7 1 633C8A97
P 5350 1000
F 0 "U4" H 5100 650 50  0000 L CNN
F 1 "74LS14" H 5050 550 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 5350 1000 50  0001 C CNN
	7    5350 1000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U7
U 7 1 633CCBF0
P 5800 1000
F 0 "U7" H 5550 650 50  0000 L CNN
F 1 "74LS14" H 5500 550 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5800 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 5800 1000 50  0001 C CNN
	7    5800 1000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U1
U 3 1 633D249E
P 4000 1000
F 0 "U1" H 3700 650 50  0000 L CNN
F 1 "74LS21" H 3650 550 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4000 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 4000 1000 50  0001 C CNN
	3    4000 1000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U8
U 5 1 633D5B18
P 5800 2950
F 0 "U8" H 5550 2600 50  0000 L CNN
F 1 "74LS08" H 5500 2500 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5800 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5800 2950 50  0001 C CNN
	5    5800 2950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U5
U 5 1 633DD98A
P 4450 1000
F 0 "U5" H 4200 650 50  0000 L CNN
F 1 "74LS00" H 4150 550 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4450 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4450 1000 50  0001 C CNN
	5    4450 1000
	1    0    0    -1  
$EndComp
Entry Wire Line
	5950 600  6050 500 
Wire Wire Line
	5950 600  5900 600 
Wire Wire Line
	5900 600  5900 500 
Wire Wire Line
	5900 500  5800 500 
Wire Wire Line
	5800 500  5600 500 
Connection ~ 5800 500 
Wire Wire Line
	5350 500  5150 500 
Connection ~ 5350 500 
Wire Wire Line
	4450 500  4250 500 
Connection ~ 4450 500 
Entry Wire Line
	5950 1500 6050 1400
Wire Wire Line
	5950 1500 5900 1500
Wire Wire Line
	5800 1500 5450 1500
Connection ~ 5800 1500
Wire Wire Line
	5350 1500 5000 1500
Connection ~ 5350 1500
Wire Wire Line
	4450 1500 4050 1500
Connection ~ 4450 1500
Text Label 5850 1500 0    50   ~ 0
GND
Text Label 5900 600  0    50   ~ 0
VCC
Entry Wire Line
	5950 2450 6050 2350
Wire Wire Line
	5950 2450 5800 2450
Connection ~ 5800 2450
Entry Wire Line
	5950 3450 6050 3350
Wire Wire Line
	5950 3450 5900 3450
Text Label 5850 2450 0    50   ~ 0
VCC
Text Label 5850 3450 0    50   ~ 0
GND
$Comp
L power:PWR_FLAG #FLG02
U 1 1 634C9D79
P 1750 1600
F 0 "#FLG02" H 1750 1675 50  0001 C CNN
F 1 "PWR_FLAG" H 1500 1700 50  0000 C CNN
F 2 "" H 1750 1600 50  0001 C CNN
F 3 "~" H 1750 1600 50  0001 C CNN
	1    1750 1600
	-1   0    0    1   
$EndComp
Connection ~ 1750 1600
Wire Wire Line
	1750 1600 1800 1600
$Comp
L power:PWR_FLAG #FLG01
U 1 1 634CB429
P 1100 1350
F 0 "#FLG01" H 1100 1425 50  0001 C CNN
F 1 "PWR_FLAG" H 1350 1450 50  0000 C CNN
F 2 "" H 1100 1350 50  0001 C CNN
F 3 "~" H 1100 1350 50  0001 C CNN
	1    1100 1350
	1    0    0    -1  
$EndComp
Connection ~ 1100 1350
Wire Wire Line
	1100 1350 950  1350
NoConn ~ 1500 3450
NoConn ~ 1500 3250
NoConn ~ 1500 3150
NoConn ~ 1500 3050
NoConn ~ 1500 1750
NoConn ~ 1500 1850
NoConn ~ 1500 1950
NoConn ~ 1500 2050
NoConn ~ 1500 2150
NoConn ~ 1500 2250
NoConn ~ 1500 2350
NoConn ~ 1500 2450
NoConn ~ 1500 2550
NoConn ~ 1000 1650
NoConn ~ 1000 1750
NoConn ~ 1000 1850
$Comp
L Device:C C2
U 1 1 633BD5D0
P 4400 1850
F 0 "C2" V 4652 1850 50  0000 C CNN
F 1 "0.1uF" V 4561 1850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4438 1700 50  0001 C CNN
F 3 "~" H 4400 1850 50  0001 C CNN
	1    4400 1850
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C4
U 1 1 633DA844
P 4850 1850
F 0 "C4" V 5102 1850 50  0000 C CNN
F 1 "0.1uF" V 5011 1850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4888 1700 50  0001 C CNN
F 3 "~" H 4850 1850 50  0001 C CNN
	1    4850 1850
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C5
U 1 1 633DBBE1
P 5300 1850
F 0 "C5" V 5552 1850 50  0000 C CNN
F 1 "0.1uF" V 5461 1850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5338 1700 50  0001 C CNN
F 3 "~" H 5300 1850 50  0001 C CNN
	1    5300 1850
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C7
U 1 1 633DC03A
P 5750 1850
F 0 "C7" V 6002 1850 50  0000 C CNN
F 1 "0.1uF" V 5911 1850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5788 1700 50  0001 C CNN
F 3 "~" H 5750 1850 50  0001 C CNN
	1    5750 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 500  5600 1850
Connection ~ 5600 500 
Wire Wire Line
	5600 500  5350 500 
Wire Wire Line
	5900 1850 5900 1500
Connection ~ 5900 1500
Wire Wire Line
	5900 1500 5800 1500
Wire Wire Line
	5150 500  5150 1850
Connection ~ 5150 500 
Wire Wire Line
	5450 1850 5450 1500
Connection ~ 5450 1500
Wire Wire Line
	5450 1500 5350 1500
Wire Wire Line
	4700 500  4700 1850
Connection ~ 4700 500 
Wire Wire Line
	4700 500  4450 500 
Wire Wire Line
	5000 1850 5000 1500
Connection ~ 5000 1500
Wire Wire Line
	4250 500  4250 1850
Connection ~ 4250 500 
Wire Wire Line
	4250 500  4000 500 
Wire Wire Line
	4550 1850 4550 1500
Connection ~ 4550 1500
Wire Wire Line
	4550 1500 4450 1500
$Comp
L Device:C C1
U 1 1 63462C44
P 3900 1850
F 0 "C1" V 4152 1850 50  0000 C CNN
F 1 "0.1uF" V 4061 1850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3938 1700 50  0001 C CNN
F 3 "~" H 3900 1850 50  0001 C CNN
	1    3900 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 1850 3750 500 
Wire Wire Line
	3750 500  4000 500 
Connection ~ 4000 500 
Wire Wire Line
	4050 1850 4050 1500
Connection ~ 4050 1500
Wire Wire Line
	4050 1500 4000 1500
$Comp
L Device:C C8
U 1 1 6347BFFD
P 5750 3750
F 0 "C8" V 6002 3750 50  0000 C CNN
F 1 "0.1uF" V 5911 3750 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5788 3600 50  0001 C CNN
F 3 "~" H 5750 3750 50  0001 C CNN
	1    5750 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 2450 5600 2450
Connection ~ 5600 2450
Wire Wire Line
	5600 2450 5600 3750
Connection ~ 5350 2450
Wire Wire Line
	5600 2450 5350 2450
Connection ~ 5800 3450
$Comp
L 74xx:74LS08 U2
U 5 1 633D8167
P 5350 2950
F 0 "U2" H 5050 2600 50  0000 L CNN
F 1 "74LS08" H 5000 2500 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5350 2950 50  0001 C CNN
	5    5350 2950
	1    0    0    -1  
$EndComp
Connection ~ 5350 3450
Wire Wire Line
	5450 3450 5350 3450
Wire Wire Line
	5800 3450 5450 3450
Connection ~ 5450 3450
Wire Wire Line
	5350 3450 4950 3450
Connection ~ 4950 3450
Wire Wire Line
	4950 3450 4950 3750
$Comp
L Device:C C3
U 1 1 6347C8E2
P 4800 3750
F 0 "C3" V 5052 3750 50  0000 C CNN
F 1 "0.1uF" V 4961 3750 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4838 3600 50  0001 C CNN
F 3 "~" H 4800 3750 50  0001 C CNN
	1    4800 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 2450 5150 2450
Connection ~ 5150 2450
Wire Wire Line
	5450 3750 5450 3450
Wire Wire Line
	5150 2450 5150 3750
$Comp
L Device:C C6
U 1 1 6347C5DE
P 5300 3750
F 0 "C6" V 5552 3750 50  0000 C CNN
F 1 "0.1uF" V 5461 3750 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5338 3600 50  0001 C CNN
F 3 "~" H 5300 3750 50  0001 C CNN
	1    5300 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4950 3450 4900 3450
Wire Wire Line
	5150 2450 4900 2450
$Comp
L 74xx:74LS21 U6
U 3 1 633DBA13
P 4900 2950
F 0 "U6" H 4600 2600 50  0000 L CNN
F 1 "74LS21" H 4550 2500 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4900 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 4900 2950 50  0001 C CNN
	3    4900 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3750 4600 3750
Wire Wire Line
	4600 3750 4600 2450
Wire Wire Line
	4600 2450 4900 2450
Connection ~ 4900 2450
Wire Wire Line
	5900 3750 5900 3450
Connection ~ 5900 3450
Wire Wire Line
	5900 3450 5800 3450
Wire Wire Line
	4700 500  4900 500 
Wire Wire Line
	4550 1500 4900 1500
$Comp
L 74xx:74LS32 U3
U 5 1 6359B14D
P 4900 1000
F 0 "U3" H 4700 650 50  0000 L CNN
F 1 "74LS32" H 4700 550 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4900 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4900 1000 50  0001 C CNN
	5    4900 1000
	1    0    0    -1  
$EndComp
Connection ~ 4900 500 
Wire Wire Line
	4900 500  5150 500 
Connection ~ 4900 1500
Wire Wire Line
	4900 1500 5000 1500
Entry Wire Line
	1000 5750 1100 5850
Wire Wire Line
	1100 5850 1700 5850
Text Label 1100 5850 0    50   ~ 0
A15
Wire Bus Line
	850  4200 2250 4200
Wire Bus Line
	2250 4200 6200 4200
Wire Bus Line
	4400 4300 4400 5250
Wire Bus Line
	1700 1450 1700 4100
Wire Bus Line
	2250 950  2250 4200
Wire Bus Line
	1000 4300 1000 6300
Wire Bus Line
	6050 500  6050 4100
Wire Bus Line
	750  1450 750  4100
$EndSCHEMATC
