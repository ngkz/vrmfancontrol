EESchema Schematic File Version 4
LIBS:vrmfanctl_pcb-cache
EELAYER 26 0
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
L Connector_Generic:Conn_01x15 J1
U 1 1 5D2D5518
P 1500 2050
F 0 "J1" H 1418 1125 50  0000 C CNN
F 1 "SATA Power Male" H 1418 1216 50  0000 C CNN
F 2 "MyFootprint:SATA_Power_PCBEdge" H 1500 2050 50  0001 C CNN
F 3 "~" H 1500 2050 50  0001 C CNN
	1    1500 2050
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5D2DA103
P 3050 2050
F 0 "C1" H 3142 2096 50  0000 L CNN
F 1 "100n" H 3142 2005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3050 2050 50  0001 C CNN
F 3 "~" H 3050 2050 50  0001 C CNN
	1    3050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2150 1950 2150
Wire Wire Line
	1950 2150 1950 2050
Wire Wire Line
	1950 1950 1700 1950
Wire Wire Line
	1700 2050 1950 2050
Connection ~ 1950 2050
Wire Wire Line
	1950 2050 1950 1950
Wire Wire Line
	1700 2350 1950 2350
Wire Wire Line
	1950 2450 1950 2350
Wire Wire Line
	1700 2450 1950 2450
Connection ~ 1950 2350
Wire Wire Line
	1700 2250 1950 2250
Wire Wire Line
	1950 2250 1950 2350
Text Label 1700 1950 0    50   ~ 0
5V
Text Label 1700 2250 0    50   ~ 0
GND
Text Label 1700 2050 0    50   ~ 0
5V
Text Label 1700 2150 0    50   ~ 0
5V
Text Label 1700 2350 0    50   ~ 0
GND
Text Label 1700 2450 0    50   ~ 0
GND
Text Notes 650  950  0    50   ~ 0
ThinkPad E490's SATA power connector only has 5V pins and four of GND pins.
Wire Wire Line
	4500 2700 4500 2800
NoConn ~ 1700 1350
NoConn ~ 1700 1450
NoConn ~ 1700 1550
NoConn ~ 1700 1650
NoConn ~ 1700 1750
NoConn ~ 1700 2550
NoConn ~ 1700 2650
NoConn ~ 1700 2750
NoConn ~ 1700 1850
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5D2F5126
P 1650 3300
F 0 "#FLG01" H 1650 3375 50  0001 C CNN
F 1 "PWR_FLAG" H 1650 3473 50  0000 C CNN
F 2 "" H 1650 3300 50  0001 C CNN
F 3 "~" H 1650 3300 50  0001 C CNN
	1    1650 3300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5D2F56B3
P 1650 3350
F 0 "#PWR01" H 1650 3200 50  0001 C CNN
F 1 "VCC" H 1668 3523 50  0000 C CNN
F 2 "" H 1650 3350 50  0001 C CNN
F 3 "" H 1650 3350 50  0001 C CNN
	1    1650 3350
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5D2F5DC2
P 2100 3300
F 0 "#FLG02" H 2100 3375 50  0001 C CNN
F 1 "PWR_FLAG" H 2100 3473 50  0000 C CNN
F 2 "" H 2100 3300 50  0001 C CNN
F 3 "~" H 2100 3300 50  0001 C CNN
	1    2100 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D2F6399
P 2100 3350
F 0 "#PWR02" H 2100 3100 50  0001 C CNN
F 1 "GND" H 2105 3177 50  0000 C CNN
F 2 "" H 2100 3350 50  0001 C CNN
F 3 "" H 2100 3350 50  0001 C CNN
	1    2100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3350 2100 3300
Wire Wire Line
	1650 3350 1650 3300
Text Label 5150 2000 0    50   ~ 0
FG
NoConn ~ 5100 2300
$Comp
L power:GND #PWR0101
U 1 1 5D3CB935
P 3800 2950
F 0 "#PWR0101" H 3800 2700 50  0001 C CNN
F 1 "GND" H 3805 2777 50  0000 C CNN
F 2 "" H 3800 2950 50  0001 C CNN
F 3 "" H 3800 2950 50  0001 C CNN
	1    3800 2950
	1    0    0    -1  
$EndComp
Text Notes 6000 1950 0    50   ~ 0
PWM(BLUE)
Text Notes 6000 2050 0    50   ~ 0
FOO(YELLOW)
Text Notes 6000 2150 0    50   ~ 0
V-(BLACK)
Text Notes 6000 2250 0    50   ~ 0
V+(RED)
Text Notes 6000 1850 0    50   ~ 0
To Fan (KDB0305HA3-CD7)
Text Notes 5950 2600 0    50   ~ 0
FG is open-drain. enable internal pull-up.
Text Label 5150 2200 0    50   ~ 0
PWM
Wire Wire Line
	5600 2100 5750 2100
Wire Wire Line
	5600 2100 5600 2150
Wire Wire Line
	4500 1350 4500 1500
Wire Wire Line
	5700 2200 5750 2200
Text Notes 1100 2050 0    50   ~ 0
5V±5%
Wire Wire Line
	3050 1350 3050 1950
Wire Wire Line
	3050 1350 3800 1350
Wire Wire Line
	3050 2150 3050 2800
Wire Wire Line
	4500 2800 3800 2800
Connection ~ 1950 2450
Wire Wire Line
	1950 2450 1950 2700
$Comp
L power:VCC #PWR0102
U 1 1 5D3CC093
P 3800 1250
F 0 "#PWR0102" H 3800 1100 50  0001 C CNN
F 1 "VCC" H 3817 1423 50  0000 C CNN
F 2 "" H 3800 1250 50  0001 C CNN
F 3 "" H 3800 1250 50  0001 C CNN
	1    3800 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2200 5700 2350
Wire Wire Line
	3800 1250 3800 1350
Connection ~ 3800 1350
Wire Wire Line
	3800 1350 4500 1350
Wire Wire Line
	3800 2800 3800 2950
Connection ~ 3800 2800
Wire Wire Line
	3800 2800 3050 2800
$Comp
L power:VCC #PWR03
U 1 1 5D5E58BC
P 1950 1750
F 0 "#PWR03" H 1950 1600 50  0001 C CNN
F 1 "VCC" H 1967 1923 50  0000 C CNN
F 2 "" H 1950 1750 50  0001 C CNN
F 3 "" H 1950 1750 50  0001 C CNN
	1    1950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1750 1950 1950
Connection ~ 1950 1950
$Comp
L power:GND #PWR04
U 1 1 5D5E62E1
P 1950 2700
F 0 "#PWR04" H 1950 2450 50  0001 C CNN
F 1 "GND" H 1955 2527 50  0000 C CNN
F 2 "" H 1950 2700 50  0001 C CNN
F 3 "" H 1950 2700 50  0001 C CNN
	1    1950 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5D5E75C4
P 5600 2150
F 0 "#PWR07" H 5600 1900 50  0001 C CNN
F 1 "GND" H 5605 1977 50  0000 C CNN
F 2 "" H 5600 2150 50  0001 C CNN
F 3 "" H 5600 2150 50  0001 C CNN
	1    5600 2150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR08
U 1 1 5D5EAA48
P 5700 2350
F 0 "#PWR08" H 5700 2200 50  0001 C CNN
F 1 "VCC" H 5718 2523 50  0000 C CNN
F 2 "" H 5700 2350 50  0001 C CNN
F 3 "" H 5700 2350 50  0001 C CNN
	1    5700 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 2000 5750 2000
$Comp
L Connector:Conn_01x04_Female J4
U 1 1 5D5F6860
P 5950 2000
F 0 "J4" H 6000 1650 50  0000 L CNN
F 1 "Pin socket L-shape" H 6000 1550 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Horizontal" H 5950 2000 50  0001 C CNN
F 3 "~" H 5950 2000 50  0001 C CNN
	1    5950 2000
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20PU U1
U 1 1 5D2BE157
P 4500 2100
F 0 "U1" H 3971 2146 50  0000 R CNN
F 1 "ATtiny85-20PU" H 3971 2055 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4500 2100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 4500 2100 50  0001 C CNN
	1    4500 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5D600CEB
P 5600 1600
F 0 "#PWR06" H 5600 1350 50  0001 C CNN
F 1 "GND" H 5605 1427 50  0000 C CNN
F 2 "" H 5600 1600 50  0001 C CNN
F 3 "" H 5600 1600 50  0001 C CNN
	1    5600 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1550 5600 1550
Wire Wire Line
	5600 1550 5600 1600
Wire Wire Line
	5350 1350 5350 1800
Wire Wire Line
	5350 1800 5100 1800
Wire Wire Line
	5350 1350 5700 1350
Text Label 5150 1800 0    50   ~ 0
TX
Text Label 5150 1900 0    50   ~ 0
RX
Wire Wire Line
	5100 1900 5450 1900
Wire Wire Line
	5450 1900 5450 1450
Wire Wire Line
	5450 1450 5700 1450
Wire Wire Line
	5750 1900 5500 1900
Text Notes 5950 2800 0    50   ~ 0
To temperature sensor diode
Text Label 5150 2100 0    50   ~ 0
D+
Wire Wire Line
	5400 2850 5700 2850
Wire Wire Line
	5400 2950 5400 3050
Wire Wire Line
	5700 2950 5400 2950
$Comp
L power:GND #PWR05
U 1 1 5D614B08
P 5400 3050
F 0 "#PWR05" H 5400 2800 50  0001 C CNN
F 1 "GND" H 5405 2877 50  0000 C CNN
F 2 "" H 5400 3050 50  0001 C CNN
F 3 "" H 5400 3050 50  0001 C CNN
	1    5400 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5D610DF4
P 5900 2850
F 0 "J3" H 5928 2826 50  0000 L CNN
F 1 "Pin socket L-shape" H 5928 2735 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Horizontal" H 5900 2850 50  0001 C CNN
F 3 "~" H 5900 2850 50  0001 C CNN
	1    5900 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2200 5400 2200
Wire Wire Line
	5500 1900 5500 2200
Wire Wire Line
	5400 2200 5100 2200
Wire Wire Line
	5400 2100 5100 2100
Wire Wire Line
	5400 2100 5400 2850
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5D5D4A8F
P 5900 1450
F 0 "J2" H 5980 1492 50  0000 L CNN
F 1 "Hole" H 5980 1401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5900 1450 50  0001 C CNN
F 3 "~" H 5900 1450 50  0001 C CNN
	1    5900 1450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
