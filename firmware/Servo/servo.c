/*
 * ChibiOS/Servo is a small library to easily interface RC servos with ChibiOS/RT.
 *
 * BSD licensed
 *
 * Author: Joel Bodenmann aka Tectu   <joel@unormal.org>
 */

#include "servo.h"

static PWMConfig pwmcfg = {
    1000000,	// 1MHz PWM clock frequency
    20000,		// PWM period 20 milliseconds
    (pwmcallback_t) NULL,
    {}, // PWM Channel config
    0,
    0
    // (PWMChannelConfig*) NULL
};

void servoInit(Servo *servo) {
	/* create the channel configuration */
	PWMChannelConfig chcfg = { PWM_OUTPUT_ACTIVE_HIGH, NULL };
	pwmcfg.channels[servo->pwm_channel] = chcfg;
	palSetPadMode(servo->port, servo->pin, PAL_MODE_OUTPUT_PUSHPULL);

	/* start the PWM unit */
	pwmStart(servo->pwm_driver, &pwmcfg);
}

void servoSetValue(Servo *servo, uint16_t value) {
	/* a bit of safty here */
	if(value > servo->max)
		value = servo->max;
	if(value < servo->min)
		value = servo->min;

	pwmEnableChannel(servo->pwm_driver, servo->pwm_channel, (pwmcnt_t)value);
}

void servoSetMax(Servo *servo, uint16_t value) {
	servo->max = value;	
}

void servoSetMin(Servo *servo, uint16_t value) {
	servo->min = value;
}

uint16_t servoGetMax(Servo *servo) {
	return (servo->max);
}

uint16_t servoGetMin(Servo *servo) {
	return (servo->min);
}

