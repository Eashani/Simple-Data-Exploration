This is the course project for the Getting and Cleaning Data course on Coursera.
It uses data from the:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
===================================================================================

The training and test data are loaded and combined together to form a composite dataset . (STEP 1 of project)

=========================================================================================================================================================
The labels for both these datasets were also combined and each activity, previously denoted by numbers ranging from 1-6 was replaced by the values (STEP 3 of project)
1- WALKING
2- WALKING_UPSTAIRS
3- WALKING_DOWNSTAIRS
4- SITTING
5- STANDING
6- LAYING

========================================================================================
The mean and standard deviation measures from the composite dataset are extracted. (STEP 2 of project)
 note: the following columns were not included: all the meanFreq columns and the angle columns which had mean values as an argument
 
 ====================================================================================================================================
 The names of the variables denoting the features were extracted from the file "features.txt" and stored in a vector
 this vector was used to change the original column names to more descriptive ones (STEP 4 of the project)(explained in detail in the codebook)
==============================================================================================================================================
A second, independent tidy data set with the average of each variable for each activity and each subject is created from the above dataset from step 4

The result of this is stored in the the text file
