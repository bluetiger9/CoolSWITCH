EESchema Schematic File Version 4
LIBS:CoolMOS-Relay-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Industry 4.0 CoolSWITCH"
Date "2019-01-05"
Rev "0.99"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CoolMOSG7:IPT60R028G7 Q1
U 1 1 5C0D59B3
P 9150 1500
F 0 "Q1" H 9355 1546 50  0000 L CNN
F 1 "IPT60R028G7" H 9355 1455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:Infineon_PG-HDSOP-10-1" H 9000 2100 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/Infineon-IPT60R028G7-DS-v02_00-EN.pdf?fileId=5546d4626102d35a0161707eb2f97810" H 9150 1500 50  0001 L CNN
	1    9150 1500
	1    0    0    -1  
$EndComp
$Comp
L CoolMOSG7:IPT60R028G7 Q2
U 1 1 5C0D4110
P 9150 2300
F 0 "Q2" H 9355 2346 50  0000 L CNN
F 1 "IPT60R028G7" H 9355 2255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:Infineon_PG-HDSOP-10-1" H 9000 2900 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/Infineon-IPT60R028G7-DS-v02_00-EN.pdf?fileId=5546d4626102d35a0161707eb2f97810" H 9150 2300 50  0001 L CNN
	1    9150 2300
	1    0    0    1   
$EndComp
Wire Wire Line
	9250 1700 9250 1850
Wire Wire Line
	8950 2300 8800 2300
Wire Wire Line
	8800 1500 8950 1500
$Comp
L CoolMOSG7:LNK3206D-TL IC1
U 1 1 5C12FFE0
P 1850 6550
F 0 "IC1" H 2400 6100 50  0000 C CNN
F 1 "LNK3206D-TL" H 2400 6724 50  0000 C CNN
F 2 "CoolMosFootprintLib:LNK3206D" H 2800 6650 50  0001 L CNN
F 3 "http://www.mouser.com/ds/2/328/LinkSwitch-TN2_family_datasheet-1036065.pdf" H 2800 6550 50  0001 L CNN
F 4 "POWER INTEGRATIONS - LNK3206D-TL - AC/DC CONV, BUCK-BOOST/FLYBACK, SOIC-8" H 2800 6450 50  0001 L CNN "Description"
F 5 "Power Integrations" H 2800 6250 50  0001 L CNN "Manufacturer_Name"
F 6 "LNK3206D-TL" H 2800 6150 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "1464600" H 2800 6050 50  0001 L CNN "RS Part Number"
F 8 "http://uk.rs-online.com/web/p/products/1464600" H 2800 5950 50  0001 L CNN "RS Price/Stock"
F 9 "869-LNK3206D-TL" H 2800 5850 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.com/Search/Refine.aspx?Keyword=869-LNK3206D-TL" H 2800 5750 50  0001 L CNN "Mouser Price/Stock"
	1    1850 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 6850 1850 6950
Wire Wire Line
	1850 7050 3150 7050
Wire Wire Line
	3150 6650 2950 6650
Wire Wire Line
	2950 6550 3150 6550
Wire Wire Line
	3150 6550 3150 6650
Connection ~ 3150 6650
Wire Wire Line
	3150 6650 3150 6750
Wire Wire Line
	3150 6750 2950 6750
Connection ~ 3150 6750
Wire Wire Line
	3150 6750 3150 7050
$Comp
L Device:L L2
U 1 1 5C13197B
P 3600 6650
F 0 "L2" V 3790 6650 50  0000 C CNN
F 1 "1.2uH (400mA)" V 3699 6650 50  0000 C CNN
F 2 "Inductor_SMD:L_12x12mm_H8mm" H 3600 6650 50  0001 C CNN
F 3 "~" H 3600 6650 50  0001 C CNN
	1    3600 6650
	0    -1   -1   0   
$EndComp
$Comp
L Isolator:PC817 U1
U 1 1 5C131EA1
P 4600 6850
F 0 "U1" H 4600 7175 50  0000 C CNN
F 1 "PC817" H 4600 7084 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 4400 6650 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 4600 6850 50  0001 L CNN
	1    4600 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small Dz1
U 1 1 5C13308A
P 4100 7250
F 0 "Dz1" V 4054 7318 50  0000 L CNN
F 1 "11V" V 4145 7318 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323" V 4100 7250 50  0001 C CNN
F 3 "~" V 4100 7250 50  0001 C CNN
	1    4100 7250
	0    1    1    0   
$EndComp
$Comp
L Device:D D1
U 1 1 5C1341E2
P 3450 7000
F 0 "D1" V 3500 6850 50  0000 L CNN
F 1 "CD1408" V 3600 6700 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 3450 7000 50  0001 C CNN
F 3 "~" H 3450 7000 50  0001 C CNN
	1    3450 7000
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 7150 3450 7350
Wire Wire Line
	3450 6850 3450 6650
Wire Wire Line
	3450 7350 3750 7350
Connection ~ 3450 7350
$Comp
L Device:CP1_Small C4
U 1 1 5C138338
P 3750 7000
F 0 "C4" H 3841 7046 50  0000 L CNN
F 1 "220uF (16V)" H 3841 6955 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 3750 7000 50  0001 C CNN
F 3 "~" H 3750 7000 50  0001 C CNN
	1    3750 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 7100 3750 7350
Connection ~ 3750 7350
Wire Wire Line
	3750 7350 4100 7350
Wire Wire Line
	3750 6650 3750 6900
Wire Wire Line
	4300 6950 4100 6950
Wire Wire Line
	4100 6950 4100 7150
Wire Wire Line
	3750 6650 4100 6650
Wire Wire Line
	4300 6650 4300 6750
Connection ~ 3750 6650
$Comp
L Device:R R2
U 1 1 5C13CE38
P 4100 6800
F 0 "R2" H 4170 6846 50  0000 L CNN
F 1 "1k (1%)" H 4170 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4030 6800 50  0001 C CNN
F 3 "~" H 4100 6800 50  0001 C CNN
	1    4100 6800
	1    0    0    -1  
$EndComp
Connection ~ 4100 6650
Wire Wire Line
	4100 6650 4250 6650
Connection ~ 4100 6950
Wire Wire Line
	3450 6650 3150 6650
Connection ~ 3450 6650
$Comp
L Device:C_Small C3
U 1 1 5C13E1B0
P 1750 6950
F 0 "C3" V 1800 6850 50  0000 C CNN
F 1 "0.1uF (25V)" V 1900 7000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1750 6950 50  0001 C CNN
F 3 "~" H 1750 6950 50  0001 C CNN
	1    1750 6950
	0    1    1    0   
$EndComp
Connection ~ 1850 6950
Wire Wire Line
	1850 6950 1850 7050
Wire Wire Line
	1850 6550 1650 6550
Wire Wire Line
	1650 6550 1650 6950
Wire Wire Line
	4900 6950 5000 6950
Wire Wire Line
	5000 6950 5000 7050
Wire Wire Line
	5000 7500 1500 7500
Wire Wire Line
	1500 7500 1500 6650
Wire Wire Line
	1500 6650 1850 6650
Wire Wire Line
	4900 6750 5000 6750
Wire Wire Line
	5000 6750 5000 6650
Wire Wire Line
	5000 6200 1650 6200
Wire Wire Line
	1650 6200 1650 6550
Connection ~ 1650 6550
Wire Wire Line
	4250 6650 4250 6400
Connection ~ 4250 6650
Wire Wire Line
	4250 6650 4300 6650
Connection ~ 4100 7350
Text Notes 1100 6050 0    128  ~ 26
87-300V DC to 12V DC Power Supply
$Comp
L CoolMOSG7:IE1203S PS1
U 1 1 5C15093F
P 8200 6650
F 0 "PS1" H 8800 6915 50  0000 C CNN
F 1 "IE1203S" H 8800 6824 50  0000 C CNN
F 2 "CoolMosFootprintLib:IE1224S-H" H 9250 6750 50  0001 L CNN
F 3 "https://www.xppower.com/pdfs/SF_IE.pdf" H 9250 6650 50  0001 L CNN
F 4 "DC/DC Converter Isolated 3.3V 1W" H 9250 6550 50  0001 L CNN "Description"
F 5 "XP POWER" H 9250 6350 50  0001 L CNN "Manufacturer_Name"
F 6 "IE1203S" H 9250 6250 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "1672773" H 9250 6150 50  0001 L CNN "RS Part Number"
F 8 "http://uk.rs-online.com/web/p/products/1672773" H 9250 6050 50  0001 L CNN "RS Price/Stock"
F 9 "70812843" H 9250 5950 50  0001 L CNN "Allied_Number"
F 10 "https://www.alliedelec.com/xp-power-ie1203s/70812843/" H 9250 5850 50  0001 L CNN "Allied Price/Stock"
F 11 "1672773" H 9250 5750 50  0001 L CNN "Mouser Part Number"
F 12 "http://uk.rs-online.com/web/p/products/1672773" H 9250 5650 50  0001 L CNN "Mouser Price/Stock"
	1    8200 6650
	1    0    0    -1  
$EndComp
Text GLabel 7900 6750 0    50   Input ~ 0
12V
Text GLabel 7900 6650 0    50   Input ~ 0
GND
Wire Wire Line
	7900 6650 8050 6650
Wire Wire Line
	8200 6750 8050 6750
Text GLabel 10150 6750 2    50   Input ~ 0
3.3V
Text GLabel 9900 6500 2    50   Input ~ 0
GND(logic)
Text GLabel 1400 1300 0    50   Input ~ 0
3.3V
Text GLabel 1900 3300 0    50   Input ~ 0
GND(logic)
Wire Wire Line
	3050 3100 3050 3300
Text Notes 7150 6250 0    128  ~ 26
12V to 3.3V Isolated Power Supply
Wire Wire Line
	8800 1500 8800 1850
$Comp
L CoolMOSG7:1EDI20I12MFXUMA1 IC2
U 1 1 5C161801
P 6750 1700
F 0 "IC2" H 7000 1200 50  0000 C CNN
F 1 "1EDI20N12AFXUMA1" H 7350 1874 50  0000 C CNN
F 2 "CoolMosFootprintLib:SOIC127P600X175-8N" H 7800 1800 50  0001 L CNN
F 3 "http://www.infineon.com/dgdl/Infineon-1EDIXXI12MF-DS-v02_00-EN.pdf?fileId=5546d46145f1f3a401462944e0190fd7" H 7800 1700 50  0001 L CNN
F 4 "Gate Drivers DRIVER IC" H 7800 1600 50  0001 L CNN "Description"
F 5 "1.75" H 7800 1500 50  0001 L CNN "Height"
F 6 "Infineon" H 7800 1400 50  0001 L CNN "Manufacturer_Name"
F 7 "1EDI20I12MFXUMA1" H 7800 1300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "1339911" H 7800 1200 50  0001 L CNN "RS Part Number"
F 9 "http://uk.rs-online.com/web/p/products/1339911" H 7800 1100 50  0001 L CNN "RS Price/Stock"
F 10 "726-1EDI20I12MFXUMA1" H 7800 1000 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.com/Search/Refine.aspx?Keyword=726-1EDI20I12MFXUMA1" H 7800 900 50  0001 L CNN "Mouser Price/Stock"
	1    6750 1700
	1    0    0    -1  
$EndComp
Text GLabel 7850 1250 1    50   Input ~ 0
12V
Wire Wire Line
	7950 2000 8000 2000
Text GLabel 8000 2300 3    50   Input ~ 0
GND
Wire Wire Line
	7950 1700 8000 1700
Wire Wire Line
	8000 1700 8000 1500
$Comp
L Device:R_Small R1
U 1 1 5C167A79
P 8200 1900
F 0 "R1" V 8300 1900 50  0000 C CNN
F 1 "24 ohm (.5W)" V 8400 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8200 1900 50  0001 C CNN
F 3 "~" H 8200 1900 50  0001 C CNN
	1    8200 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5C167B86
P 8200 1800
F 0 "R3" V 8000 1800 50  0000 C CNN
F 1 "48 ohm (.5W)" V 8100 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8200 1800 50  0001 C CNN
F 3 "~" H 8200 1800 50  0001 C CNN
	1    8200 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 1800 8100 1800
Wire Wire Line
	7950 1900 8100 1900
Wire Wire Line
	8300 1800 8550 1800
Wire Wire Line
	8550 1800 8550 1850
Wire Wire Line
	8550 1900 8300 1900
Wire Wire Line
	8550 1850 8800 1850
Connection ~ 8550 1850
Wire Wire Line
	8550 1850 8550 1900
Connection ~ 8800 1850
Wire Wire Line
	8800 1850 8800 2300
Wire Wire Line
	8650 1500 8000 1500
$Comp
L Device:C_Small C6
U 1 1 5C171960
P 8100 1350
F 0 "C6" V 8200 1400 50  0000 C CNN
F 1 "1uF" V 8300 1450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8100 1350 50  0001 C CNN
F 3 "~" H 8100 1350 50  0001 C CNN
	1    8100 1350
	0    -1   -1   0   
$EndComp
Text GLabel 10550 2850 2    50   Input ~ 0
Load
Wire Wire Line
	9250 1300 9250 1200
Wire Wire Line
	9250 1200 10050 1200
Text GLabel 6150 1700 0    50   Input ~ 0
3.3V
Text GLabel 6200 2000 0    50   Input ~ 0
GND(logic)
Text GLabel 6150 1800 0    50   Input ~ 0
Mosfet_En
Wire Wire Line
	6400 1800 6750 1800
Wire Wire Line
	6750 1900 6750 2000
Connection ~ 6750 2000
$Comp
L Device:C_Small C5
U 1 1 5C183BB6
P 6600 1850
F 0 "C5" H 6700 1850 50  0000 L CNN
F 1 "100n" H 6500 1750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6600 1850 50  0001 C CNN
F 3 "~" H 6600 1850 50  0001 C CNN
	1    6600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1950 6600 2000
Connection ~ 6600 2000
Wire Wire Line
	6600 2000 6750 2000
Wire Wire Line
	6600 1750 6600 1700
Connection ~ 6600 1700
Wire Wire Line
	6600 1700 6750 1700
$Comp
L CoolMOSG7:TLI4970D050T4XUMA1 IC3
U 1 1 5C18AAE4
P 6750 2900
F 0 "IC3" H 7050 2250 50  0000 C CNN
F 1 "TLI4970D050T4XUMA1" H 7300 3000 50  0000 C CNN
F 2 "CoolMosFootprintLib:Infineon_PG-HSOF-8-1_ThermalVias_fixed" H 7700 3000 50  0001 L CNN
F 3 "https://www.infineon.com/dgdl/Infineon-TLI4970-D050T4-DS-v01_01-EN.pdf?fileId=" H 7700 2900 50  0001 L CNN
F 4 "Coreless Magnetic Current Sensor 50A" H 7700 2800 50  0001 L CNN "Description"
F 5 "Infineon" H 7700 2600 50  0001 L CNN "Manufacturer_Name"
F 6 "TLI4970D050T4XUMA1" H 7700 2500 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "1362037P" H 7700 2400 50  0001 L CNN "RS Part Number"
F 8 "http://uk.rs-online.com/web/p/products/1362037P" H 7700 2300 50  0001 L CNN "RS Price/Stock"
F 9 "726-TLI4970D050T4XUM" H 7700 2200 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.com/Search/Refine.aspx?Keyword=726-TLI4970D050T4XUM" H 7700 2100 50  0001 L CNN "Mouser Price/Stock"
	1    6750 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2500 9250 2850
Wire Wire Line
	9250 2850 10050 2850
Text GLabel 6300 3300 0    50   Input ~ 0
CRNT_CS
Text GLabel 6300 3400 0    50   Input ~ 0
CRNT_OCD
Text GLabel 6300 2800 0    50   Input ~ 0
GND(logic)
Text GLabel 6300 3000 0    50   Input ~ 0
3.3V
Wire Wire Line
	6750 3000 6500 3000
Text GLabel 6300 3100 0    50   Input ~ 0
CRNT_DOUT
Text GLabel 6300 3200 0    50   Input ~ 0
CRNT_SCLK
Wire Wire Line
	6300 3100 6750 3100
Wire Wire Line
	6750 3200 6300 3200
Text GLabel 1900 2500 0    50   Input ~ 0
CRNT_DOUT
Text GLabel 1900 2900 0    50   Input ~ 0
CRNT_SCLK
Text GLabel 1900 2600 0    50   Input ~ 0
CRNT_CS
Text GLabel 1900 2700 0    50   Input ~ 0
CRNT_OCD
Wire Wire Line
	1900 2900 2450 2900
Wire Wire Line
	2450 2500 1900 2500
Wire Wire Line
	2450 2700 1900 2700
Text GLabel 4000 2100 2    50   Input ~ 0
ESP_RX
Text GLabel 4000 1900 2    50   Input ~ 0
ESP_TX
Wire Wire Line
	3650 1900 4000 1900
Wire Wire Line
	4000 2100 3650 2100
Text GLabel 3950 2500 2    50   Input ~ 0
Mosfet_En
Wire Wire Line
	3050 1300 3050 1600
$Comp
L Device:R_Small R4
U 1 1 5C1DEF21
P 2050 1550
F 0 "R4" H 2109 1596 50  0000 L CNN
F 1 "10k" H 2109 1505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2050 1550 50  0001 C CNN
F 3 "~" H 2050 1550 50  0001 C CNN
	1    2050 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1450 2050 1300
Wire Wire Line
	2050 1650 2050 1800
Wire Wire Line
	1350 1800 1350 3150
Wire Wire Line
	2700 3300 2700 3150
Wire Wire Line
	2700 3150 1350 3150
Connection ~ 2700 3300
Wire Wire Line
	2700 3300 3050 3300
Wire Wire Line
	2050 1300 2300 1300
Wire Wire Line
	1500 1800 1350 1800
Wire Wire Line
	1400 1300 1500 1300
Connection ~ 2050 1300
$Comp
L Device:R_Small R5
U 1 1 5C21D5C7
P 2300 1550
F 0 "R5" H 2359 1596 50  0000 L CNN
F 1 "10k" H 2359 1505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2300 1550 50  0001 C CNN
F 3 "~" H 2300 1550 50  0001 C CNN
	1    2300 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1650 2300 2000
Wire Wire Line
	2300 2000 2450 2000
Wire Wire Line
	2300 1450 2300 1300
Connection ~ 2300 1300
Wire Wire Line
	2300 1300 3050 1300
$Comp
L Device:R_Small R8
U 1 1 5C22E7FA
P 4000 2800
F 0 "R8" H 4059 2846 50  0000 L CNN
F 1 "10k" H 4059 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4000 2800 50  0001 C CNN
F 3 "~" H 4000 2800 50  0001 C CNN
	1    4000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3300 4000 2900
Connection ~ 3050 3300
Wire Wire Line
	3650 2700 4000 2700
$Comp
L Device:R_Small R7
U 1 1 5C23A56B
P 3900 1500
F 0 "R7" H 3959 1546 50  0000 L CNN
F 1 "10k" H 3959 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3900 1500 50  0001 C CNN
F 3 "~" H 3900 1500 50  0001 C CNN
	1    3900 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1600 3900 2000
Wire Wire Line
	3900 2000 3650 2000
Wire Wire Line
	3900 1400 3900 1300
Wire Wire Line
	3900 1300 3750 1300
Connection ~ 3050 1300
Text GLabel 4050 1750 2    50   Input ~ 0
ESP_GPIO0
$Comp
L Device:R_Small R6
U 1 1 5C246D65
P 3750 1500
F 0 "R6" H 3600 1550 50  0000 L CNN
F 1 "10k" H 3550 1450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3750 1500 50  0001 C CNN
F 3 "~" H 3750 1500 50  0001 C CNN
	1    3750 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1400 3750 1300
Connection ~ 3750 1300
Wire Wire Line
	3750 1300 3050 1300
Wire Wire Line
	3750 1600 3750 1750
Wire Wire Line
	3750 1800 3650 1800
Wire Wire Line
	4050 1750 3750 1750
Connection ~ 3750 1750
Wire Wire Line
	3750 1750 3750 1800
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 5C25B038
P 6700 4850
F 0 "J1" H 6806 5228 50  0000 C CNN
F 1 "Prog" H 6806 5137 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 6700 4850 50  0001 C CNN
F 3 "~" H 6700 4850 50  0001 C CNN
	1    6700 4850
	-1   0    0    -1  
$EndComp
Text GLabel 6350 4850 0    50   Input ~ 0
ESP_RX
Text GLabel 6350 4750 0    50   Input ~ 0
ESP_TX
Text GLabel 6350 4650 0    50   Input ~ 0
ESP_GPIO0
Text GLabel 1950 2150 0    50   Input ~ 0
ESP_RST
Text GLabel 6350 4950 0    50   Input ~ 0
ESP_RST
Text GLabel 6350 5050 0    50   Input ~ 0
GND(logic)
Wire Wire Line
	6350 5050 6500 5050
Wire Wire Line
	6350 4950 6500 4950
Wire Wire Line
	6350 4850 6500 4850
Wire Wire Line
	6350 4750 6500 4750
Wire Wire Line
	6350 4650 6500 4650
Text GLabel 4050 2300 2    50   Input ~ 0
CTRL_IN
Wire Wire Line
	4050 2300 3800 2300
$Comp
L Device:R_Small R9
U 1 1 5C2ABC7A
P 3800 3000
F 0 "R9" H 3859 3046 50  0000 L CNN
F 1 "10k" H 3859 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3800 3000 50  0001 C CNN
F 3 "~" H 3800 3000 50  0001 C CNN
	1    3800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2900 3800 2300
Connection ~ 3800 2300
Wire Wire Line
	3800 2300 3650 2300
Wire Wire Line
	3800 3100 3800 3300
Connection ~ 3800 3300
Wire Wire Line
	3800 3300 4000 3300
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5C2BC40C
P 7800 4550
F 0 "J2" H 7950 4750 50  0000 R CNN
F 1 "CTRL_IN" H 7950 4650 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7800 4550 50  0001 C CNN
F 3 "~" H 7800 4550 50  0001 C CNN
	1    7800 4550
	-1   0    0    -1  
$EndComp
Text GLabel 7400 4550 0    50   Input ~ 0
CTRL_IN
Wire Wire Line
	7400 4550 7600 4550
Text GLabel 7400 4650 0    50   Input ~ 0
GND(logic)
Wire Wire Line
	7400 4650 7600 4650
$Comp
L RF_Module:ESP-12E U2
U 1 1 5C1584CF
P 3050 2400
F 0 "U2" H 2700 3150 50  0000 C CNN
F 1 "ESP-12E" H 3350 3150 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 3050 2400 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 2700 2500 50  0001 C CNN
	1    3050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3300 3800 3300
Wire Wire Line
	3650 2500 3950 2500
$Comp
L Device:R_Small R10
U 1 1 5C3001F0
P 6400 1900
F 0 "R10" H 6200 1950 50  0000 L CNN
F 1 "10k" H 6200 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6400 1900 50  0001 C CNN
F 3 "~" H 6400 1900 50  0001 C CNN
	1    6400 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2000 6600 2000
Wire Wire Line
	6200 2000 6400 2000
Connection ~ 6400 2000
Wire Wire Line
	6150 1800 6400 1800
Connection ~ 6400 1800
Wire Wire Line
	6150 1700 6600 1700
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5C322AFE
P 7800 5050
F 0 "J3" H 7906 5328 50  0000 C CNN
F 1 "Direct_Ctrl" H 7906 5237 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7800 5050 50  0001 C CNN
F 3 "~" H 7800 5050 50  0001 C CNN
	1    7800 5050
	-1   0    0    -1  
$EndComp
Text GLabel 7400 5050 0    50   Input ~ 0
Mosfet_En
Text GLabel 7400 5150 0    50   Input ~ 0
GND(logic)
Text GLabel 7400 4950 0    50   Input ~ 0
3.3V
Wire Wire Line
	7400 4950 7600 4950
Wire Wire Line
	7400 5050 7600 5050
Wire Wire Line
	7400 5150 7600 5150
$Comp
L Device:CP1_Small C9
U 1 1 5C3709B0
P 9750 6650
F 0 "C9" H 9950 6600 50  0000 R CNN
F 1 "100u" H 9650 6650 50  0000 R CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.4" H 9750 6650 50  0001 C CNN
F 3 "~" H 9750 6650 50  0001 C CNN
	1    9750 6650
	-1   0    0    1   
$EndComp
Wire Wire Line
	9750 6750 9400 6750
Wire Wire Line
	9750 6550 9750 6500
Wire Wire Line
	9750 6500 9900 6500
Wire Wire Line
	9750 6500 9400 6500
Wire Wire Line
	9400 6500 9400 6650
Connection ~ 9750 6500
$Comp
L Device:C_Small C10
U 1 1 5C395560
P 6500 2900
F 0 "C10" H 6550 2950 50  0000 L CNN
F 1 "100n" H 6550 2850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6500 2900 50  0001 C CNN
F 3 "~" H 6500 2900 50  0001 C CNN
	1    6500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2900 6750 2800
Wire Wire Line
	6750 2800 6500 2800
Wire Wire Line
	6500 2800 6300 2800
Connection ~ 6500 2800
$Comp
L Device:C_Small C8
U 1 1 5C3C5BB3
P 1500 1450
F 0 "C8" H 1300 1450 50  0000 L CNN
F 1 "100n" H 1300 1350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1500 1450 50  0001 C CNN
F 3 "~" H 1500 1450 50  0001 C CNN
	1    1500 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1350 1500 1300
Connection ~ 1500 1300
Wire Wire Line
	1500 1300 2050 1300
Wire Wire Line
	1500 1550 1500 1800
$Comp
L Device:C_Small C11
U 1 1 5C3F83D2
P 5200 6850
F 0 "C11" H 5250 6750 50  0000 L CNN
F 1 "1nF (25V)" H 5250 6650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5200 6850 50  0001 C CNN
F 3 "~" H 5200 6850 50  0001 C CNN
	1    5200 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6750 5200 6650
Wire Wire Line
	5200 6650 5000 6650
Connection ~ 5000 6650
Wire Wire Line
	5000 6650 5000 6200
Wire Wire Line
	5200 6950 5200 7050
Wire Wire Line
	5200 7050 5000 7050
Connection ~ 5000 7050
Wire Wire Line
	5000 7050 5000 7500
Text GLabel 10550 1850 2    50   Input ~ 0
DC_IN_-
Connection ~ 9250 1850
Wire Wire Line
	9250 1850 9250 2100
Text GLabel 10150 5100 0    50   Output ~ 0
Load
Text GLabel 10150 4750 0    50   Output ~ 0
DC_IN_-
Text GLabel 10150 4350 0    50   Output ~ 0
AC_IN_L
$Comp
L Device:Varistor RV1
U 1 1 5C4C753C
P 10050 1500
F 0 "RV1" H 10153 1546 50  0000 L CNN
F 1 "599V" H 10150 1450 50  0000 L CNN
F 2 "Varistor:RV_Disc_D7mm_W5.1mm_P5mm" V 9980 1500 50  0001 C CNN
F 3 "~" H 10050 1500 50  0001 C CNN
	1    10050 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:Varistor RV2
U 1 1 5C4DF1EA
P 10050 2250
F 0 "RV2" H 10153 2296 50  0000 L CNN
F 1 "599V" H 10153 2205 50  0000 L CNN
F 2 "Varistor:RV_Disc_D7mm_W5.1mm_P5mm" V 9980 2250 50  0001 C CNN
F 3 "~" H 10050 2250 50  0001 C CNN
	1    10050 2250
	1    0    0    -1  
$EndComp
NoConn ~ 2450 2800
NoConn ~ 2450 2200
NoConn ~ 3650 2400
NoConn ~ 3650 2600
NoConn ~ 3650 2800
Connection ~ 6500 3000
Wire Wire Line
	6500 3000 6300 3000
NoConn ~ 3650 2200
Wire Wire Line
	2450 2600 1900 2600
NoConn ~ 2450 2400
NoConn ~ 4300 3900
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5C22B65D
P 5350 6350
F 0 "#FLG01" H 5350 6425 50  0001 C CNN
F 1 "PWR_FLAG" H 5350 6524 33  0000 C CNN
F 2 "" H 5350 6350 50  0001 C CNN
F 3 "~" H 5350 6350 50  0001 C CNN
	1    5350 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6400 5150 6400
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5C237C97
P 5400 7400
F 0 "#FLG02" H 5400 7475 50  0001 C CNN
F 1 "PWR_FLAG" H 5400 7573 50  0000 C CNN
F 2 "" H 5400 7400 50  0001 C CNN
F 3 "~" H 5400 7400 50  0001 C CNN
	1    5400 7400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J4
U 1 1 5C271F8B
P 10800 4450
F 0 "J4" H 10879 4492 50  0000 L CNN
F 1 "POWER" H 10879 4401 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 10800 4450 50  0001 C CNN
F 3 "~" H 10800 4450 50  0001 C CNN
	1    10800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 4350 10250 4350
Wire Wire Line
	10350 4450 10600 4450
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 5C2B916E
P 10800 5000
F 0 "J5" H 10879 4992 50  0000 L CNN
F 1 "LOAD" H 10879 4901 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10800 5000 50  0001 C CNN
F 3 "~" H 10800 5000 50  0001 C CNN
	1    10800 5000
	1    0    0    -1  
$EndComp
Connection ~ 10350 4450
Text GLabel 10150 4650 0    50   Output ~ 0
DC_IN_+
Text GLabel 10150 4450 0    50   Output ~ 0
AC_IN_N
Wire Wire Line
	10500 4550 10600 4550
Wire Wire Line
	10350 5000 10600 5000
Wire Wire Line
	10600 5100 10150 5100
Text GLabel 10600 1200 2    50   Input ~ 0
AC_IN_L
Wire Wire Line
	10350 4450 10350 4250
Wire Wire Line
	900  6750 1050 6750
Wire Wire Line
	10150 4450 10350 4450
Wire Wire Line
	10250 4350 10250 4250
Wire Wire Line
	10250 4250 9550 4250
Wire Wire Line
	9550 4250 9550 4350
Connection ~ 10250 4350
Wire Wire Line
	10250 4350 10150 4350
Wire Wire Line
	10350 4550 9550 4550
Connection ~ 10350 4550
Wire Wire Line
	10350 4550 10350 4450
Wire Wire Line
	9550 4550 9550 4450
Wire Wire Line
	10350 4550 10350 4650
Wire Wire Line
	10500 4750 10250 4750
Wire Wire Line
	10500 4550 10500 4750
Wire Wire Line
	10350 4650 10150 4650
Connection ~ 10350 4650
Wire Wire Line
	10350 4650 10350 5000
Wire Wire Line
	10250 4750 10250 4850
Wire Wire Line
	9350 4850 10250 4850
Connection ~ 10250 4750
Wire Wire Line
	10250 4750 10150 4750
$Comp
L Connector:Screw_Terminal_01x04 J8
U 1 1 5C40C07A
P 9000 4550
F 0 "J8" H 9050 4800 50  0000 C CNN
F 1 "PS_IN" H 9000 4250 50  0000 C CNN
F 2 "CoolMosFootprintLib:MicroMatch-215464-4" H 9000 4550 50  0001 C CNN
F 3 "~" H 9000 4550 50  0001 C CNN
	1    9000 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	9350 4650 9350 4850
Text GLabel 9650 5050 2    50   Input ~ 0
12V
Text GLabel 9650 5350 2    50   Input ~ 0
GND
$Comp
L Connector:Screw_Terminal_01x04 J7
U 1 1 5C46DD35
P 9000 5250
F 0 "J7" H 9050 5500 50  0000 C CNN
F 1 "PS_OUT" H 9050 4950 50  0000 C CNN
F 2 "CoolMosFootprintLib:MicroMatch-7-215079-4_1" H 9000 5250 50  0001 C CNN
F 3 "~" H 9000 5250 50  0001 C CNN
	1    9000 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 5050 9350 5050
Wire Wire Line
	9350 5050 9350 5150
Wire Wire Line
	9350 5150 9200 5150
Connection ~ 9350 5050
Wire Wire Line
	9350 5050 9650 5050
Wire Wire Line
	9650 5350 9350 5350
Wire Wire Line
	9350 5350 9350 5250
Wire Wire Line
	9350 5250 9200 5250
Connection ~ 9350 5350
Wire Wire Line
	9350 5350 9200 5350
Wire Wire Line
	2050 1800 2450 1800
Wire Wire Line
	1950 2150 2050 2150
Wire Wire Line
	2050 2150 2050 1800
Connection ~ 2050 1800
$Comp
L CoolMOSG7:IRM-05-5 PS2
U 1 1 5C4D9258
P 2800 4850
F 0 "PS2" H 3350 4600 50  0000 C CNN
F 1 "IRM-05-12" H 3350 5024 50  0000 C CNN
F 2 "CoolMosFootprintLib:IRM-05-5" H 3750 4950 50  0001 L CNN
F 3 "http://www.mouser.com/ds/2/260/IRM-05-SPEC-806200.pdf" H 3750 4850 50  0001 L CNN
F 4 "AC/DC Power Modules 5V 1A 5W 85-264Vin Encap PS" H 3750 4750 50  0001 L CNN "Description"
F 5 "Mean Well" H 3750 4550 50  0001 L CNN "Manufacturer_Name"
F 6 "IRM-05-5" H 3750 4450 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "1358923" H 3750 4350 50  0001 L CNN "RS Part Number"
F 8 "http://uk.rs-online.com/web/p/products/1358923" H 3750 4250 50  0001 L CNN "RS Price/Stock"
F 9 "70387818" H 3750 4150 50  0001 L CNN "Allied_Number"
F 10 "https://www.alliedelec.com/mean-well-usa-irm-05-5/70387818/" H 3750 4050 50  0001 L CNN "Allied Price/Stock"
F 11 "709-IRM05-5" H 3750 3950 50  0001 L CNN "Mouser Part Number"
F 12 "https://www.mouser.com/Search/Refine.aspx?Keyword=709-IRM05-5" H 3750 3850 50  0001 L CNN "Mouser Price/Stock"
	1    2800 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x04 J10
U 1 1 5C5CC7ED
P 4550 4850
F 0 "J10" H 4550 4500 50  0000 C CNN
F 1 "PS_DC_OUT" H 4550 5100 50  0000 C CNN
F 2 "CoolMosFootprintLib:MicroMatch-7-215079-4_1" H 4550 4850 50  0001 C CNN
F 3 "~" H 4550 4850 50  0001 C CNN
	1    4550 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4950 4150 4950
Wire Wire Line
	4150 4950 4150 4850
Wire Wire Line
	4150 4750 4350 4750
Wire Wire Line
	4350 4850 4150 4850
Connection ~ 4150 4850
Wire Wire Line
	4150 4850 4150 4750
Wire Wire Line
	3900 4850 4000 4850
Wire Wire Line
	4000 4850 4000 5050
Wire Wire Line
	4000 5050 4350 5050
Wire Wire Line
	4350 4950 4350 5050
Connection ~ 4350 5050
Wire Wire Line
	5850 6750 5700 6750
Wire Wire Line
	5700 6750 5700 6850
Wire Wire Line
	5850 6850 5700 6850
Connection ~ 5700 6850
Wire Wire Line
	5700 6850 5700 7350
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C671DE1
P 8050 6650
F 0 "#FLG0102" H 8050 6725 50  0001 C CNN
F 1 "PWR_FLAG" H 8250 6750 33  0000 C CNN
F 2 "" H 8050 6650 50  0001 C CNN
F 3 "~" H 8050 6650 50  0001 C CNN
	1    8050 6650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5C684904
P 8050 6750
F 0 "#FLG0103" H 8050 6825 50  0001 C CNN
F 1 "PWR_FLAG" H 7850 6850 33  0000 C CNN
F 2 "" H 8050 6750 50  0001 C CNN
F 3 "~" H 8050 6750 50  0001 C CNN
	1    8050 6750
	-1   0    0    1   
$EndComp
Connection ~ 8050 6750
Wire Wire Line
	8050 6750 7900 6750
Connection ~ 8050 6650
Wire Wire Line
	8050 6650 8200 6650
Wire Wire Line
	2550 5100 1750 5100
Wire Wire Line
	1750 5100 1750 5000
Wire Wire Line
	8950 1600 8950 2000
Wire Wire Line
	8650 1500 8650 2000
Wire Wire Line
	8950 2000 8650 2000
Connection ~ 8950 2000
Connection ~ 8650 2000
Wire Wire Line
	8950 2000 8950 2200
Wire Wire Line
	8650 2000 8650 2250
Wire Wire Line
	8650 2250 8350 2250
Wire Wire Line
	8000 2250 8000 2300
Wire Wire Line
	8000 2250 8000 2000
Connection ~ 8000 2250
Wire Wire Line
	7850 1350 8000 1350
Wire Wire Line
	7850 1250 7850 1350
Wire Wire Line
	8000 1500 7850 1500
Wire Wire Line
	7850 1500 7850 1350
Connection ~ 8000 1500
Connection ~ 7850 1350
Wire Wire Line
	8200 1350 8350 1350
Wire Wire Line
	8350 1350 8350 2250
Connection ~ 8350 2250
Wire Wire Line
	8350 2250 8000 2250
Wire Wire Line
	6750 3300 6300 3300
Wire Wire Line
	6300 3400 6750 3400
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C316D2A
P 10350 4250
F 0 "#FLG0101" H 10350 4325 50  0001 C CNN
F 1 "PWR_FLAG" V 10350 4378 33  0000 L CNN
F 2 "" H 10350 4250 50  0001 C CNN
F 3 "~" H 10350 4250 50  0001 C CNN
	1    10350 4250
	0    1    1    0   
$EndComp
Text Notes 1000 4350 0    128  ~ 26
87-300V AC/DC to 12V DC Power Supply
Wire Wire Line
	2550 4950 2550 5100
$Comp
L CoolMOSG7:X22205CAAK S1
U 1 1 5C56FED9
P 1750 4750
F 0 "S1" H 1900 4450 50  0000 C CNN
F 1 "X22205CAAK" H 2150 4900 50  0000 C CNN
F 2 "CoolMosFootprintLib:X22205CAAK" H 2400 4850 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/2/X22205CAAK.pdf" H 2400 4750 50  0001 L CNN
F 4 "PCB Slide Switch DP-CO 16 A @ 250 V ac Slide" H 2400 4650 50  0001 L CNN "Description"
F 5 "13" H 2400 4550 50  0001 L CNN "Height"
F 6 "Arcolectric" H 2400 4450 50  0001 L CNN "Manufacturer_Name"
F 7 "X22205CAAK" H 2400 4350 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "2789777" H 2400 4250 50  0001 L CNN "RS Part Number"
F 9 "http://uk.rs-online.com/web/p/products/2789777" H 2400 4150 50  0001 L CNN "RS Price/Stock"
F 10 "2789777" H 2400 4050 50  0001 L CNN "Mouser Part Number"
F 11 "http://uk.rs-online.com/web/p/products/2789777" H 2400 3950 50  0001 L CNN "Mouser Price/Stock"
	1    1750 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x04 J9
U 1 1 5C52A86A
P 1300 4900
F 0 "J9" H 1300 5150 50  0000 C CNN
F 1 "PS_DC_IN" H 1250 4550 50  0000 C CNN
F 2 "CoolMosFootprintLib:MicroMatch-7-215079-4_1" H 1300 4900 50  0001 C CNN
F 3 "~" H 1300 4900 50  0001 C CNN
	1    1300 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	1500 4800 1600 4800
Wire Wire Line
	1600 4800 1600 4900
Wire Wire Line
	1600 4900 1500 4900
Wire Wire Line
	1600 4900 1600 5200
Wire Wire Line
	1600 5200 2800 5200
Connection ~ 1600 4900
Wire Wire Line
	1500 4700 1750 4700
Connection ~ 1750 4700
Wire Wire Line
	1750 4700 1750 4750
Wire Wire Line
	1750 5000 1500 5000
Connection ~ 1750 5000
Wire Wire Line
	1750 5000 1750 4950
Wire Wire Line
	1750 4850 1700 4850
Wire Wire Line
	1700 5150 2650 5150
Wire Wire Line
	2650 5150 2650 4850
Wire Wire Line
	1700 4850 1700 5150
Wire Wire Line
	2650 4850 2550 4850
Wire Wire Line
	2800 4950 2800 5200
Wire Wire Line
	2800 4850 2650 4850
Connection ~ 2650 4850
Wire Wire Line
	1750 4550 2550 4550
Wire Wire Line
	2550 4550 2550 4750
Wire Wire Line
	1750 4550 1750 4700
Text Notes 6050 4250 0    128  ~ 26
Logic Connectors
Text Notes 1200 1050 0    128  ~ 26
3.3V Wireless Logic (ESP-12-E)
Connection ~ 5200 6950
Wire Wire Line
	5200 6950 5150 6950
Wire Wire Line
	5150 6550 5450 6550
Wire Wire Line
	5450 6550 5450 6950
Wire Wire Line
	5150 6400 5150 6550
Wire Wire Line
	5850 6950 5450 6950
Wire Wire Line
	5850 6950 5850 7050
Connection ~ 5850 6950
$Comp
L Connector:Screw_Terminal_01x04 J11
U 1 1 5C625D9B
P 6050 6850
F 0 "J11" H 6000 7100 50  0000 C CNN
F 1 "PS_AC_OUT" H 5950 7200 50  0000 C CNN
F 2 "CoolMosFootprintLib:MicroMatch-7-215079-4_1" H 6050 6850 50  0001 C CNN
F 3 "~" H 6050 6850 50  0001 C CNN
	1    6050 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 6400 5350 6400
Wire Wire Line
	5350 6400 5350 6350
Connection ~ 5150 6400
Wire Wire Line
	5400 7400 5400 7350
Connection ~ 5400 7350
Wire Wire Line
	5400 7350 5700 7350
Wire Wire Line
	4100 7350 5400 7350
$Comp
L Connector:Screw_Terminal_01x04 J6
U 1 1 5C4DA78F
P 700 6750
F 0 "J6" H 700 7000 50  0000 C CNN
F 1 "PS_DC_IN" H 700 6400 50  0000 C CNN
F 2 "CoolMosFootprintLib:MicroMatch-7-215079-4_1" H 700 6750 50  0001 C CNN
F 3 "~" H 700 6750 50  0001 C CNN
	1    700  6750
	-1   0    0    1   
$EndComp
Wire Wire Line
	900  6650 1050 6650
Wire Wire Line
	1050 6650 1050 6750
Connection ~ 1050 6750
Wire Wire Line
	1050 6750 1850 6750
Wire Wire Line
	900  6850 1050 6850
Wire Wire Line
	1050 6850 1050 7350
Wire Wire Line
	1050 7350 3450 7350
Text Notes 6550 950  0    128  ~ 26
High Voltage & Power AC/DC Switch
Text Notes 9000 4100 0    128  ~ 26
Power Connectors
Wire Wire Line
	2250 3050 2250 3300
Wire Wire Line
	9350 4650 9200 4650
Wire Wire Line
	1900 3300 2250 3300
Connection ~ 2250 3300
Wire Wire Line
	2250 3300 2700 3300
Wire Wire Line
	9200 4550 9550 4550
Connection ~ 9550 4550
Wire Wire Line
	9550 4450 9200 4450
Wire Wire Line
	9200 4350 9550 4350
Wire Wire Line
	10050 3050 10050 2850
Wire Wire Line
	7850 3050 10050 3050
Connection ~ 10050 2850
Wire Wire Line
	10050 1350 10050 1200
Wire Wire Line
	10050 1650 10050 1850
Wire Wire Line
	9250 1850 10050 1850
Connection ~ 10050 1850
Wire Wire Line
	10050 2100 10050 1850
Wire Wire Line
	10050 2400 10050 2850
Wire Wire Line
	7850 3250 10250 3250
Wire Wire Line
	10250 2850 10250 3250
Wire Wire Line
	10250 2850 10550 2850
Wire Wire Line
	10600 1200 10050 1200
Connection ~ 10050 1200
Wire Wire Line
	10050 1850 10550 1850
Wire Wire Line
	9750 6750 10150 6750
Connection ~ 9750 6750
$EndSCHEMATC
