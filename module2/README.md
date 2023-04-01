# Module 2 - Interactive Art 

## Project Description
The goal of this project is to create an interactive device that would send data back to my laptop for visualization, sonfication, or any other media generation process. 

### Artistic Vision 

For my specifc project, I am creating an interactive device that allows users to create their own digital collage. Through using a joystick, the user will go through a series of randomly ordered images to build their collage on a background. I was inspired by my childhood passion for making collages and vision boards, which often took days to finish and would always get very messy. With this digital collage builder, one no longer need to indesisively gather images, painfully cut through them, and be left with sticky fingers upon finishing gluing it all together. 

## Technical Documentation

### Materials and Softwares required:
- One ESP32 TTGO T-display
- Joystick 
- Breadboard
- Button (optional)
- USB-C cord
- wires
- Arduino
- Processing

### Files required: 
```
/module2/joystick.ino        
```
Setting up Serial communication with ESP32 pins
- Opens the serial port at a set baud rate for serial data transmission. 
- Reads X,Y,Z data from the Joystick to Serial Monitor.
- Prints data to the serial port as human-readable ASCII text.

```
/module2/CollageBuilder/CollageBuilder.pde
```
Using the data and turning it into a collage
- Setup: create canvas, load images and background, and open Serial port for receiving data.
- While data is available, read data and convert it into a image's location coordinates as it hovers.
- Set location of an image when Z value changes.
- Iterate through all images to form a collage.


### Setting up the interactive device:  


1. Set up ESP32 and Joystick on a breadboard 
2. Connect ESP32 and Joystick's matching pins using wires according to the schematic below. 
    - Test on Arduino's serial monitor to see if the values changing accurately as you toggle the joystick. 
    - If not, it might be an issue with the pins or breadboard. You have to move around and switch pins to find ones that work. 

<div style="display: inline-block;">
        <img src="../images/module2_Schematic.png" alt="Schematic" height="400">
</div>


### Running the program:  
2. Open module2/joystick.ino in Arduino and run it on ESP32. Make sure the baud rate is set to match the one specified in the code.
3. Open module2/CollageBuilder/CollageBuilder.pde in Processing to start the program. 

### Enclosure Design
<div style="display: inline-block; height=300;">
    <img src="../images/EnclosureDesign1.png" alt="EnclosureDesign1" height="355">
    <img src="../images/EnclosureDesign3.png" alt="EnclosureDesign2" height="355">
</div>
I found a wooden box that would fit the breadboard perfectly if I place it diagnoally, which helps stablelize the breadboard. 
<img src="../images/breadboard_enclosure.png" alt="breadboard enclosure design" height="400">

I knew I wanted to joystick to be outside the box, but have the Joystick pins and wires covered. Wrapping the wrapping paper I got around the Joystick was the hard part. To do this, I measured out rough size of the joystick circle and cut out circle for it to fit through. 

Afterwards, I taped down the joystick and wires to the lid so that I could stablize them while I wrap the paper over it. 
<img src="../images/joystick_enclosure.png" alt="joystick enclosure design" height="400">


## Final Result 

<div style="display: inline-block; height=500;">
    <img src="../images/LaptopDemo.jpeg" alt="LaptopDemo" height="400">
    <img src="../images/collage1.png" alt="collage1" width="300" height="300">
    <img src="../images/collage2.png" alt="collage2" width="300" height="300">
</div>
