#include "ch.h"
#include "hal.h"
#include "servo.h"

Servo servo_horizontal = {
  GPIOB,
  9,
  &PWMD1,
  3,
  500,
  2000
};

Servo servo2 = {
  GPIOE,
  0,
  &PWMD1,
  4,
  500,
  2000
};

int main(void) {
  uint16_t i;

  halInit();
  chSysInit();

  servoInit(&servo_horizontal);
  servoInit(&servo2);

  while(TRUE)  {

    /* sweep the servos from one end to the other
     * you might want to use the servoGetMax() and
     * servoGetMin() routines to get the values
     */
    for(i = 700; i < 2000; i += 50) {
      servoSetValue(&servo_horizontal, i);
      servoSetValue(&servo2, i);
      chThdSleepMilliseconds(50);
    }
    for(i = 2000; i > 700; i -= 50) {
      servoSetValue(&servo_horizontal, i);
      servoSetValue(&servo2, i);
      chThdSleepMilliseconds(50);
    }
  }

  return 0;
}
