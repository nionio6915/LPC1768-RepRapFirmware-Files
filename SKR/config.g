; config.g file for ReArm + RAMPS after using the http://configurator.reprapfirmware.org 
; to initially generate the framework. You may need to comment out a few lines
;
; executed by the firmware on start-up
;

; General preferences
G21
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

; Network
M552 S0                                  ; Disable network

; Drives
 M569 P0 S0 R0 T0.1:0.1:0.02:0.02          ; SD2224 Driver X Drive 0 goes reverese
; M569 P0 S1 T1.9:1.0:0.65:0.65          ; DRV8825 Driver X Drive 1 goes forwards

M569 P1 S0 R0 T0.1:0.1:0.02:0.02           ; SD2224 Driver Y Drive 0 goes reverse 
; M569 P1 S1 T1.9:1.0:0.65:0.65          ; DRV8825 Driver Y Drive 1 goes forwards

M569 P2 S1 R0  T1.9:1.0:0.65:0.65           ; Drive 2 goes forwards

M569 P3 S0  R0 T1.9:1.0:0.65:0.65           ; Drive 3 goes forwards

M92 X80 Y80 Z400 E825                    ; Set steps per mm for Bondtech 


M566 X600.00 Y600.00 Z12.00 E240.00      ; Set maximum instantaneous speed changes (mm/min)

M203 X15000.0 Y15000.0 Z1500.0 E1500.0   ; Set maximum speeds (mm/min)

M201 X1100.00 Y1100.00 Z180.00 E480.00   ; Set accelerations (mm/s^2)



;M84 S30                                  ; Set idle timeout

; Network
;M552 S1                                  ; Enable network

; Axis Limits
M208 X0 Y0 Z0 S1                         ; Set axis minima
M208 X220 Y220 Z230 S0                   ; Set axis maxima

; Endstops

M574 X1 Y1  S1                            ; X & Y endstops are at the min travel

; Z-Probe
M574 Z1 S2 C2                             ; Set endstops controlled by probe
M558 R0.1 P9 H10 F240 T6000 C2                 ; reduce travel and speed

G31 P25 X46 Y0 Z1.6                       ; Set Z probe trigger value, offset and trigger height
M557 X15:200 Y15:200 S30                  ; Define mesh grid

; Heaters
;M305 P0 T100000 B4100 R4700              ; Set thermistor + ADC parameters for heater 0
;M304 H0 P97.7 I4.537 D166.2              ; djp add results from PID tuning

M307 H0 B0
M305 P0 T100000 B4388 R4700 H30 L0
M143 H0 S120                             ; Set temperature limit for heater 0 to 120C

M305 P1 T100000 B4725 C7.060000e-8 R4700 ; Set thermistor + ADC parameters for heater 1


M307 H1 A512.9 C267.0 D9.0 B0
M143 H1 S280                             ; Set temperature limit for heater 1 to 280C


; Fans
M106 P0 H-1                              ; Set fan 0 value, PWM signal inversion and frequency. 
                                         ; Part Cooling Fan

M106 P1  S255  H1 T50 B1                 ; Set fan 1 value, PWM signal inversion and frequency. 
                                         ; Thermostatic control is turned on
                                         ; Hot End Fan
; Tools
M563 P0 D0 H1 F0                         ; Define tool 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S0                             ; Set initial tool 0 active and standby temperatures to 0C

; Automatic saving after power loss is not enabled

; Custom settings are not configured
M918 P1 E4 F1000000                      ; enable the LCD 
; https://duet3d.dozuki.com/Wiki/Gcode#Section_M918_Configure_direct_connect_display

; set input-output to Marlin for compatibilty
M555 P2
M575 P1 B115200 S0.                       ; enable tft28  touchscreen



T0     ;select tool 0