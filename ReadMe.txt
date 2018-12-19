UCI HAR Dataset Script

This dataset is a combination of both the test and train datasets and is an expression of both the mean and std deviation of all measurements within the set. 
The R script combines the dataset to a final, usable form with the following steps:
* Downloading the data package
* Appending labels for
	- Subject
	- Activity ID
	- Activity Label
* Filtering the columns to only select measurements of the mean and standard deviation

The final portion of the script creates a second dataset grouped by subjects and activities, showing the means for all measurements.