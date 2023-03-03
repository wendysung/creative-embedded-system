# Creative Embedded System README

## Module 1 - Generative Art 

<div style="display: inline-block;">
    <img src="images/module1_installation_1.jpeg" alt="Module 1 Installation" height="300">
    <img src="images/installation1.gif" alt="Module 1 Installation" height="400">
</div>



### Description
The goal of this collaborative project was to create an generative art installation that plays with any text of our choices. The installation was initally intended to have all the ESP32 TTGO T-displays to be hung up in Barnard's CS department, however, due to technical difficulties with our batteries, it ended being on a wired board.

For my specifc code, I took inspiration from our (original) installation date: Valentine's Day &#x1F496;

### Details

Materials and Softwares required:
- One ESP32 TTGO T-display
- Battery
- USB-C cord
- Arduino

<img src="images/materials.jpeg" alt="Module 1 Installation" width="400">

Steps to recreate project:
1. Download Arduino and open the software.

2. Add ESP32 board to Arduino by going <b>Preferences</b> and adding the following link to <b>Additional Board Manager</b>: https://dl.espressif.com/dl/package_esp32_index.json

3. Under <b>Tools > Board > esp32</b>, select <b>TTGO T1</b>

4. Under <b>Tools > Port</b>, make sure your are connected to the port that connects to your ESP32.

5. Install <b>tft_eSPI</b> by <b>Bodmer</b> in Library Manager. 

6. Under where the library is stored on your laptop (check sketchbook location under Preferences, probably under <b>Documents/Arduino/libraries/tft_eSPI</b>), make the following changes to the header file <b>User_Setup_Select.h</b>:
    - Comment out the following line as so
    ```
    // #include <User_Setup.h>           // Default setup is root library folder
    ```
    - Uncomment the following line as so:
    ```
    #include <User_Setups/Setup25_TTGO_T_Display.h>    // Setup file for ESP32 and TTGO T-Display ST7789V SPI bus TFT
    ```

7. Code your generative art on Arduino, compile and run it on your ESP32. (Make sure the dimension is set for a 160 x 128 screen)

8. (Optional) Solder battery to ESP32 so it could run without an USB-C cord.

Here is a youtube link for the setup demo: https://www.youtube.com/watch?v=adLUgmCJKnM

