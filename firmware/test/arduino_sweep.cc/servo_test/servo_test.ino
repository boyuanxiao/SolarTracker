#include <Servo.h>

Servo hServo;  // create servo object to control a servo

int pos = 0;    // variable to store the servo position
int del = 3; //Delay variable in ms
int inter_del = 5000; // delay between moves
int low_angle = 10;
int high_angle = 170;
int current_angle = 0;
int dir = 0; // 0 for increase, 1 for decrease

void setup() {
  hServo.attach(12);
//  Move the servo into initial position
  hServo.write(low_angle);
}

void increase_angle() {
  for (pos = current_angle; pos < current_angle+15; pos += 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    if(pos == high_angle) {
      hServo.write(high_angle);
      dir = 1;
      break;
    }
    hServo.write(pos);             
    delay(del);            
  }
}

void decrease_angle() {
  for (pos = current_angle; pos > current_angle - 15; pos -= 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    if(pos == low_angle) {
      hServo.write(low_angle);
      dir = 0;
      break;
    }
    hServo.write(pos);             
    delay(del);            
  }
}


void loop() {
  current_angle = hServo.read();
  if(!dir) {
    increase_angle();
  } else {
    decrease_angle();
  }
  delay(inter_del);
}

