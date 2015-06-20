Data Set Code Book: Wearable data computing

Draft Codebook
June 19, 2015
Codebook prepared by Marina Shestunina, based on samsung wearable data.

The text file contains wearable data records for 180 groups. Data grouped by subject and activity.



Variable:Activity

Variable type: Character

Allowable values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


Variable:Subject

Variable type: Numeric (integer)

Allowable values: 1:30

Comments: Id of the person executing activity


Variable:TotalAcceleration<Axis>AxisMeanAverage

Variable type: Numeric (double)

Allowable values: No restrictions

Comments: Average of means of the acceleration signal from the smartphone accelerometer axis in standard gravity
units 'g'. <Axis> placeholder is for X or Y or Z axis


Variable:TotalAcceleration<Axis>AxisStdDeviationAverage

Variable type: Numeric (double)

Allowable values: No restrictions

Comments: Average of standard deviations of the acceleration signal from the smartphone accelerometer axis in standard gravity units 'g'. <Axis> placeholder is for X or Y or Z axis


Variable:BodyAcceleration<Axis>AxisMeanAverage

Variable type: Numeric (double)

Allowable values: No restrictions

Comments: Average of means of the body acceleration signal obtained by subtracting the gravity from the total acceleration. <Axis> placeholder is for X or Y or Z axis


Variable:BodyAcceleration<Axis>AxisStdDeviationAverage

Variable type: Numeric (double)

Allowable values: No restrictions

Comments: Average of standard deviations of the body acceleration signal obtained by subtracting the gravity from the total acceleration. <Axis> placeholder is for X or Y or Z axis


Variable:BodyVelocity<Axis>AxisMeanAverage

Variable type: Numeric (double)

Allowable values: No restrictions

Comments: Average of means of the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. <Axis> placeholder is for X or Y or Z axis


Variable:BodyVelocity<Axis>AxisStdDeviationAverage

Variable type: Numeric (double)

Allowable values: No restrictions

Comments: Average of standard deviations of the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. <Axis> placeholder is for X or Y or Z axis
