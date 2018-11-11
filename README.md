# Cansat-Competition-GUI-2014

Two ways to run this GUI:
Note: Make sure all files are in the same directory; except the exe file could be run anywhere.
1.)  Click on the executable file, however make sure to install the MATLAB compiler 2013b 8.2 version
2.)  Open the .m file in MATLAB and click run.

Purpose:
Reads telemetry string from an Arduino microcontroller in the cansat called Arduino Pro Mini 5v. 
The communication is wireless. Used the xBee radio module Pro 3B series However, you could plug in the microcontroller directly to your PC. 
Parse, plot, and save the data in real time.
This software is intended for windows OS.

Telemetry String that the arduino sends:
1957, Packet count, mission time (seconds), Altitude, Temperature, Voltage, Pressure, x acceleration data, y acceleration data, z acceleration data


Instructions:
1.) Select serial comport.
2.) Click start. 
3.) Make sure you close the serial port by clicking the stop button; if you exit the application without pressing this button,
you won't be able to access the serial port again, unless you restart your computer.


