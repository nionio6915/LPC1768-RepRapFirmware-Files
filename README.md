# LPC1768-RepRapFirmware-Files
ReARM config files for using sdavi's port of RepRapFirmware
https://github.com/sdavi/RepRapFirmware

This is an experimental port of dc42's RepRapFirmware) for LPC1768/LPC1769 based boards.

Note: This firmware does not show up as a mass storage device when connected to a computer. Physical access to the internal sdcard may be required in order to revert back or update.

reprap.org forum discussion here- 
https://reprap.org/forum/read.php?147,810214


I am putting my notes here as I go, hopefully to aid someone else and maybe use as a basis for formal documentation later. 

0. READ THIS BEFORE YOU BEGIN! 
  https://duet3d.dozuki.com/Wiki/Firmware_Overview
  
  Pay attention to the bits at the end " Firmware differences from Marlin, Repetier etc" and "Known firmware issues and limitations"
  
  The quick start guide has lots of helpful info too- https://duet3d.dozuki.com/#Section_Quick_Links

1. Get the port. 
  Installing the port is just like loading up Marlin 2.0 or Smoothie. Copy the bin file to the SD card. 
  https://github.com/sdavi/RepRapFirmware/tree/v2-dev-lpc/EdgeRelease
  
  Then grab the closest config file for your board-
  https://github.com/sdavi/RepRapFirmware/tree/v2-dev-lpc/EdgeRelease/ExampleBoardConfig
  
2. Make the folder structrure ont he SD card to organize your configs. Luckily this is well documented here -
  https://duet3d.dozuki.com/Wiki/Firmware_Overview#Section_SD_card_structure
  
3. Edit the example board file and save it to sys/board.txt. I have included mine for REARM here on git for context. 

4. You will need to build your config files depending on your printer type- https://duet3d.dozuki.com/#Section_Firmware_configuration 

5. Use the online configurator - https://configurator.reprapfirmware.org/Start
  Once you get through the config wizard, it will build you a package of 'sys' files to download. Dowload them and put them in the 'sys' folder on the SD card.  


https://duet3d.dozuki.com/Wiki/Duet_2_Maestro_12864_display_menu_system

https://duet3d.dozuki.com/Wiki/Gcode#Section_M918_Configure_direct_connect_display
