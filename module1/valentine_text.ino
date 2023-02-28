#include <TFT_eSPI.h> // Hardware-specific library
#include <SPI.h>
#include "heart.h"

TFT_eSPI tft = TFT_eSPI();       // Invoke custom library

char* HEART_MESSAGES[] = {
    "I LUV YOU",
    "BE MINE",
    "SAY YES",
    "TEXT ME",
    "PEACE",
    "HUG ME"
};

void setup() {
  // put your setup code here, to run once:
  tft.init();
  tft.setRotation(1);
  //randomSeed(analogRead(0));
  tft.setSwapBytes(true);

}

void loop() {

  tft.fillScreen(TFT_BLACK);
  tft.pushImage(55,0,128,128,heart);


  tft.setTextSize(3);
  tft.setTextColor(TFT_GREEN);
  // Use middle of screen as datum
  int xpos = tft.width()/4-10;
  int ypos = tft.height()/4;

  int randNumber = random(6);
  tft.drawString(HEART_MESSAGES[randNumber], xpos, ypos, 2);
  
  delay(500);




  // put your main code here, to run repeatedly:
  /** for (int i = 0; i < 3; i++)
  {
    int rx = random(40);
    int ry = random(40);
    int x = rx + random(160 - rx - rx);
    int y = ry + random(128 - ry - ry);
    tft.drawEllipse(x, y, rx, ry, random(0xFFFF));
  }
  delay(2000);**/


}
