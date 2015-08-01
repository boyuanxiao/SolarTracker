EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:mcp6494
LIBS:mcp6492
LIBS:photodiode
LIBS:solarTracker-cache
EELAYER 25 0
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
L +3V3 #PWR5
U 1 1 55B9397F
P 4625 3525
F 0 "#PWR5" H 4625 3375 50  0001 C CNN
F 1 "+3V3" H 4625 3665 50  0000 C CNN
F 2 "" H 4625 3525 60  0000 C CNN
F 3 "" H 4625 3525 60  0000 C CNN
	1    4625 3525
	1    0    0    -1  
$EndComp
$Comp
L MCP6494 U3
U 1 1 55B93A01
P 5300 4950
F 0 "U3" H 5300 4550 60  0000 C CNN
F 1 "MCP6494" H 5300 4650 60  0000 C CNN
F 2 "" H 5050 5000 60  0000 C CNN
F 3 "" H 5050 5000 60  0000 C CNN
	1    5300 4950
	1    0    0    -1  
$EndComp
$Comp
L photodiode U2
U 1 1 55BC92C9
P 4125 5250
F 0 "U2" H 4125 5250 60  0000 C CNN
F 1 "photodiode" H 4125 5250 60  0000 C CNN
F 2 "" H 4125 5250 60  0000 C CNN
F 3 "" H 4125 5250 60  0000 C CNN
	1    4125 5250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR2
U 1 1 55BC93B8
P 3800 5525
F 0 "#PWR2" H 3800 5275 50  0001 C CNN
F 1 "GND" H 3800 5375 50  0000 C CNN
F 2 "" H 3800 5525 60  0000 C CNN
F 3 "" H 3800 5525 60  0000 C CNN
	1    3800 5525
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 55BC945E
P 4000 5525
F 0 "#PWR4" H 4000 5275 50  0001 C CNN
F 1 "GND" H 4000 5375 50  0000 C CNN
F 2 "" H 4000 5525 60  0000 C CNN
F 3 "" H 4000 5525 60  0000 C CNN
	1    4000 5525
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 55BC9567
P 4450 5000
F 0 "R1" V 4450 5000 50  0000 C CNN
F 1 "UNREGULATED" V 4575 5000 50  0000 C CNN
F 2 "" V 4380 5000 30  0000 C CNN
F 3 "" H 4450 5000 30  0000 C CNN
	1    4450 5000
	0    1    1    0   
$EndComp
$Comp
L photodiode U1
U 1 1 55BC972A
P 4125 4150
F 0 "U1" H 4125 4150 60  0000 C CNN
F 1 "photodiode" H 4125 4150 60  0000 C CNN
F 2 "" H 4125 4150 60  0000 C CNN
F 3 "" H 4125 4150 60  0000 C CNN
	1    4125 4150
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR3
U 1 1 55BC9739
P 3825 4000
F 0 "#PWR3" H 3825 3750 50  0001 C CNN
F 1 "GND" H 3825 3850 50  0000 C CNN
F 2 "" H 3825 4000 60  0000 C CNN
F 3 "" H 3825 4000 60  0000 C CNN
	1    3825 4000
	-1   0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 55BC9741
P 4450 4400
F 0 "R3" V 4450 4400 50  0000 C CNN
F 1 "UNREGULATED" V 4375 4400 50  0000 C CNN
F 2 "" V 4380 4400 30  0000 C CNN
F 3 "" H 4450 4400 30  0000 C CNN
	1    4450 4400
	0    1    -1   0   
$EndComp
$Comp
L photodiode U5
U 1 1 55BC9AC1
P 6375 5250
F 0 "U5" H 6375 5250 60  0000 C CNN
F 1 "photodiode" H 6375 5250 60  0000 C CNN
F 2 "" H 6375 5250 60  0000 C CNN
F 3 "" H 6375 5250 60  0000 C CNN
	1    6375 5250
	0    1    -1   0   
$EndComp
$Comp
L GND #PWR9
U 1 1 55BC9ACA
P 6700 5525
F 0 "#PWR9" H 6700 5275 50  0001 C CNN
F 1 "GND" H 6700 5375 50  0000 C CNN
F 2 "" H 6700 5525 60  0000 C CNN
F 3 "" H 6700 5525 60  0000 C CNN
	1    6700 5525
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 55BC9AD0
P 6500 5525
F 0 "#PWR7" H 6500 5275 50  0001 C CNN
F 1 "GND" H 6500 5375 50  0000 C CNN
F 2 "" H 6500 5525 60  0000 C CNN
F 3 "" H 6500 5525 60  0000 C CNN
	1    6500 5525
	-1   0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 55BC9AD7
P 6050 5000
F 0 "R2" V 6075 5000 50  0000 C CNN
F 1 "UNREGULATED" V 6175 5025 50  0000 C CNN
F 2 "" V 5980 5000 30  0000 C CNN
F 3 "" H 6050 5000 30  0000 C CNN
	1    6050 5000
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR10
U 1 1 55BCA017
P 6800 4800
F 0 "#PWR10" H 6800 4550 50  0001 C CNN
F 1 "GND" H 6800 4650 50  0000 C CNN
F 2 "" H 6800 4800 60  0000 C CNN
F 3 "" H 6800 4800 60  0000 C CNN
	1    6800 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 55BCA30C
P 3800 4650
F 0 "#PWR1" H 3800 4400 50  0001 C CNN
F 1 "GND" H 3800 4500 50  0000 C CNN
F 2 "" H 3800 4650 60  0000 C CNN
F 3 "" H 3800 4650 60  0000 C CNN
	1    3800 4650
	1    0    0    -1  
$EndComp
$Comp
L photodiode U4
U 1 1 55BCA68F
P 6375 4150
F 0 "U4" H 6375 4150 60  0000 C CNN
F 1 "photodiode" H 6375 4150 60  0000 C CNN
F 2 "" H 6375 4150 60  0000 C CNN
F 3 "" H 6375 4150 60  0000 C CNN
	1    6375 4150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR8
U 1 1 55BCA695
P 6675 4000
F 0 "#PWR8" H 6675 3750 50  0001 C CNN
F 1 "GND" H 6675 3850 50  0000 C CNN
F 2 "" H 6675 4000 60  0000 C CNN
F 3 "" H 6675 4000 60  0000 C CNN
	1    6675 4000
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 55BCA69B
P 6050 4400
F 0 "R4" V 6050 4400 50  0000 C CNN
F 1 "UNREGULATED" V 5950 4400 50  0000 C CNN
F 2 "" V 5980 4400 30  0000 C CNN
F 3 "" H 6050 4400 30  0000 C CNN
	1    6050 4400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR11
U 1 1 55BCA6AB
P 6900 4650
F 0 "#PWR11" H 6900 4400 50  0001 C CNN
F 1 "GND" H 6900 4500 50  0000 C CNN
F 2 "" H 6900 4650 60  0000 C CNN
F 3 "" H 6900 4650 60  0000 C CNN
	1    6900 4650
	-1   0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 55BCA999
P 4825 3775
F 0 "C1" H 4850 3875 50  0000 L CNN
F 1 "100n" H 4850 3675 50  0000 L CNN
F 2 "" H 4863 3625 30  0000 C CNN
F 3 "" H 4825 3775 60  0000 C CNN
	1    4825 3775
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 55BCA9DA
P 5075 3775
F 0 "C2" H 5100 3875 50  0000 L CNN
F 1 "100n" H 5100 3675 50  0000 L CNN
F 2 "" H 5113 3625 30  0000 C CNN
F 3 "" H 5075 3775 60  0000 C CNN
	1    5075 3775
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 55BCACF8
P 4950 4075
F 0 "#PWR6" H 4950 3825 50  0001 C CNN
F 1 "GND" H 4950 3925 50  0000 C CNN
F 2 "" H 4950 4075 60  0000 C CNN
F 3 "" H 4950 4075 60  0000 C CNN
	1    4950 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 3525 4625 4700
Wire Wire Line
	4000 4900 4700 4900
Wire Wire Line
	4000 4900 4000 4975
Wire Wire Line
	4700 4800 3800 4800
Wire Wire Line
	3800 4800 3800 5525
Wire Wire Line
	4000 5475 4000 5525
Wire Wire Line
	4700 5000 4600 5000
Wire Wire Line
	4300 5000 4100 5000
Wire Wire Line
	4100 5000 4100 4900
Connection ~ 4100 4900
Wire Wire Line
	4000 4500 4700 4500
Wire Wire Line
	4000 4500 4000 4425
Wire Wire Line
	4700 4600 3800 4600
Wire Wire Line
	4000 3925 4000 3875
Wire Wire Line
	4700 4400 4600 4400
Wire Wire Line
	4300 4400 4100 4400
Wire Wire Line
	4100 4400 4100 4500
Connection ~ 4100 4500
Wire Wire Line
	5800 4900 6500 4900
Wire Wire Line
	6500 4900 6500 4975
Wire Wire Line
	5800 4800 6700 4800
Wire Wire Line
	6700 4800 6700 5525
Wire Wire Line
	6500 5475 6500 5525
Wire Wire Line
	6200 5000 6400 5000
Wire Wire Line
	6400 5000 6400 4900
Connection ~ 6400 4900
Wire Wire Line
	5800 5000 5900 5000
Wire Wire Line
	5800 4700 6800 4700
Wire Wire Line
	6800 4700 6800 4800
Wire Wire Line
	3800 4600 3800 4650
Wire Wire Line
	4625 4700 4700 4700
Wire Wire Line
	3825 3875 3825 4000
Wire Wire Line
	4000 3875 3825 3875
Wire Wire Line
	5800 4500 6500 4500
Wire Wire Line
	6500 4500 6500 4425
Wire Wire Line
	5800 4600 6900 4600
Wire Wire Line
	6500 3925 6500 3875
Wire Wire Line
	5800 4400 5900 4400
Wire Wire Line
	6200 4400 6400 4400
Wire Wire Line
	6400 4400 6400 4500
Connection ~ 6400 4500
Wire Wire Line
	6900 4600 6900 4650
Wire Wire Line
	6675 3875 6675 4000
Wire Wire Line
	6500 3875 6675 3875
Wire Wire Line
	4625 3525 5075 3525
Wire Wire Line
	5075 3525 5075 3625
Wire Wire Line
	4825 3525 4825 3625
Connection ~ 4825 3525
Wire Wire Line
	4950 4000 4950 4075
Wire Wire Line
	4825 3925 4825 4000
Wire Wire Line
	4825 4000 5075 4000
Wire Wire Line
	5075 4000 5075 3925
Connection ~ 4950 4000
$EndSCHEMATC