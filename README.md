
1.Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Create two folders in you working directory with names 'test' and 'train'
3. In unzipped data from step 1 find 'train' folder and copy 'subject_train.txt' and 'y_train.txt' to 'train' folder created in step 2. Find 'Inertial Signals' folder in 'train' folder in unzipped data and copy all files from it into 'train' folder created in step 2.
4. In unzipped data from step 1 find 'test' folder and copy 'subject_test.txt' and 'y_test.txt' to 'test' folder created in step 2. Find 'Inertial Signals' folder in 'test' folder in unzipped data and copy all files from it into 'test' folder created in step 2.
5. Verify the following files in test/train folders: 'subject_<placeholder>.txt', 'y_<placeholder>.txt', 'body_acc_x_<placeholder>.txt', 'body_acc_y_<placeholder>.txt', 'body_acc_z_<placeholder>.txt', 'body_gyro_x_<placeholder>.txt', 'body_gyro_y_<placeholder>.txt', 'body_gyro_z_<placeholder>.txt', 'total_acc_x_<placeholder>.txt', 'total_acc_y_<placeholder>.txt', 'total_acc_z_<placeholder>.txt'
where <placeholder> is either 'train' or 'test' accordingly.
6.  Copy run_anylisys.R found in this repo to the directory where 'train' and 'test' folders from step 2 are and set working to directory to that folder.
7.  Run run_anylisys.R

The script will merge train and test data, calculates mean and standard deviation for each variable originally represented as 128 element vector. Then it creates the tidy set of it with averages for each variable by 'Subject' and 'Activity' (please find descriptions of variable in code book in this repo)
