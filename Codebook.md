# Codebook

# Data infomation

The data can be found in `CompleteDataSet.txt` which can be read with `read.table("CompleteDataSet.txt", header = TRUE)`

The first row contains the names of the variables and the second row onwards contains the values

# Variables

Each row has a subject, the respective activity, and 79 averaged signal values

## Identifiers

`SubjectId` Integer that indicates which subject the row refers to, ranges from 1 to 30
`ActivityId` Indicates which activity the subject is performing, has six possible values, `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, and `WALKING_UPSTAIRS`

## measurements


The rest of the data are displayed as means of certain measurements taken during the experiment. The measurements are determined with a key indicating what the variable refers to.

`Time` refers to the time domain signals, while`Frequency` refers to frequency domain signals.

Acceleration measurements are represented by `Accelerometer` and are measured in g's while gyroscope measurements represented by `Gyroscope` are kept in radians.

the body linear acceleration and angular velocity were derived in time to obtain `Jerk` signals

`X`,`Y`, and `Z` are used to denote 3-axial signals in the X, Y and Z directions.