# Project Name: Cansat-Competition-2014-GUI
# Description

Mission Objective:

"The mission simulates a sensor payload traveling through a planetary atmosphere sampling the atmospheric composition during its descent."

Develop a can-sized satellite that is made of two parts. The two parts are called the container and payload. All electronics need to be powered by solar panels. A team consisting of eight members with different background in engineering are tasked to develop the cansat. The cansat is made of kevlar and fiber glass. The mechanical team that made the cansat possible consisted of Majilinda Mallellari, Patrick Sebastien Guillaume, Graham Hill, Surya Sanjiv, and Fady Mekhael. The electronics, solar panels and PCB was developed by Courtland Hui.   

My role:

As the leader of ground station, I was task to read telemetry string from an Arduino microcontroller in the cansat called Arduino Pro Mini 5v. The microcontroller is located in the payload. I was also in charge of communications. I used xBee radio modules Pro 3B 900 MHz series and two omnidirectional antennas. The antenna stand was made by Fady Mekhael, it height is approximately 3.5 meters.

Telemetry String that the Arduino sends:
(Team ID) 1957, Packet count, mission time (seconds), Altitude, Temperature (C), Voltage, Pressure, x acceleration data, y acceleration data, z acceleration data. It is important to have the team id (1957) as the header of the packet because the software will recognize the data from the cansat and not from another team's cansat. The firmware from the xBees also prevents that from happening as well. The software used to program the radio module is called X-CTU

# Installation
This software is intended for windows OS.
Two ways to run this GUI:
Note: Make sure all files are in the same directory; except the exe file could be run anywhere.
1.)  Click on the executable file, however make sure to install the MATLAB compiler 2013b 8.2 version
2.)  Open the .m file in MATLAB and click run. 


# Usage
1.) Select serial comport.
2.) Click start. 
3.) Make sure you close the serial port by clicking the stop button; if you exit the application without pressing this button, you won't be able to access the serial port again, unless you restart your computer.


# Credits
Team Members:

Mechanical Engineers:

Majilinda Mallellari, 
Patrick Sebastien Guillaume, 
Graham Hill,
Surya Sanjiv, and
Fady Mekhael

Electrical Engineers:

Courtland Hui, and Joel Annenberg (Biomedical Engineer)

Computer Engineer:

Demetrios Doumas




























