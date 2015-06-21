##You should create one R script called run_analysis.R that does the following. 
#1) Merges the training and the test sets to create one data set.
#2) Extracts only the measurements on the mean and standard deviation for each 
#	measurement. 
#3) Uses descriptive activity names to name the activities in the data set
#4) Appropriately labels the data set with descriptive variable names. 
#5) From the data set in step 4, creates a second, independent tidy data set 
#	with the average of each variable for each activity and each subject.

# Step 0: initialization and prerequisites
s0init <- function(){
	rm(list = ls())
	if (!require("data.table")) {
		install.packages("data.table")
	}
	
	if (!require("reshape2")) {
		install.packages("reshape2")
	}

	if (!require("dplyr")) {
		install.packages("dplyr")
	}
	
	require("data.table")
	require("reshape2")
	require("dplyr")

	# download project source zip file into a temp file. Required files will be
	# extracted individually when they are needed.
	print("Initialization: downloading zip file...")
	UCI_HAR_raw <- tempfile()
	download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",UCI_HAR_raw)
	print("Initialization: file downloaded successfully")
	print("Initialization: reading training data...")
	readTrainData()
	print("Initialization: training data read successfully")
	print("Initialization: reading testing data...")
	readTestData()
	print("Initialization: testing data read successfully")
	features <<- read.table(unz(UCI_HAR_raw,"UCI HAR Dataset/features.txt"), stringsAsFactors = FALSE)[,2]
	print("Initialization: feature variables read successfully")
	activityLabels <<- read.table(unz(UCI_HAR_raw,"UCI HAR Dataset/activity_labels.txt"))[,2]
	print("Initialization: activity labels read successfully")
	
	# delete the temp file once all data has been read
	unlink(UCI_HAR_raw)
}
readTrainData <- function(){
	x_train <<- read.table(unz(UCI_HAR_raw,"UCI HAR Dataset/train/X_train.txt"))
	y_train <<- read.table(unz(UCI_HAR_raw,"UCI HAR Dataset/train/y_train.txt"))
	subject_train <<- read.table(unz(UCI_HAR_raw,"UCI HAR Dataset/train/subject_train.txt"))
}

readTestData <- function(){
	x_test <<- read.table(unz(UCI_HAR_raw,"UCI HAR Dataset/test/X_test.txt"))
	y_test <<- read.table(unz(UCI_HAR_raw,"UCI HAR Dataset/test/y_test.txt"))
	subject_test <<- read.table(unz(UCI_HAR_raw,"UCI HAR Dataset/test/subject_test.txt"))
}

# Step 1: Merging training and test data

s1mergeTrainTest <- function(){
	x_all <<- rbind(x_train, x_test)
	y_all <<- rbind(y_train, y_test)
	subject_all <<- rbind(subject_train, subject_test)
	print("Step1: testing and training data merged")
}


# Step2: Extracting features for only the mean and standard deviation for each 
#	measurement. These features include the word mean() or std() in their name.
#	These will be used as column names in the tidy data set later.
s2extractMeanStdDevFeatures <- function(){
	
	reqdFeaturesIndex <<- grep(pattern = "mean\\(\\)|std\\(\\)", features, 
						  ignore.case=TRUE, value=FALSE)
	x_all2 <<- x_all[,reqdFeaturesIndex]
	print("Step2: Extracted features for only the mean and standard deviation for each 
#	measurement")
	
}
#Step 3: Apply descriptive activity names to name the activities in the data set
s3applyActivityLabels <- function(){

	y_all$ActivityLabel <<- factor(y_all$V1, labels = as.vector(activityLabels))
	print("Step3: Applied descriptive activity names to name the activities in the data set")
}

#Step 4: Appropriately labels the data set with descriptive variable names. This
#		is the step the full data set is merged together.
s4labelDataSetVariables <- function(){
	reqdFeatures <- grep(pattern = "mean\\(\\)|std\\(\\)", features, 
						  ignore.case=TRUE, value=TRUE)
	columnsRmDots <- gsub("\\.+", "\\.", make.names(reqdFeatures, unique = TRUE))
	columnsRmDots2 <- gsub("\\.$", "", make.names(columnsRmDots, unique = TRUE))
	columnsRmBodyBody <- gsub("BodyBody", "Body", columnsRmDots2)
	columnsRepT <- gsub("^t", "Time", columnsRmBodyBody)
	columnsRepF <- gsub("^f", "Frequency", columnsRepT)
	columnsRepAcc <- gsub("Acc(?=[A-Z]|\\.)", "Accelerometer", columnsRepF, perl = TRUE)
	columnsRepGyro <- gsub("Gyro(?=[A-Z]|\\.)", "Gyroscope", columnsRepAcc, perl = TRUE)
	columnNames <<- gsub("Mag(?=[A-Z]|\\.)", "Magnitude", columnsRepGyro, perl = TRUE)
	
	colnames(x_all2) <<- columnNames
	
	y_all <<- rename(y_all, ActivityCode = V1)
	colnames(subject_all) <<- "Subject"
	print("Step4: labeled the data set with descriptive variable names")
}

s4combineOneDataSet <- function(){
	data_all <<- cbind(subject_all, y_all, x_all2)
	print("Step4: combined all data parts into one data set")
}

#Step 5" From the data set in step 4, a second, independent tidy data set 
#	is created with the average (mean) of each variable for each activity 
#	and each subject.
s5meanBySubjectActivity <-function(){
	id_labels <- c("Subject", "ActivityCode", "ActivityLabel")
	data_labels <- setdiff(colnames(data_all), id_labels)
	data_all_melt <<- melt(data_all, id = id_labels, measure.vars = data_labels)
	tidy_data <<- dcast(data_all_melt, Subject + ActivityLabel ~ variable, mean)
	print("Step5: a second tidy data set is created with the average of each variable for each activity and each subject.")
	write.table(tidy_data, file = ".UCI_HAR_tidy_data.txt", row.name=FALSE)
	print("Step5: the second tidy data set is extracted into file: UCI_HAR_tidy_data.txt")
}

#The code below executes the functions above in the required order to achieve
# the required tidy data set
# 
s0init()
s1mergeTrainTest()
s2extractMeanStdDevFeatures()
s3applyActivityLabels()
s4labelDataSetVariables()
s4combineOneDataSet()
s5meanBySubjectActivity()