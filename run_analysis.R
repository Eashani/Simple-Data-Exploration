progAssignment <- function(){

	testdata <- read.table("ucidataset\\UCI HAR Dataset\\test\\X_test.txt")
	traindata <- read.table("ucidataset\\UCI HAR Dataset\\train\\X_train.txt")
	testactivitylabel <- read.table("ucidataset\\UCI HAR Dataset\\test\\y_test.txt")
	trainactivitylabel <- read.table("ucidataset\\UCI HAR Dataset\\train\\y_train.txt")

	totaldata <- rbind(traindata,testdata) 
	totallabel <- rbind(trainactivitylabel,testactivitylabel)
	
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
	dataset <- cbind(totallabel,totaldata)
	print(dataset[,1])


	
}
