; config.g file for ReArm + RAMPS after using the http://configurator.reprapfirmware.org 
; to initially generate the framework. You may need to comment out a few lines
;
; executed by the firmware on start-up
;

; General preferences
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

; Network
M552 S0                                  ; Disable network

; Drives
 M569 P0 S0  T0.1:0.1:0.02:0.02          ; SD2224 Driver X Drive 0 goes reverese
; M569 P0 S1 T1.9:1.0:0.65:0.65          ; DRV8825 Driver X Drive 1 goes forwards

M569 P1 S0  T0.1:0.1:0.02:0.02           ; SD2224 Driver Y Drive 0 goes reverse 
; M569 P1 S1 T1.9:1.0:0.65:0.65          ; DRV8825 Driver Y Drive 1 goes forwards

M569 P2 S1  T1.9:1.0:0.65:0.65           ; Drive 2 goes forwards

M569 P3 S1  T1.9:1.0:0.65:0.65           ; Drive 3 goes forwards

; M92 X160.00 Y160.00 Z1600.00 E476.5    ; Set steps per mm for Bondtech QR
M92 X160.00 Y160.00 Z1600.00 E195.54     ; Set steps per mm for Saint Flint Extruder

M566 X600.00 Y600.00 Z12.00 E240.00      ; Set maximum instantaneous speed changes (mm/min)

M203 X15000.0 Y15000.0 Z1500.0 E1500.0     ; Set maximum speeds (mm/min)

M201 X1100.00 Y1100.00 Z180.00 E480.00   ; Set accelerations (mm/s^2)

; M566 X600.00 Y600.00 Z12.00 E240.00      ; Set maximum instantaneous speed changes (mm/min)
; M203 X115000.0 Y15000.0 Z1500.0 E1500.0  ; Set maximum speeds (mm/min)
; M201 X1150.00 Y1150.00 Z200.00 E600.00   ; Set accelerations (mm/s^2)

M84 S30                                  ; Set idle timeout

; Network
M552 S1                                  ; Enable network

; Axis Limits
M208 X0 Y0 Z0 S1                         ; Set axis minima
M208 X295 Y295 Z290 S0                   ; Set axis maxima

; Endstops
M574 X2 Y2 S0                            ; Set active low Endstops
; X & Y endstops are at the MAX travel

; Z-Probe
M574 Z1 S2                               ; Set endstops controlled by probe
M558 P8 I1 R0.4 H2 F600 T6000            ; Suggestions from Idris at PP, change to more senstive setting, reduce travel and speed
; M558 P5 I1 R0.4 H5 F600 T6000          ; Set Z probe type to effector and the dive height + speeds
G31 P500 X0 Y0 Z0.0                      ; Set Z probe trigger value, offset and trigger height
M557 X5:285 Y5:285 S70                   ; Define mesh grid

; ESTOP SWITCHES                         ; Work in Progress 
; M581 T0 E0 S0 C0                       ; emergency stop on trigger, E0 switch, falling edge, apply at all times
; M581 T0 E1 S0 C0 

; Heaters
M305 P0 T100000 B4100 R4700              ; Set thermistor + ADC parameters for heater 0
M304 H0 P97.7 I4.537 D166.2              ; djp add results from PID tuning
M143 H0 S120                             ; Set temperature limit for heater 0 to 120C

M305 P1 T100000 B4725 C7.060000e-8 R4700 ; Set thermistor + ADC parameters for heater 1
M304 H1 P24.1 I1.059 D52.3               ; djp add results from PID tuning
M143 H1 S280                             ; Set temperature limit for heater 1 to 280C


; Fans
M106 P0 H-1                              ; Set fan 0 value, PWM signal inversion and frequency. 
                                         ; Part Cooling Fan

M106 P1 S1 I0 F500 H1 T45                ; Set fan 1 value, PWM signal inversion and frequency. 
                                         ; Thermostatic control is turned on
                                         ; Hot End Fan

; Tools
M563 P0 D0 H1                            ; Define tool 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S0                             ; Set initial tool 0 active and standby temperatures to 0C

; Automatic saving after power loss is not enabled

; Custom settings are not configured
; M918 P1 E4 F1000000                      ; enable the LCD 
; https://duet3d.dozuki.com/Wiki/Gcode#Section_M918_Configure_direct_connect_display

; set input-output to Marlin for compatibilty
; M555 P2
