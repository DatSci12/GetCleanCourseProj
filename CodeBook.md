## Getting and Cleaning Data Course Project Codebook

### Data Used ###

Description of variables used, the data and transformations and work performed in order to render the file clean

* Download the data for course project from the link below. This file is a zipped file. [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* A full description is available at the site where the data was obtained: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Variables Used ###
A comprehensive list of the variables utilized can be found in the files in the data ZIP file once extracted. A list of the activities and the subjects are also available in the included text files

### Transformation of the data set ###

* Training and Test data sets merged to create the first tidy data set.
* Data has been cleaned to only extract the measurements on the mean and standard deviation for each measurement.
* The activity names have been made descriptive.
* A first data set was created with only the mean, standard deviation measurements.
* A second tidy data set was created that averaged each variable for each activity and each subject.