EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1250 1450 0    50   Input ~ 0
V+(input)
Text HLabel 1250 1600 0    50   Input ~ 0
V-(input)
Text HLabel 5950 1200 2    50   Output ~ 0
V+(output)
Text HLabel 5950 1800 2    50   Output ~ 0
V-(output)
$Comp
L Transistor_BJT:2SD1047 Q1
U 1 1 60347C83
P 2700 2000
F 0 "Q1" H 2890 2046 50  0000 L CNN
F 1 "2SD1047" H 2890 1955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-126-3_Vertical" H 2950 1925 50  0001 L CIN
F 3 "http://www.st.com/resource/en/datasheet/2sd1047.pdf" H 2700 2000 50  0001 L CNN
	1    2700 2000
	1    0    0    -1  
$EndComp
$Comp
L Transformer:TRANSF5 TR1
U 1 1 6034CD3F
P 3600 2050
F 0 "TR1" H 3600 2431 50  0000 C CNN
F 1 "TRANSF5" H 3600 2340 50  0000 C CNN
F 2 "TRANSFORM:TRANSF6" H 3600 2050 50  0001 C CNN
F 3 "" H 3600 2050 50  0001 C CNN
	1    3600 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 603537D8
P 2250 2000
F 0 "R1" V 2043 2000 50  0000 C CNN
F 1 "R" V 2134 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2180 2000 50  0001 C CNN
F 3 "~" H 2250 2000 50  0001 C CNN
	1    2250 2000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 60354117
P 3900 2450
F 0 "#PWR0101" H 3900 2200 50  0001 C CNN
F 1 "GND" H 3905 2277 50  0000 C CNN
F 2 "" H 3900 2450 50  0001 C CNN
F 3 "" H 3900 2450 50  0001 C CNN
	1    3900 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2450 3900 2250
Wire Wire Line
	3900 2250 3800 2250
$Comp
L Device:C C2
U 1 1 6035485B
P 4600 1200
F 0 "C2" H 4715 1246 50  0000 L CNN
F 1 "C" H 4715 1155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D9.0mm_W2.5mm_P5.00mm" H 4638 1050 50  0001 C CNN
F 3 "~" H 4600 1200 50  0001 C CNN
	1    4600 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 60354EC3
P 4950 1200
F 0 "C3" H 5065 1246 50  0000 L CNN
F 1 "C" H 5065 1155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D9.0mm_W2.5mm_P5.00mm" H 4988 1050 50  0001 C CNN
F 3 "~" H 4950 1200 50  0001 C CNN
	1    4950 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 60355537
P 4600 1850
F 0 "D2" V 4554 1930 50  0000 L CNN
F 1 "D" V 4645 1930 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 4600 1850 50  0001 C CNN
F 3 "~" H 4600 1850 50  0001 C CNN
	1    4600 1850
	0    1    1    0   
$EndComp
$Comp
L Device:D D3
U 1 1 60357F9C
P 4950 1850
F 0 "D3" V 4996 1770 50  0000 R CNN
F 1 "D" V 4905 1770 50  0000 R CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 4950 1850 50  0001 C CNN
F 3 "~" H 4950 1850 50  0001 C CNN
	1    4950 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3800 1850 3900 1850
Wire Wire Line
	3900 1850 3900 900 
Wire Wire Line
	4600 900  4600 1050
Wire Wire Line
	4600 900  4950 900 
Wire Wire Line
	4950 900  4950 1050
Connection ~ 4600 900 
$Comp
L Device:D D1
U 1 1 60360C4E
P 4300 1200
F 0 "D1" V 4346 1120 50  0000 R CNN
F 1 "D" V 4255 1120 50  0000 R CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 4300 1200 50  0001 C CNN
F 3 "~" H 4300 1200 50  0001 C CNN
	1    4300 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 1050 4300 900 
Wire Wire Line
	4300 900  4600 900 
$Comp
L Device:C C1
U 1 1 60364101
P 4300 2350
F 0 "C1" H 4415 2396 50  0000 L CNN
F 1 "C" H 4415 2305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D9.0mm_W2.5mm_P5.00mm" H 4338 2200 50  0001 C CNN
F 3 "~" H 4300 2350 50  0001 C CNN
	1    4300 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2000 4300 2000
Wire Wire Line
	4300 2000 4300 1350
Wire Wire Line
	4300 2200 4300 2000
Connection ~ 4300 2000
Wire Wire Line
	3900 900  4300 900 
Connection ~ 4300 900 
Wire Wire Line
	4950 2000 4950 2650
Wire Wire Line
	4950 2650 4300 2650
Wire Wire Line
	4300 2650 4300 2500
Wire Wire Line
	4300 2650 4050 2650
Wire Wire Line
	4050 2050 3800 2050
Wire Wire Line
	4050 2050 4050 2650
Connection ~ 4300 2650
Wire Wire Line
	4600 1350 4600 1450
Wire Wire Line
	4950 1350 4950 1600
$Comp
L Device:C C4
U 1 1 6036C67A
P 5600 1500
F 0 "C4" H 5715 1546 50  0000 L CNN
F 1 "C" H 5715 1455 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D16.0mm_W5.0mm_P10.00mm" H 5638 1350 50  0001 C CNN
F 3 "~" H 5600 1500 50  0001 C CNN
	1    5600 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1650 5600 1800
Wire Wire Line
	5600 1800 5950 1800
Wire Wire Line
	5950 1200 5600 1200
Wire Wire Line
	5600 1200 5600 1350
Wire Wire Line
	4950 1600 5350 1600
Wire Wire Line
	5350 1600 5350 1800
Wire Wire Line
	5350 1800 5600 1800
Connection ~ 4950 1600
Wire Wire Line
	4950 1600 4950 1700
Connection ~ 5600 1800
Wire Wire Line
	4600 1450 5350 1450
Wire Wire Line
	5350 1450 5350 1200
Wire Wire Line
	5350 1200 5600 1200
Connection ~ 4600 1450
Wire Wire Line
	4600 1450 4600 1700
Connection ~ 5600 1200
Wire Wire Line
	2800 2200 2800 2250
Wire Wire Line
	2800 2250 3400 2250
Wire Wire Line
	3400 2050 3250 2050
Wire Wire Line
	3250 2050 3250 1450
Wire Wire Line
	3250 1450 2800 1450
Wire Wire Line
	2400 2000 2500 2000
Wire Wire Line
	2100 2000 2000 2000
Wire Wire Line
	2000 2000 2000 1650
Wire Wire Line
	2000 1650 3300 1650
Wire Wire Line
	3300 1650 3300 1850
Wire Wire Line
	3300 1850 3400 1850
Wire Wire Line
	2800 1800 2800 1450
Connection ~ 2800 1450
Wire Wire Line
	2800 1450 1250 1450
$Comp
L power:GND #PWR0102
U 1 1 6034E1F1
P 1450 1700
F 0 "#PWR0102" H 1450 1450 50  0001 C CNN
F 1 "GND" H 1455 1527 50  0000 C CNN
F 2 "" H 1450 1700 50  0001 C CNN
F 3 "" H 1450 1700 50  0001 C CNN
	1    1450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1600 1450 1600
Wire Wire Line
	1450 1600 1450 1700
$Comp
L Device:CP C5
U 1 1 6096107C
P 1300 3000
F 0 "C5" H 1418 3046 50  0000 L CNN
F 1 "CP" H 1418 2955 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P2.50mm" H 1338 2850 50  0001 C CNN
F 3 "~" H 1300 3000 50  0001 C CNN
	1    1300 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 60962C4A
P 1650 3000
F 0 "C6" H 1765 3046 50  0000 L CNN
F 1 "C" H 1765 2955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D9.0mm_W2.5mm_P5.00mm" H 1688 2850 50  0001 C CNN
F 3 "~" H 1650 3000 50  0001 C CNN
	1    1650 3000
	1    0    0    -1  
$EndComp
Text HLabel 1050 2700 0    50   Input ~ 0
V+(input)
Wire Wire Line
	1050 2700 1300 2700
Wire Wire Line
	1650 2700 1650 2850
Wire Wire Line
	1300 2850 1300 2700
Connection ~ 1300 2700
Wire Wire Line
	1300 2700 1650 2700
$Comp
L power:GND #PWR0127
U 1 1 60965A24
P 1650 3350
F 0 "#PWR0127" H 1650 3100 50  0001 C CNN
F 1 "GND" H 1655 3177 50  0000 C CNN
F 2 "" H 1650 3350 50  0001 C CNN
F 3 "" H 1650 3350 50  0001 C CNN
	1    1650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3350 1650 3250
Wire Wire Line
	1300 3150 1300 3250
Wire Wire Line
	1300 3250 1650 3250
Connection ~ 1650 3250
Wire Wire Line
	1650 3250 1650 3150
$EndSCHEMATC
