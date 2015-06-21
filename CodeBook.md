
Study Design:
This dataset is based on a human activity recognition experiment using samrtphones carried out by Jorge L. Reyes-Ortiz, <em>et al</em> at the SmartLab of the Universita degli Studi di Genova. (<a href="mailto:activityrecognition@smartlab.ws">Contact</a>). A summary of this experiment follows.

The original experiment was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity readings were captured at a constant rate of 50Hz. The original experiments were video-recorded to label the data activity manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. In this exercise, the training and test data sets were combined into a single data set.

The sensor signals consisted of 128 individual readings per 2.56 second sliding window. From each window, a vector of features was obtained by calculating various time and frequency variables. These variables were a series of statistical measures including various means, standard deviations, etc. In total, 561 distinct variables (referred to as "features") were gathered for each window for each volunteer.

The final dataset in this exercise consists of further statistical calculations (all mean calculations) against the original features, which were themselves either means or standard deviations. These means were calculated for each combination of (subject, activity) - where "subject" refers to one of the original experiment participants and "activity" refers to the action being performed - WALKING, WALKING_UPSTAIRS, etc - by the participant while the original observations upon which our calculations were based were being taken.


Code Book:
Each row in the output tidy dataset consists of subject and activity identifiers and 66 features. The feature values were gathered as follows:
  - each subject was repeatedly observed performing one of six activities. Each "observation" consisted of taking 128 readings during a 2.56 second window. Each "reading" consisted  of both a smartphone accelerometer and gyroscope measurement. 
  - A series of 561 statistical calculations were performed on each of these observations. Each calculation resulted in a "feature" of the original dataset. Some 66 of these features were of either mean or standard deviation statistics. These features were the only ones of interest for the purposes of our study.
  -- the original observational features vectors were divided into a training set and a test set. We combined these into a single dataset; restricting ourselves to the 66 features of interest.
  -- we produced a further statistical analysis of the observational features of interest; namely we calculated the mean of each feature of interest over each distinct group (by activity and subject) of observations. 

The rows in our tidy dataset correspond to means taken of various mean and standard deviation variables estimated from discrete observations (each observation consisting of 128 readings of a smart phone accelerometer and gyroscope read over a time period of 2.56 seconds) of a particular subject (experiment participant) performing a particular activity (WALKING, WALKING_UPSTAIRS, etc)).

The columns of our dataset are as follows:

Subject: an anonymous numeric identifier for the subject being observed during the observational window.

Activity: takes on values WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING which identify 
precisely what activity was being performed by the subject during the observational window.

The remaining columns are to be interpreted by understanding each component of the column name. Each of them contain the mean of the described underlying observation

time  - represents time domain signals that were captured at a constant rate of 50 Hz and then passed through various filters.
frequency - represents frequency domain signals that were produced by applying  a Fast Fourier Transform (FFT) to some of the previous signals.
BodyAccelerometer - refers to the body motion component of the each accelerometer reading
GravityAccelerometer - refers to the gravitational component of each accelerometer reading
BodyGyroscope - refers to the angular velocity of the subject measured by the gyroscope
BodyGyroscopeJerk - refers to first derivative calculation made of the BodyAcc reading
BodyGyroscopeJerk - refers to the first derivative calculation made of the BodyGyro reading
perpendicular direction.
Magnitude - refers to a magnitude calculation (if (a,b,c) represents simultaneous a (X,Y,Z)-axis readings then Magnitude represents (SQRT(a^2+b^2+c^2))
mean - refers to the fact that the original statistic being manipulated is a mean statistic
std - refers to the fact that the original statistic being manipulated is a standard deviation statistic
X, Y, Z - refers to the 3-axial readings that the accelerometer and gyroscope provide - the X-axis along the bottom of the smartphone screen, the Y-axis along the side and the Z-axis emanating from the the screen in a 

TimeBodyAccelerometer.mean.X
TimeBodyAccelerometer.mean.Y
TimeBodyAccelerometer.mean.Z
TimeBodyAccelerometer.std.X
TimeBodyAccelerometer.std.Y
TimeBodyAccelerometer.std.Z
TimeGravityAccelerometer.mean.X
TimeGravityAccelerometer.mean.Y
TimeGravityAccelerometer.mean.Z
TimeGravityAccelerometer.std.X
TimeGravityAccelerometer.std.Y
TimeGravityAccelerometer.std.Z
TimeBodyAccelerometerJerk.mean.X
TimeBodyAccelerometerJerk.mean.Y
TimeBodyAccelerometerJerk.mean.Z
TimeBodyAccelerometerJerk.std.X
TimeBodyAccelerometerJerk.std.Y
TimeBodyAccelerometerJerk.std.Z
TimeBodyGyroscope.mean.X
TimeBodyGyroscope.mean.Y
TimeBodyGyroscope.mean.Z
TimeBodyGyroscope.std.X
TimeBodyGyroscope.std.Y
TimeBodyGyroscope.std.Z
TimeBodyGyroscopeJerk.mean.X
TimeBodyGyroscopeJerk.mean.Y
TimeBodyGyroscopeJerk.mean.Z
TimeBodyGyroscopeJerk.std.X
TimeBodyGyroscopeJerk.std.Y
TimeBodyGyroscopeJerk.std.Z
TimeBodyAccelerometerMagnitude.mean
TimeBodyAccelerometerMagnitude.std
TimeGravityAccelerometerMagnitude.mean
TimeGravityAccelerometerMagnitude.std
TimeBodyAccelerometerJerkMagnitude.mean
TimeBodyAccelerometerJerkMagnitude.std
TimeBodyGyroscopeMagnitude.mean
TimeBodyGyroscopeMagnitude.std
TimeBodyGyroscopeJerkMagnitude.mean
TimeBodyGyroscopeJerkMagnitude.std
FrequencyBodyAccelerometer.mean.X
FrequencyBodyAccelerometer.mean.Y
FrequencyBodyAccelerometer.mean.Z
FrequencyBodyAccelerometer.std.X
FrequencyBodyAccelerometer.std.Y
FrequencyBodyAccelerometer.std.Z
FrequencyBodyAccelerometerJerk.mean.X
FrequencyBodyAccelerometerJerk.mean.Y
FrequencyBodyAccelerometerJerk.mean.Z
FrequencyBodyAccelerometerJerk.std.X
FrequencyBodyAccelerometerJerk.std.Y
FrequencyBodyAccelerometerJerk.std.Z
FrequencyBodyGyroscope.mean.X
FrequencyBodyGyroscope.mean.Y
FrequencyBodyGyroscope.mean.Z
FrequencyBodyGyroscope.std.X
FrequencyBodyGyroscope.std.Y
FrequencyBodyGyroscope.std.Z
FrequencyBodyAccelerometerMagnitude.mean
FrequencyBodyAccelerometerMagnitude.std
FrequencyBodyAccelerometerJerkMagnitude.mean
FrequencyBodyAccelerometerJerkMagnitude.std
FrequencyBodyGyroscopeMagnitude.mean
FrequencyBodyGyroscopeMagnitude.std
FrequencyBodyGyroscopeJerkMagnitude.mean
FrequencyBodyGyroscopeJerkMagnitude.std