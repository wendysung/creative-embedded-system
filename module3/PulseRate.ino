#define USE_ARDUINO_INTERRUPTS false // not using interrupts with the pulse rate playground
#include <PulseSensorPlayground.h>

const int OUTPUT_TYPE = SERIAL_PLOTTER;

const int PULSE_INPUT = 26;    // pulse rate sensor
const int PULSE_BLINK = 25;    // LED pin
const int THRESHOLD = 2870;   // Adjust this number to avoid noise when idle

/*
   samplesUntilReport = the number of samples remaining to read
   until we want to report a sample over the serial connection.

   We want to report a sample value over the serial port
   only once every 20 milliseconds (10 samples) to avoid
   doing Serial output faster than the Arduino can send.
*/
byte samplesUntilReport;
const byte SAMPLES_PER_SERIAL_SAMPLE = 10;

/*
  PulseSensor Playground object.
*/
PulseSensorPlayground pulseSensor;

void setup() {
  Serial.begin(115200);

  // Configure the PulseSensor manager.
  pulseSensor.analogInput(PULSE_INPUT);
  pulseSensor.blinkOnPulse(PULSE_BLINK);

  pulseSensor.setSerial(Serial);
  pulseSensor.setOutputType(OUTPUT_TYPE);
  pulseSensor.setThreshold(THRESHOLD);

  // start from 10 (no samples read yet)
  samplesUntilReport = SAMPLES_PER_SERIAL_SAMPLE;

  // Now that everything is ready, start reading the PulseSensor signal.
  if (!pulseSensor.begin()) {
    Serial.println("PulseSensor initialization failed");
  }
}

void loop() {
  /*
     sawNewSample() will read and process a sample (analog voltage) from the PulseSensor
  */
  if (pulseSensor.sawNewSample()) {
    /*
       Print sample in serial if it is ready for report
    */
    if (--samplesUntilReport == (byte) 0) {
      samplesUntilReport = SAMPLES_PER_SERIAL_SAMPLE;

      Serial.println(pulseSensor.getBeatsPerMinute());

      /*
         At about the beginning of every heartbeat,
         report the heart rate and inter-beat-interval.
      */
      if (pulseSensor.sawStartOfBeat()) {
        pulseSensor.outputBeat();
      }
    }
  }
}
