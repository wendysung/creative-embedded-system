# Module 2 - Interactive Art 

## Description
The goal of this project to create an interactive device with the provided hardware to send data back to my laptop for visualization, sonfication, or any other media generation process. 

For my specifc project, I am creating an interactive device that allow users to create their own digital collage. Through using the joystick, the user will go through a series of randomly ordered images to

used the data collected from the user's interaction with the Joystick to provide visual indicators of the
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

### Blog Post & Video

Blog Post: https://wendysung.github.io/creative-embedded-system/

Youtube: https://www.youtube.com/watch?v=1Ghk-OtDypA
