; ### Marlin K-Factor Calibration Pattern ###
; -------------------------------------------
;
; Printer: DE200
; Filament: Chromatik
; Created: Tue Mar 05 2024 00:20:43 GMT+0000 (Western European Standard Time)
;
; Settings Printer:
; Filament Diameter = 1.75 mm
; Nozzle Diameter = 0.4 mm
; Nozzle Temperature = 215 °C
; Bed Temperature = 0 °C
; Retraction Distance = 3.5 mm
; Layer Height = 0.3 mm
; Extruder = 0
; Fan Speed = 0 %
; Z-axis Offset = 0 mm
;
; Settings Print Bed:
; Bed Shape = Rect
; Bed Size X = 204 mm
; Bed Size Y = 204 mm
; Origin Bed Center = false
;
; Settings Speed:
; Slow Printing Speed = 1200 mm/min
; Fast Printing Speed = 2400 mm/min
; Movement Speed = 7200 mm/min
; Retract Speed = 2160 mm/min
; Unretract Speed = 2160 mm/min
; Printing Acceleration = 1000 mm/s^2
; Jerk X-axis =  firmware default
; Jerk Y-axis =  firmware default
; Jerk Z-axis =  firmware default
; Jerk Extruder =  firmware default
;
; Settings Pattern:
; Linear Advance Version = 1.5
; Starting Value Factor = 0
; Ending Value Factor = 0.5
; Factor Stepping = 0.05
; Test Line Spacing = 10 mm
; Test Line Length Slow = 20 mm
; Test Line Length Fast = 40 mm
; Print Pattern = Standard
; Print Frame = false
; Number Lines = true
; Print Size X = 98 mm
; Print Size Y = 125 mm
; Print Rotation = 0 degree
;
; Settings Advance:
; Nozzle / Line Ratio = 1.25
; Bed leveling = G29 ; Level bed
; Use FWRETRACT = false
; Extrusion Multiplier = 1
; Prime Nozzle = true
; Prime Extrusion Multiplier = 2.5
; Prime Speed = 1800
; Dwell Time = 2 s
;
; prepare printing
;
G21 ; Millimeter units
G90 ; Absolute XYZ
M83 ; Relative E
G28 ; Home all axes

T0 ; Switch to tool 0
G1 Z10 F100 ; Z raise
M104 S215 ; Set nozzle temperature (no wait)
G29 ; Level bed; Activate bed leveling compensation
M109 S215 ; Wait for nozzle temp
M204 P1000 ; Acceleration




G92 E0 ; Reset extruder distance
M106 P0 S0

G1 X102 Y102 F7200 ; move to start

G1 Z0.3 F1200 ; Move to layer height
;
; prime nozzle
;
G1 X53 Y39.5 F7200 ; move to start
G1 X53 Y164.5 E19.4884 F1800 ; print line
G1 X53.75 Y164.5 F7200 ; move to start
G1 X53.75 Y39.5 E19.4884 F1800 ; print line
G1 E-3.5 F2160 ; retract
;
; start the Test pattern
;
G4 P2000 ; Pause (dwell) for 2 seconds
G1 X63 Y39.5 F7200 ; move to start
M900 K0 ; set K-factor
M117 K0 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y39.5 E1.2473 F1200 ; print line
G1 X123 Y39.5 E2.4945 F2400 ; print line
G1 X143 Y39.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y49.5 F7200 ; move to start
M900 K0.05 ; set K-factor
M117 K0.05 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y49.5 E1.2473 F1200 ; print line
G1 X123 Y49.5 E2.4945 F2400 ; print line
G1 X143 Y49.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y59.5 F7200 ; move to start
M900 K0.1 ; set K-factor
M117 K0.1 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y59.5 E1.2473 F1200 ; print line
G1 X123 Y59.5 E2.4945 F2400 ; print line
G1 X143 Y59.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y69.5 F7200 ; move to start
M900 K0.15 ; set K-factor
M117 K0.15 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y69.5 E1.2473 F1200 ; print line
G1 X123 Y69.5 E2.4945 F2400 ; print line
G1 X143 Y69.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y79.5 F7200 ; move to start
M900 K0.2 ; set K-factor
M117 K0.2 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y79.5 E1.2473 F1200 ; print line
G1 X123 Y79.5 E2.4945 F2400 ; print line
G1 X143 Y79.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y89.5 F7200 ; move to start
M900 K0.25 ; set K-factor
M117 K0.25 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y89.5 E1.2473 F1200 ; print line
G1 X123 Y89.5 E2.4945 F2400 ; print line
G1 X143 Y89.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y99.5 F7200 ; move to start
M900 K0.3 ; set K-factor
M117 K0.3 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y99.5 E1.2473 F1200 ; print line
G1 X123 Y99.5 E2.4945 F2400 ; print line
G1 X143 Y99.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y109.5 F7200 ; move to start
M900 K0.35 ; set K-factor
M117 K0.35 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y109.5 E1.2473 F1200 ; print line
G1 X123 Y109.5 E2.4945 F2400 ; print line
G1 X143 Y109.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y119.5 F7200 ; move to start
M900 K0.4 ; set K-factor
M117 K0.4 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y119.5 E1.2473 F1200 ; print line
G1 X123 Y119.5 E2.4945 F2400 ; print line
G1 X143 Y119.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y129.5 F7200 ; move to start
M900 K0.45 ; set K-factor
M117 K0.45 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y129.5 E1.2473 F1200 ; print line
G1 X123 Y129.5 E2.4945 F2400 ; print line
G1 X143 Y129.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y139.5 F7200 ; move to start
M900 K0.5 ; set K-factor
M117 K0.5 ;
G1 E3.5 F2160 ; un-retract
G1 X83 Y139.5 E1.2473 F1200 ; print line
G1 X123 Y139.5 E2.4945 F2400 ; print line
G1 X143 Y139.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X63 Y149.5 F7200 ; move to start
;
; Mark the test area for reference
M117 K0
M900 K0 ; Set K-factor 0
G1 X83 Y144.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X83 Y164.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 X123 Y144.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X123 Y164.5 E1.2473 F1200 ; print line
G1 E-3.5 F2160 ; retract
G1 Z0.4 F1200 ; zHop
;
; print K-values
;
G1 X145 Y37.5 F7200 ; move to start
G1 Z0.3 F1200 ; zHop
G1 E3.5 F2160 ; un-retract
G1 X147 Y37.5 E0.1247 F1200 ; 0
G1 X147 Y39.5 E0.1247 F1200 ; 0
G1 X147 Y41.5 E0.1247 F1200 ; 0
G1 X145 Y41.5 E0.1247 F1200 ; 0
G1 X145 Y39.5 E0.1247 F1200 ; 0
G1 X145 Y37.5 E0.1247 F1200 ; 0
G1 E-3.5 F2160 ; retract
G1 Z0.4 F1200 ; zHop
G1 X145 Y57.5 F7200 ; move to start
G1 Z0.3 F1200 ; zHop
G1 E3.5 F2160 ; un-retract
G1 X147 Y57.5 E0.1247 F1200 ; 0
G1 X147 Y59.5 E0.1247 F1200 ; 0
G1 X147 Y61.5 E0.1247 F1200 ; 0
G1 X145 Y61.5 E0.1247 F1200 ; 0
G1 X145 Y59.5 E0.1247 F1200 ; 0
G1 X145 Y57.5 E0.1247 F1200 ; 0
G1 E-3.5 F2160 ; retract
G1 X148 Y57.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X148 Y57.9 E0.0249 F1200 ; dot
G1 E-3.5 F2160 ; retract
G1 X149 Y57.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X149 Y59.5 E0.1247 F1200 ; 1
G1 X149 Y61.5 E0.1247 F1200 ; 1
G1 E-3.5 F2160 ; retract
G1 Z0.4 F1200 ; zHop
G1 X145 Y77.5 F7200 ; move to start
G1 Z0.3 F1200 ; zHop
G1 E3.5 F2160 ; un-retract
G1 X147 Y77.5 E0.1247 F1200 ; 0
G1 X147 Y79.5 E0.1247 F1200 ; 0
G1 X147 Y81.5 E0.1247 F1200 ; 0
G1 X145 Y81.5 E0.1247 F1200 ; 0
G1 X145 Y79.5 E0.1247 F1200 ; 0
G1 X145 Y77.5 E0.1247 F1200 ; 0
G1 E-3.5 F2160 ; retract
G1 X148 Y77.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X148 Y77.9 E0.0249 F1200 ; dot
G1 E-3.5 F2160 ; retract
G1 X149 Y77.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X149 Y79.5 F7200 ; move to start
G1 X149 Y81.5 F7200 ; move to start
G1 X151 Y81.5 E0.1247 F1200 ; 2
G1 X151 Y79.5 E0.1247 F1200 ; 2
G1 X149 Y79.5 E0.1247 F1200 ; 2
G1 X149 Y77.5 E0.1247 F1200 ; 2
G1 X151 Y77.5 E0.1247 F1200 ; 2
G1 E-3.5 F2160 ; retract
G1 Z0.4 F1200 ; zHop
G1 X145 Y97.5 F7200 ; move to start
G1 Z0.3 F1200 ; zHop
G1 E3.5 F2160 ; un-retract
G1 X147 Y97.5 E0.1247 F1200 ; 0
G1 X147 Y99.5 E0.1247 F1200 ; 0
G1 X147 Y101.5 E0.1247 F1200 ; 0
G1 X145 Y101.5 E0.1247 F1200 ; 0
G1 X145 Y99.5 E0.1247 F1200 ; 0
G1 X145 Y97.5 E0.1247 F1200 ; 0
G1 E-3.5 F2160 ; retract
G1 X148 Y97.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X148 Y97.9 E0.0249 F1200 ; dot
G1 E-3.5 F2160 ; retract
G1 X149 Y97.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X149 Y99.5 F7200 ; move to start
G1 X149 Y101.5 F7200 ; move to start
G1 X151 Y101.5 E0.1247 F1200 ; 3
G1 X151 Y99.5 E0.1247 F1200 ; 3
G1 X151 Y97.5 E0.1247 F1200 ; 3
G1 X149 Y97.5 E0.1247 F1200 ; 3
G1 X149 Y99.5 F7200 ; move to start
G1 X151 Y99.5 E0.1247 F1200 ; 3
G1 E-3.5 F2160 ; retract
G1 Z0.4 F1200 ; zHop
G1 X145 Y117.5 F7200 ; move to start
G1 Z0.3 F1200 ; zHop
G1 E3.5 F2160 ; un-retract
G1 X147 Y117.5 E0.1247 F1200 ; 0
G1 X147 Y119.5 E0.1247 F1200 ; 0
G1 X147 Y121.5 E0.1247 F1200 ; 0
G1 X145 Y121.5 E0.1247 F1200 ; 0
G1 X145 Y119.5 E0.1247 F1200 ; 0
G1 X145 Y117.5 E0.1247 F1200 ; 0
G1 E-3.5 F2160 ; retract
G1 X148 Y117.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X148 Y117.9 E0.0249 F1200 ; dot
G1 E-3.5 F2160 ; retract
G1 X149 Y117.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X149 Y119.5 F7200 ; move to start
G1 X149 Y121.5 F7200 ; move to start
G1 X149 Y119.5 E0.1247 F1200 ; 4
G1 X151 Y119.5 E0.1247 F1200 ; 4
G1 X151 Y121.5 F7200 ; move to start
G1 X151 Y119.5 E0.1247 F1200 ; 4
G1 X151 Y117.5 E0.1247 F1200 ; 4
G1 E-3.5 F2160 ; retract
G1 Z0.4 F1200 ; zHop
G1 X145 Y137.5 F7200 ; move to start
G1 Z0.3 F1200 ; zHop
G1 E3.5 F2160 ; un-retract
G1 X147 Y137.5 E0.1247 F1200 ; 0
G1 X147 Y139.5 E0.1247 F1200 ; 0
G1 X147 Y141.5 E0.1247 F1200 ; 0
G1 X145 Y141.5 E0.1247 F1200 ; 0
G1 X145 Y139.5 E0.1247 F1200 ; 0
G1 X145 Y137.5 E0.1247 F1200 ; 0
G1 E-3.5 F2160 ; retract
G1 X148 Y137.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X148 Y137.9 E0.0249 F1200 ; dot
G1 E-3.5 F2160 ; retract
G1 X149 Y137.5 F7200 ; move to start
G1 E3.5 F2160 ; un-retract
G1 X151 Y137.5 E0.1247 F1200 ; 5
G1 X151 Y139.5 E0.1247 F1200 ; 5
G1 X149 Y139.5 E0.1247 F1200 ; 5
G1 X149 Y141.5 E0.1247 F1200 ; 5
G1 X151 Y141.5 E0.1247 F1200 ; 5
G1 E-3.5 F2160 ; retract
G1 Z0.4 F1200 ; zHop
;
; FINISH
;
M107 ; Turn off fan
M400 ; Finish moving
M104 S0 ; Turn off hotend
G1 Z30 X204 Y204 F7200 ; Move away from the print
M84 ; Disable motors
M501 ; Load settings from EEPROM
;