EESchema Schematic File Version 2
LIBS:solarTracker-rescue
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
LIBS:stm32f100c8t6b
LIBS:stm32f071cbt6
LIBS:74hc4052
LIBS:servo
LIBS:mc33063a
LIBS:adp3335
LIBS:swd
LIBS:lm2577
LIBS:solarTracker-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
L photodiode-RESCUE-solarTracker U6
U 1 1 55BD9EC1
P 3350 3600
AR Path="/55BDA44F/55BD9EC1" Ref="U6"  Part="1" 
AR Path="/55BD9D56/55BD9EC1" Ref="U3"  Part="1" 
AR Path="/55BDA313/55BD9EC1" Ref="U5"  Part="1" 
AR Path="/55BDA511/55BD9EC1" Ref="U8"  Part="1" 
F 0 "U3" H 3350 3600 60  0000 C CNN
F 1 "photodiode" H 3350 3600 60  0000 C CNN
F 2 "" H 3350 3600 60  0000 C CNN
F 3 "" H 3350 3600 60  0000 C CNN
F 4 "Farnell" H 3350 3600 60  0001 C CNN "Supplier"
F 5 "1212741" H 3350 3600 60  0001 C CNN "Order No"
	1    3350 3600
	0    1    -1   0   
$EndComp
$Comp
L R R11
U 1 1 55BD9EC8
P 4400 2750
AR Path="/55BDA44F/55BD9EC8" Ref="R11"  Part="1" 
AR Path="/55BD9D56/55BD9EC8" Ref="R1"  Part="1" 
AR Path="/55BDA313/55BD9EC8" Ref="R6"  Part="1" 
AR Path="/55BDA511/55BD9EC8" Ref="R16"  Part="1" 
F 0 "R1" V 4425 2750 50  0000 C CNN
F 1 "UNREGULATED" V 4525 2775 50  0000 C CNN
F 2 "" V 4330 2750 30  0000 C CNN
F 3 "" H 4400 2750 30  0000 C CNN
	1    4400 2750
	0    -1   1    0   
$EndComp
$Comp
L GNDA #PWR021
U 1 1 55BD9ECF
P 3475 3925
AR Path="/55BDA44F/55BD9ECF" Ref="#PWR021"  Part="1" 
AR Path="/55BD9D56/55BD9ECF" Ref="#PWR09"  Part="1" 
AR Path="/55BDA313/55BD9ECF" Ref="#PWR015"  Part="1" 
AR Path="/55BDA511/55BD9ECF" Ref="#PWR027"  Part="1" 
F 0 "#PWR09" H 3475 3675 50  0001 C CNN
F 1 "GNDA" H 3475 3775 50  0000 C CNN
F 2 "" H 3475 3925 60  0000 C CNN
F 3 "" H 3475 3925 60  0000 C CNN
	1    3475 3925
	1    0    0    -1  
$EndComp
$Comp
L LM324N U7
U 1 1 55BD9ED5
P 4100 3225
AR Path="/55BDA44F/55BD9ED5" Ref="U7"  Part="1" 
AR Path="/55BD9D56/55BD9ED5" Ref="U4"  Part="1" 
AR Path="/55BDA313/55BD9ED5" Ref="U4"  Part="3" 
AR Path="/55BDA511/55BD9ED5" Ref="U7"  Part="3" 
F 0 "U4" H 4150 3425 60  0000 C CNN
F 1 "LM324N" H 4250 3025 50  0000 C CNN
F 2 "" H 4100 3225 60  0000 C CNN
F 3 "" H 4100 3225 60  0000 C CNN
F 4 "Farnell" H 4100 3225 60  0001 C CNN "Supplier"
F 5 "1564884" H 4100 3225 60  0001 C CNN "Order No"
	1    4100 3225
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR022
U 1 1 55BD9EDC
P 4000 2625
AR Path="/55BDA44F/55BD9EDC" Ref="#PWR022"  Part="1" 
AR Path="/55BD9D56/55BD9EDC" Ref="#PWR010"  Part="1" 
AR Path="/55BDA313/55BD9EDC" Ref="#PWR016"  Part="1" 
AR Path="/55BDA511/55BD9EDC" Ref="#PWR028"  Part="1" 
F 0 "#PWR010" H 4000 2475 50  0001 C CNN
F 1 "+3V3" H 4000 2765 50  0000 C CNN
F 2 "" H 4000 2625 60  0000 C CNN
F 3 "" H 4000 2625 60  0000 C CNN
	1    4000 2625
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 55BD9EF7
P 5700 3225
AR Path="/55BDA44F/55BD9EF7" Ref="R13"  Part="1" 
AR Path="/55BD9D56/55BD9EF7" Ref="R3"  Part="1" 
AR Path="/55BDA313/55BD9EF7" Ref="R8"  Part="1" 
AR Path="/55BDA511/55BD9EF7" Ref="R18"  Part="1" 
F 0 "R3" V 5780 3225 50  0000 C CNN
F 1 "150k" V 5625 3225 50  0000 C CNN
F 2 "" V 5630 3225 30  0000 C CNN
F 3 "" H 5700 3225 30  0000 C CNN
	1    5700 3225
	0    1    1    0   
$EndComp
$Comp
L R R14
U 1 1 55BD9EFE
P 7350 3625
AR Path="/55BDA44F/55BD9EFE" Ref="R14"  Part="1" 
AR Path="/55BD9D56/55BD9EFE" Ref="R4"  Part="1" 
AR Path="/55BDA313/55BD9EFE" Ref="R9"  Part="1" 
AR Path="/55BDA511/55BD9EFE" Ref="R19"  Part="1" 
F 0 "R4" V 7430 3625 50  0000 C CNN
F 1 "33k" V 7250 3625 50  0000 C CNN
F 2 "" V 7280 3625 30  0000 C CNN
F 3 "" H 7350 3625 30  0000 C CNN
F 4 "Farnell" V 7350 3625 60  0001 C CNN "Supplier"
F 5 "2329898" V 7350 3625 60  0001 C CNN "Order No"
	1    7350 3625
	-1   0    0    1   
$EndComp
$Comp
L R R12
U 1 1 55BD9F05
P 5150 3225
AR Path="/55BDA44F/55BD9F05" Ref="R12"  Part="1" 
AR Path="/55BD9D56/55BD9F05" Ref="R2"  Part="1" 
AR Path="/55BDA313/55BD9F05" Ref="R7"  Part="1" 
AR Path="/55BDA511/55BD9F05" Ref="R17"  Part="1" 
F 0 "R2" V 5230 3225 50  0000 C CNN
F 1 "150k" V 5075 3225 50  0000 C CNN
F 2 "" V 5080 3225 30  0000 C CNN
F 3 "" H 5150 3225 30  0000 C CNN
	1    5150 3225
	0    1    1    0   
$EndComp
$Comp
L GNDA #PWR023
U 1 1 55BD9F18
P 5950 3975
AR Path="/55BDA44F/55BD9F18" Ref="#PWR023"  Part="1" 
AR Path="/55BD9D56/55BD9F18" Ref="#PWR011"  Part="1" 
AR Path="/55BDA313/55BD9F18" Ref="#PWR017"  Part="1" 
AR Path="/55BDA511/55BD9F18" Ref="#PWR029"  Part="1" 
F 0 "#PWR011" H 5950 3725 50  0001 C CNN
F 1 "GNDA" H 5950 3825 50  0000 C CNN
F 2 "" H 5950 3975 60  0000 C CNN
F 3 "" H 5950 3975 60  0000 C CNN
	1    5950 3975
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 55BD9F21
P 7350 4050
AR Path="/55BDA44F/55BD9F21" Ref="R15"  Part="1" 
AR Path="/55BD9D56/55BD9F21" Ref="R5"  Part="1" 
AR Path="/55BDA313/55BD9F21" Ref="R10"  Part="1" 
AR Path="/55BDA511/55BD9F21" Ref="R20"  Part="1" 
F 0 "R5" V 7430 4050 50  0000 C CNN
F 1 "56k" V 7250 4050 50  0000 C CNN
F 2 "" V 7280 4050 30  0000 C CNN
F 3 "" H 7350 4050 30  0000 C CNN
F 4 "Farnell" V 7350 4050 60  0001 C CNN "Supplier"
F 5 "2330000" V 7350 4050 60  0001 C CNN "Order No"
	1    7350 4050
	-1   0    0    1   
$EndComp
$Comp
L GNDA #PWR024
U 1 1 55BD9F2A
P 7350 4325
AR Path="/55BDA44F/55BD9F2A" Ref="#PWR024"  Part="1" 
AR Path="/55BD9D56/55BD9F2A" Ref="#PWR012"  Part="1" 
AR Path="/55BDA313/55BD9F2A" Ref="#PWR018"  Part="1" 
AR Path="/55BDA511/55BD9F2A" Ref="#PWR030"  Part="1" 
F 0 "#PWR012" H 7350 4075 50  0001 C CNN
F 1 "GNDA" H 7350 4175 50  0000 C CNN
F 2 "" H 7350 4325 60  0000 C CNN
F 3 "" H 7350 4325 60  0000 C CNN
	1    7350 4325
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR025
U 1 1 55BD9F36
P 6600 2825
AR Path="/55BDA44F/55BD9F36" Ref="#PWR025"  Part="1" 
AR Path="/55BD9D56/55BD9F36" Ref="#PWR013"  Part="1" 
AR Path="/55BDA313/55BD9F36" Ref="#PWR019"  Part="1" 
AR Path="/55BDA511/55BD9F36" Ref="#PWR031"  Part="1" 
F 0 "#PWR013" H 6600 2675 50  0001 C CNN
F 1 "+3V3" H 6600 2965 50  0000 C CNN
F 2 "" H 6600 2825 60  0000 C CNN
F 3 "" H 6600 2825 60  0000 C CNN
	1    6600 2825
	1    0    0    -1  
$EndComp
Text HLabel 7550 3325 2    60   Output ~ 0
DIO
$Comp
L GNDA #PWR026
U 1 1 55BDC59E
P 6600 4000
AR Path="/55BDA44F/55BDC59E" Ref="#PWR026"  Part="1" 
AR Path="/55BD9D56/55BDC59E" Ref="#PWR014"  Part="1" 
AR Path="/55BDA313/55BDC59E" Ref="#PWR020"  Part="1" 
AR Path="/55BDA511/55BDC59E" Ref="#PWR032"  Part="1" 
F 0 "#PWR014" H 6600 3750 50  0001 C CNN
F 1 "GNDA" H 6600 3850 50  0000 C CNN
F 2 "" H 6600 4000 60  0000 C CNN
F 3 "" H 6600 4000 60  0000 C CNN
	1    6600 4000
	1    0    0    -1  
$EndComp
Text Notes 5650 2400 0    60   ~ 0
2nd order Butterworth filter, cut off at ~0.1Hz\n
$Comp
L C C16
U 1 1 55BDDF51
P 6975 2900
AR Path="/55BDA44F/55BDDF51" Ref="C16"  Part="1" 
AR Path="/55BD9D56/55BDDF51" Ref="C12"  Part="1" 
AR Path="/55BDA313/55BDDF51" Ref="C14"  Part="1" 
AR Path="/55BDA511/55BDDF51" Ref="C18"  Part="1" 
F 0 "C12" V 7125 2850 50  0000 L CNN
F 1 "470n" H 7000 2800 50  0000 L CNN
F 2 "" H 7013 2750 30  0000 C CNN
F 3 "" H 6975 2900 60  0000 C CNN
F 4 "Farnell" V 6975 2900 60  0001 C CNN "Supplier"
F 5 "2429337" V 6975 2900 60  0001 C CNN "Order No"
	1    6975 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	3475 3825 3475 3925
Wire Wire Line
	3475 3325 3600 3325
Wire Wire Line
	4600 3225 5000 3225
Wire Wire Line
	4775 3225 4775 2750
Wire Wire Line
	4775 2750 4550 2750
Connection ~ 4775 3225
Wire Wire Line
	4250 2750 3475 2750
Wire Wire Line
	3475 2750 3475 3125
Wire Wire Line
	3475 3125 3600 3125
Wire Wire Line
	4000 3625 4000 3850
Wire Wire Line
	4000 3850 3475 3850
Connection ~ 3475 3850
Wire Wire Line
	4000 2825 4000 2625
Wire Wire Line
	5300 3225 5550 3225
Wire Wire Line
	5850 3225 6200 3225
Wire Wire Line
	5950 3475 5950 3225
Connection ~ 5950 3225
Wire Wire Line
	5950 3775 5950 3975
Wire Wire Line
	7200 3325 7550 3325
Wire Wire Line
	7350 3325 7350 3475
Connection ~ 7350 3325
Wire Wire Line
	7350 3775 7350 3900
Wire Wire Line
	7350 4200 7350 4325
Wire Wire Line
	7350 3850 6175 3850
Wire Wire Line
	6175 3850 6175 3425
Wire Wire Line
	6175 3425 6200 3425
Connection ~ 7350 3850
Wire Wire Line
	6600 2825 6600 2925
Wire Wire Line
	6600 3725 6600 4000
Wire Wire Line
	5450 3225 5450 2900
Wire Wire Line
	5450 2900 6825 2900
Connection ~ 5450 3225
Wire Wire Line
	7250 3325 7250 2900
Wire Wire Line
	7250 2900 7125 2900
Connection ~ 7250 3325
Text Notes 2850 4275 0    60   ~ 0
output from first amp proportional to the photocurrent
$Comp
L LM324N U7
U 2 1 55BDFBFD
P 6700 3325
AR Path="/55BDA44F/55BDFBFD" Ref="U7"  Part="2" 
AR Path="/55BD9D56/55BDFBFD" Ref="U4"  Part="2" 
AR Path="/55BDA313/55BDFBFD" Ref="U4"  Part="4" 
AR Path="/55BDA511/55BDFBFD" Ref="U7"  Part="4" 
F 0 "U4" H 6750 3525 60  0000 C CNN
F 1 "LM324N" H 6850 3125 50  0000 C CNN
F 2 "" H 6700 3325 60  0000 C CNN
F 3 "" H 6700 3325 60  0000 C CNN
	2    6700 3325
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 55BD33E1
P 5950 3625
AR Path="/55BD9D56/55BD33E1" Ref="C11"  Part="1" 
AR Path="/55BDA313/55BD33E1" Ref="C13"  Part="1" 
AR Path="/55BDA44F/55BD33E1" Ref="C15"  Part="1" 
AR Path="/55BDA511/55BD33E1" Ref="C17"  Part="1" 
F 0 "C11" H 6025 3750 50  0000 L CNN
F 1 "470n" H 5975 3525 50  0000 L CNN
F 2 "" H 5988 3475 30  0000 C CNN
F 3 "" H 5950 3625 60  0000 C CNN
F 4 "Farnell" V 5950 3625 60  0001 C CNN "Supplier"
F 5 "2429337" V 5950 3625 60  0001 C CNN "Order No"
	1    5950 3625
	-1   0    0    1   
$EndComp
Text Notes 8025 4300 1    60   ~ 0
10.2k  and 17.4k for maximum precision
$EndSCHEMATC
