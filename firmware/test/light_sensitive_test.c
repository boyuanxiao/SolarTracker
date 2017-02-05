#include "ch.h"
#include "hal.h"
#include "servo.h"

#define SERVO1 8
#define SERVO2 7
#define SERVO3 6
#define SERVO4 9

static PWMConfig pwmcfg = {
  1000000, /* 1MHz PWM clock frequency */
  20000, /* PWM period 20 milli  second */
  NULL,  /* No callback */
  /* Only channel 3 enabled */
  {
    {PWM_OUTPUT_ACTIVE_HIGH, NULL},
    {PWM_OUTPUT_ACTIVE_HIGH, NULL},
    {PWM_OUTPUT_ACTIVE_HIGH, NULL},
    {PWM_OUTPUT_ACTIVE_HIGH, NULL},
  },
  0
};
  

int main(void) 
{
  enum {UP, DOWN};
  static int dir = UP, step = 50, width = 700; /* starts at .7ms, ends at 2.0ms */

  halInit();
  chSysInit();

  /* Enables PWM output (of TIM4, channel 3) on servo connected to PB8 */  
  palSetPadMode(GPIOB, SERVO1, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOB, SERVO2, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOB, SERVO3, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOB, SERVO4, PAL_MODE_ALTERNATE(2));

  pwmStart(&PWMD4, &pwmcfg);

  while (TRUE) {
    pwmEnableChannel(&PWMD4, 0, width);
    pwmEnableChannel(&PWMD4, 1, width);
    pwmEnableChannel(&PWMD4, 2, width);
    pwmEnableChannel(&PWMD4, 3, width);
    
    if(width == 700){
      dir = UP;
    } else if {
     (width == 2000) dir = DOWN;
   }
    
    if (dir == UP) {
      width += step;
    } else if {
      (dir == DOWN) width -= step;
    }
  
    chThdSleepMilliseconds(100);
  }
}