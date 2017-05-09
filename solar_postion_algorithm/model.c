
/*Given a ime and position, this program should be able to
calculate the azimuth and elevation
of the sun*/

//For this model the input will take the form of a time struct, in the
// embedded application a TIME and DATE will be used for the starting time
// and a count used to determine time since then
// The servo has about 100 degrees of rotational range
// For the servo, let the horizontal have 90 degrees centred on South
// For vertical servo, let 90 be directly upwards (i.e. no change)

#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdio.h>

#define PI 3.14159265
#define RANGE 160
#define HORIZONTAL_OFFSET -(180 - RANGE/2)
#define VERTICAL_OFFSET 0

#define VERBOSE 0

const float position_latitude = 52.1931;
const float position_longitude = -1.1382;
const float obliquity = 23.43704;

struct julian_date
{
	long julian_date_whole;
	float julian_date_frac;
};

void print_julian_date(struct julian_date *jd) {
	printf("Whole: %ld\n", jd->julian_date_whole);
	printf("Frac: %f\n", jd->julian_date_frac);
}

void update_julian_date(struct tm *time, struct julian_date *jd) {
	// Returns the current time in terms of Julian centuries since 12h UTC Jan 1 2000
	// The change in T over the course of a day is likely negligible: only run once a day (or even less frequently?)

	// Calculate the Julian date 
	int month, year;
	// Time structure holds years in terms of years from 1990
	year = 1900 + time->tm_year;
	month = time->tm_mon;
	if (time->tm_mon < 2) {
		month = time->tm_mon + 12;
		year -= 1;
	}
	int B;
	long julian_date_whole;
	float julian_date_frac;
	float T;
	B = 2 + year/100 + (year/100)/4;
	julian_date_whole = (int)(365.25 * (year + 4716)) + (int)(30.6001 * (month + 1)) + time->tm_mday + B - 1534;
	julian_date_frac = (float)((float)(time->tm_hour) + (float)(time->tm_min)/60.0 + (float)(time->tm_sec)/3600.0)/24.0 - 0.5;
	
	// update the current julian date
	jd->julian_date_whole = julian_date_whole;
	jd->julian_date_frac = julian_date_frac;
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
	eq_of_centre = 1.9146 * sin(mean_anomaly * PI/180.0) + 0.019993 * sin(2*mean_anomaly * PI/180.0) + 0.00029 * sin(3*mean_anomaly * PI/180.0);
	longitude = solar_longitude + eq_of_centre;
	
	return fmod(longitude, 360.0);
}

float approxiamate_hour_angle(struct tm *time) {
	return 180.0 - (15.0 * ( (float)time->tm_hour + (float)time->tm_min/60.0));
}

float get_hour_angle(struct julian_date *jd, float longitude) {
	// Calculates the hour angle in degrees, equal to Greenwich hour angle + longitude - right ascension
	float greenwich_hour_angle, right_ascension, hour_angle;
	greenwich_hour_angle = 280.46061837 + 0.98564736629 * ((float)(jd->julian_date_whole - 2451545)) + 360.98564736629 * jd->julian_date_frac;
	right_ascension = atan(sin(longitude * PI/180) * cos(obliquity * PI/180.0)/cos(longitude * PI/180.0));
	// Convert back in the range 0 -> PI and convert to degrees
	right_ascension = 180.0/PI * (right_ascension);
	hour_angle = greenwich_hour_angle - position_longitude - right_ascension;

	return fmod(hour_angle + 180.0, 360.0);
}

float get_declination(float longitude) {
	float declination;
	declination = 180.0/PI * asin(sin(obliquity * PI/180.0) * sin(longitude * PI/180.0));
	
	return declination;
}

float calculate_azimuth(float hour_angle, float declination) {
	float A, B, azimuth;
	A = cos(hour_angle * PI/180.0) * sin(position_latitude * PI/180.0);
	B = tan(declination * PI/180.0) * cos(position_latitude * PI/180.0);
	azimuth = 180.0/PI * (atan2(sin(hour_angle * PI/180.0), (A - B)) + PI);

	return 360.0 - azimuth;
}

void update_servo_angles(int *servo_elevation, int *servo_azimuth, float elevation, float azimuth) {
	int servo_angle_h, servo_angle_v;
	servo_angle_h = (int) azimuth + HORIZONTAL_OFFSET;
	servo_angle_v = (int) elevation;
	// Check if the values are out of bounds:
	if(servo_angle_h > RANGE || servo_angle_h < 0 || servo_angle_v < 0 || servo_angle_v > 90) {
		*servo_elevation = 0;
		*servo_azimuth = 0;
	} else {
		*servo_elevation = servo_angle_v;
		*servo_azimuth = servo_angle_h;
	}

}

float calculate_elevation(float hour_angle, float declination) {
	float A, B, elevation;
	A = sin(position_latitude * PI/180.0) * sin(declination * PI/180.0);
	B = cos(position_latitude * PI/180.0) * (cos(declination * PI/180.0) * cos(hour_angle * PI/180.0));
	elevation = 180/PI * asin(A + B);
	return elevation;
}

int main(int argc, char const *argv[])
{
	int i, second, minute, hour, day, month, year;
	int servo_angle_v, servo_angle_h;

	time_t raw_time;
	struct julian_date *jd;
	jd = malloc(sizeof(struct julian_date));
	
	struct tm *time_ptr;
	time_ptr = malloc(sizeof(struct tm));
	time(&raw_time);
	time_ptr = gmtime(&raw_time);
	time_ptr->tm_mon = 5;
	for (i = 3; i < 21; ++i) {
		time_ptr->tm_hour = i;
	
		float julian_centuries, solar_longitude, hour_angle, declination, azimuth, elevation;
		update_julian_date(time_ptr, jd);
		julian_centuries = get_julian_centuries(jd);
		solar_longitude = get_solar_longitude(julian_centuries);
		hour_angle = approxiamate_hour_angle(time_ptr);
		declination = get_declination(solar_longitude);
		azimuth = calculate_azimuth(hour_angle, declination);
		elevation = calculate_elevation(hour_angle, declination);
		update_servo_angles(&servo_angle_v, &servo_angle_h, elevation, azimuth);
		printf("Current Time:%2d:%2d\n", time_ptr->tm_hour, time_ptr->tm_min);
	#if VERBOSE	
		printf("Current Time: %4d:%2d:%2d:%2d:%02d\n", time_ptr->tm_year, time_ptr->tm_mon, time_ptr->tm_mday, time_ptr->tm_hour, time_ptr->tm_min);
		print_julian_date(jd);
		printf("Julian Centuries: %f\n", julian_centuries);
		printf("Solar Longitude: %f\n", solar_longitude);
		printf("Hour Angle: %f\n", hour_angle);
		printf("Declination: %f\n", declination);
	#endif
		
		printf("Solar Azimuth: %f\n", azimuth);
		printf("Solar Elevation: %f\n", elevation);

		printf("Servo Horizontal Angle: %d\n", servo_angle_h);
		printf("Servo Vertical Angle: %d\n", servo_angle_v);
		printf("\n");
	}
	return 0;
}