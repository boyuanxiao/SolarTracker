#include <Time.h>
#include <TimeLib.h>
#include <Servo.h>

#define RANGE 160
#define HORIZONTAL_OFFSET -(180 - RANGE/2)
#define VERTICAL_OFFSET 0
#define _PI 3.1415926535892
#define VERBOSE 0

const float position_latitude = 52.1931;
const float position_longitude = -1.1382;
const float obliquity = 23.43704;

int inter_del = 2 * 1000; // delay between moves in seconds
int factor = 12 * 60; // How much to scale the delay by to get simulaed delay, here converts seconds to mnutes
int low_angle = 10;
int high_angle = 170;
int del = 3;

struct julian_date
{
  long julian_date_whole;
  float julian_date_frac;
};

void print_julian_date(struct julian_date *jd) {
  Serial.print("Julian Date: ");
  Serial.print(jd->julian_date_whole);
  Serial.print(", ");
  Serial.print(jd->julian_date_frac);
  Serial.print('\n');
}

float get_julian_centuries(struct julian_date *jd) {
  // Calculate the number of centuries
  float T;
  T = ((float)(jd->julian_date_whole - 2451545) + jd->julian_date_frac) / 36525.0;
  return T;
}

float get_solar_longitude(float T) {
  // Returns the true longitude of the sun in ecliptic co-ordinates
  // Takes the number of centuries
  float longitude, solar_longitude, mean_anomaly, eq_of_centre;
  solar_longitude = fmod(280.46645 + 36000.76983 * T, 360.0);
  mean_anomaly = fmod(357.5291 + 35999.0503 * T, 360.0);
  eq_of_centre = 1.9146 * sin(mean_anomaly * _PI / 180.0) + 0.019993 * sin(2 * mean_anomaly * _PI / 180.0) + 0.00029 * sin(3 * mean_anomaly * _PI / 180.0);
  longitude = solar_longitude + eq_of_centre;

  return fmod(longitude, 360.0);
}

float get_declination(float longitude) {
  float declination;
  declination = 180.0 / _PI * asin(sin(obliquity * _PI / 180.0) * sin(longitude * _PI / 180.0));

  return declination;
}

float calculate_azimuth(float hour_angle, float declination) {
  float A, B, azimuth;
  A = cos(hour_angle * _PI / 180.0) * sin(position_latitude * _PI / 180.0);
  B = tan(declination * _PI / 180.0) * cos(position_latitude * _PI / 180.0);
  azimuth = 180.0 / _PI * (atan2(sin(hour_angle * _PI / 180.0), (A - B)) + _PI);

  return 360.0 - azimuth;
}

void update_servo_angles(int *servo_elevation, int *servo_azimuth, float elevation, float azimuth) {
  int servo_angle_h, servo_angle_v;
  servo_angle_h = (int) azimuth + HORIZONTAL_OFFSET;
  servo_angle_v = (int) elevation;
  // Check if the values are out of bounds:
  if (servo_angle_h > RANGE || servo_angle_h < 0 || servo_angle_v < 0 || servo_angle_v > 90) {
    *servo_elevation = 0;
    *servo_azimuth = 0;
  } else {
    *servo_elevation = servo_angle_v;
    *servo_azimuth = servo_angle_h;
  }

}

float calculate_elevation(float hour_angle, float declination) {
  float A, B, elevation;
  A = sin(position_latitude * _PI / 180.0) * sin(declination * _PI / 180.0);
  B = cos(position_latitude * _PI / 180.0) * (cos(declination * _PI / 180.0) * cos(hour_angle * _PI / 180.0));
  elevation = 180 / _PI * asin(A + B);
  return elevation;
}

void update_julian_date(time_t t, struct julian_date *jd) {
  int _month, _year;
  // Time structure holds years in terms of years from 1990
  _year = year(t);
  _month = month(t) - 1;
  if (_month < 2) {
    _month += 12;
    _year -= 1;
  }
  long B;
  long julian_date_whole;
  float julian_date_frac;
  float T;
  B = 2L + (long)_year / 100L + ((long)_year / 100L) / 4L;
  julian_date_whole = (long)(365.25 * (_year + 4716)) + (long)(30.6001 * (_month + 1)) + (long)day(t) + B - 1534L;
  julian_date_frac = (float)((float)(hour(t)) + (float)(minute(t)) / 60.0 + (float)(second(t)) / 3600.0) / 24.0 - 0.5;

  // update the current julian date
  jd->julian_date_whole = julian_date_whole;
  jd->julian_date_frac = julian_date_frac;
}

float approxiamate_hour_angle(time_t t) {
  return 180.0 - (15.0 * ( (float)hour(t) + (float)(minute(t)) / 60.0));
}

void print_val(String s, float val) {
  Serial.print(s);
  Serial.print(": ");
  Serial.print(val);
  Serial.print('\n');
}

Servo hServo;
Servo vServo;
time_t t;
struct julian_date jd;

int hour_cur = 12;
int min_cur = 32;
int day_cur = 14;
int mon_cur = 5;
int year_cur = 2017;
int angle;
int current_angle_h = low_angle;
int current_angle_v = low_angle;

void setup() {
  Serial.begin(9600);
  hServo.attach(11);
  vServo.attach(12);
  //  Move the servo into initial position
  hServo.write(low_angle);
  vServo.write(low_angle);
  setTime(hour_cur, min_cur, 0, day_cur, mon_cur, year_cur);
  //  Setup the current time
  t = now();
  print_val("Setup time", t);
  update_julian_date(t, &jd);
}

void loop() {
  int servo_angle_h;
  int servo_elevation, servo_azimuth;
  t += (inter_del / 1000) * factor;
  update_julian_date(t, &jd);
  float julian_centuries, solar_longitude, hour_angle, declination, azimuth, elevation;

  julian_centuries = get_julian_centuries(&jd);
  solar_longitude = get_solar_longitude(julian_centuries);
  hour_angle = approxiamate_hour_angle(t);
  declination = get_declination(solar_longitude);
  azimuth = calculate_azimuth(hour_angle, declination);
  elevation = calculate_elevation(hour_angle, declination);

  update_servo_angles(&servo_elevation, &servo_azimuth, elevation, azimuth);

  current_angle_h = hServo.read();
  while (current_angle_h != servo_azimuth) {
    if (current_angle_h < servo_azimuth) {
      hServo.write(current_angle_h + 1);
      current_angle_h += 1;
      delay(del);
    } else {
      hServo.write(current_angle_h - 1);
      current_angle_h -= 1;
      delay(del);
    }
  }

 current_angle_v = vServo.read();
 while (current_angle_v != servo_elevation) {
   if (current_angle_v < servo_elevation) {
    vServo.write(current_angle_v + 1);
    current_angle_v += 1;
    delay(del);
   } else {
    vServo.write(current_angle_v - 1);
    current_angle_v -= 1;
    delay(del);
   }
 }
  print_julian_date(&jd);
  print_val("Julian Centuries", julian_centuries);
  print_val("Hour Angle", hour_angle);
  print_val("Declination", declination);
  print_val("Azimuth", azimuth);
  print_val("Elevation", elevation);

  delay(inter_del);
}

