import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;      // Data received from the serial port
String trimmedVal;
String target = "X,Y,Z: ";
String[] splitVals;
ArrayList<PImage> images = new ArrayList<PImage>();
HashMap<Integer, int[]> location = new HashMap<>();
int x; 
int y;
int z;
int counter;
PImage background;
int prevZ; 

String[] backgrounds = {
  "background_1.png",
  "background_2.png",
  "background_3.png"
};


String[] filenames = {
  "breath.png",
  "butterfly.png",
  "two-hearts.png",
  "love_definition.png",
  "dragon.png",
  "heart.png",
  "sparkles.png",
  "road.png",
  "hands.png"
};


void setup() 
{
  size(800,800);
  String portName = Serial.list()[1];
  System.out.println(portName);
  myPort = new Serial(this, portName, 115200);
  for(String i: filenames) {
    PImage img = loadImage(i);
    images.add(img);
  }
  counter = 0;
  prevZ = 1;
  int backgroundIndex = int(random(backgrounds.length));
  background = loadImage(backgrounds[backgroundIndex]);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.readStringUntil('\n');         // read it and store it in val
    if (val !=null){
      //System.out.println(val);
      val = trim(val);
      trimmedVal = val.replaceAll(target, "");
      splitVals = trimmedVal.split(",");  
      x = int(trim(splitVals[0]));
      y = int(trim(splitVals[1]));
      z = int(trim(splitVals[2]));
          
      int xCol = normalizeColor(x);
      int yCol = normalizeColor(y);
      int xPos = normalizePos(x);
      int yPos = normalizePos(y);
      background(background);

      //background(xCol,yCol,xCol);  
      
      if (counter >=images.size()) {
       
        System.out.println("stop");
        // show collage
        for (int i=0; i<images.size(); i++){
          int[] pos = location.get(i);
          //System.out.println("posX = " + pos[0] + " posY = " + pos[1]);
          image(images.get(i), pos[0], pos[1]);
        }
      } else {
      // 1. show image
      // 2. user move. image move with it. 
      // 3. only move to next image when user press button
        System.out.println(counter);
        
        for (int i=0; i<counter; i++){
          int[] pos = location.get(i);
          //System.out.println("posX = " + pos[0] + " posY = " + pos[1]);
          image(images.get(i), pos[0], pos[1]);
        }
        
        image(images.get(counter), xPos, yPos);


        if (prevZ != z) {
          // change is from 1 -> 0
          if (z == 0) {
            //System.out.println(counter);
            //image(images.get(counter), xPos, yPos);
            saveImage(xPos, yPos, counter);
            counter++ ;
          }
          prevZ = z;  
        } 
      }
    }
  }
  
}

public static int normalizeColor(int value){
  int norm = (value*255)/4095;
  return norm;
}

public static int normalizePos(int value){
  int norm = (value*1000)/4095;
  return norm;
}

public void saveImage(int x, int y, int index){
  //System.out.println("saving: " + x + ", " + y);
  int[] list = {x,y};
  location.put(index, list);
}

/**public static void showCollage(ArrayList<PImage> images, HashMap<Integer, int[]> location) {
  for (int i=0; i<images.size(); i++){
       int[] pos = location.get(i);
              image(images.get(i), pos[0], pos[1]);
            }

}**/

/*

// Wiring / Arduino Code
// Slightly modified from the freenove joystick example

  Filename    : Joystick
  Description : Read data from joystick.
  Auther      : www.freenove.com
  Modification: 2020/07/11

int xyzPins[] = {13, 12, 14};   //x,y,z pins
void setup() {
  Serial.begin(9600);
  pinMode(xyzPins[2], INPUT_PULLUP);  //z axis is a button.
  pinMode(25, INPUT_PULLUP);  //button.
}

void loop() {
  int xVal = analogRead(xyzPins[0]);
  int yVal = analogRead(xyzPins[1]);
  int zVal = digitalRead(xyzPins[2]);
  //Serial.printf("X,Y,Z: %d,\t%d,\t%d\n", xVal, yVal, zVal);
  //Serial.printf(zVal);
  int buttonVal = digitalRead(25);
  Serial.print(buttonVal);
  Serial.print('\n');
  delay(100);
}



*/
