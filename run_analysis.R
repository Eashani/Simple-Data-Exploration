progAssignment <- function(){
	library("dplyr")

# load the necessary files

	testdata <- read.table("ucidataset\\UCI HAR Dataset\\test\\X_test.txt")
	traindata <- read.table("ucidataset\\UCI HAR Dataset\\train\\X_train.txt")
	testactivitylabel <- read.table("ucidataset\\UCI HAR Dataset\\test\\y_test.txt")
	trainactivitylabel <- read.table("ucidataset\\UCI HAR Dataset\\train\\y_train.txt")
	features <-  read.table("ucidataset\\UCI HAR Dataset\\features.txt")
	subtest <- read.table("ucidataset\\UCI HAR Dataset\\test\\subject_test.txt")
	subtrain <- read.table("ucidataset\\UCI HAR Dataset\\train\\subject_train.txt")

# combine training and test data

	totaldata <- rbind(traindata,testdata) 
	totallabel <- rbind(trainactivitylabel,testactivitylabel)
	totalsubject <- rbind(subtrain,subtest)

# step-3 descriptive activity names to name the activities in the data set

	for(i in 1:nrow(totallabel)){
		if(totallabel[i,1] == 1)
		totallabel[i,1] = "WALKING"
		else if(totallabel[i,1] == 2 )
		totallabel[i,1] = "WALKING_UPSTAIRS"
		else if(totallabel[i,1] == 3 )
		totallabel[i,1] = "WALKING_DOWNSTAIRS"
		else if(totallabel[i,1] == 4 )
		totallabel[i,1] = "SITTING"
		else if(totallabel[i,1] ==5 )
		totallabel[i,1] = "STANDING"
		else
		totallabel[i,1] = "LAYING"
		}

# step 1- make a composite dataset

	totalall <- cbind(totaldata,totallabel,totalsubject)


# step 4- rename the variables to meaningful names (names taken from features.txt)
	feat <- features[,2]
	feat <- as.character(feat)	
	for(i in 1:length(feat)){
		colnames(totalall)[i] <- feat[i]
	}
	
	colnames(totalall)[562] <- "activities"
	colnames(totalall)[563] <- "subjects"

	
# step 2- measurements on the mean and standard deviation for each measurement.(along with the columns "activities"and "subjects")
	 	
	meanstd <- totalall[,c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543,562,563)]


# step 5- independent tidy data set with the average of each variable for each activity and each subject.

	actsum <- meanstd %>% group_by(activities,subjects) %>% summarize_all(funs(mean))
	print(actsum)
	xyz <- write.table(actsum,file="final.txt",row.names=FALSE)


 
}
