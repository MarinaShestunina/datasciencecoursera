library(plyr)
## gettable function 
gettable<-function(path, suffix){
    files<-list.files(path, pattern="*.txt")
    ## create data table from txt files read and calculate mean and standard deviation
    ## for each observation represented as 128 elements vector
    targettable <- do.call("cbind", lapply(files, function(x)  {
        rawtable<-read.table(paste(path, x, sep="/"))
        ## if table contains just one column it is data table
        ## so do calculate means and sd
        if (ncol(rawtable) > 1) {
            mmean<-apply(rawtable,1,mean)
            deviation<-apply(rawtable,1,sd)
            tidytable <-data.table(deviation)
            tidytable$mn<-mmean
            setnames(tidytable,"deviation",sub(suffix,"sd",x))
            setnames(tidytable,"mn",sub(suffix,"mean",x))
            tidytable
        }
        
        ## if table contains just one column it is either subject or activity one 
        ## so do not calculate means and sd
        else {
            colnames(rawtable)[1] <-sub(suffix,"",x)
            rawtable
        }
    }))
    targettable
}
traindata<-gettable("./train", "train.txt")
testdata<-gettable("./test", "test.txt")
## merge train and test table into one
mergeddata<-do.call("rbind", list(testdata,traindata))
##rename columns to more meaningful strings
setnames(mergeddata,"y_","Activity")
setnames(mergeddata,"subject_","Subject")
setnames(mergeddata,"body_acc_x_sd","BodyAccelerationXAxisStdDeviation")
setnames(mergeddata,"body_acc_x_mean","BodyAccelerationXAxisMean")
setnames(mergeddata,"body_acc_y_sd","BodyAccelerationYAxisStdDeviation")
setnames(mergeddata,"body_acc_y_mean","BodyAccelerationYAxisMean")
setnames(mergeddata,"body_acc_z_sd","BodyAccelerationZAxisStdDeviation")
setnames(mergeddata,"body_acc_z_mean","BodyAccelerationZAxisMean")
setnames(mergeddata,"body_gyro_x_sd","BodyVelocityXAxisStdDeviation")
setnames(mergeddata,"body_gyro_x_mean","BodyVelocityXAxisMean")
setnames(mergeddata,"body_gyro_y_sd","BodyVelocityYAxisStdDeviation")
setnames(mergeddata,"body_gyro_y_mean","BodyVelocityYAxisMean")
setnames(mergeddata,"body_gyro_z_sd","BodyVelocityZAxisStdDeviation")
setnames(mergeddata,"body_gyro_z_mean","BodyVelocityZAxisMean")
setnames(mergeddata,"total_acc_x_sd","TotalAccelerationXAxisStdDeviation")
setnames(mergeddata,"total_acc_x_mean","TotalAccelerationXAxisMean")
setnames(mergeddata,"total_acc_y_sd","TotalAccelerationYAxisStdDeviation")
setnames(mergeddata,"total_acc_y_mean","TotalAccelerationYAxisMean")
setnames(mergeddata,"total_acc_z_sd","TotalAccelerationZAxisStdDeviation")
setnames(mergeddata,"total_acc_z_mean","TotalAccelerationZAxisMean")
## map activity codes to actual activities 
mergeddata$Activity<-mapvalues(mergeddata$Activity,c(1,2,3,4,5,6), c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
## create a tidy dataset calculating averages by subject and activity
tidyset<-ddply(mergeddata,c("Activity","Subject"),summarise,TotalAccelerationXAxisMeanAverage=mean(TotalAccelerationXAxisMean), TotalAccelerationXAxisStdDeviationAverage=mean(TotalAccelerationXAxisStdDeviation), TotalAccelerationYAxisMeanAverage=mean(TotalAccelerationYAxisMean), TotalAccelerationYAxisStdDeviationAverage=mean(TotalAccelerationYAxisStdDeviation), TotalAccelerationZAxisMeanAverage=mean(TotalAccelerationZAxisMean), TotalAccelerationZAxisStdDeviationAverage=mean(TotalAccelerationZAxisStdDeviation), BodyAccelerationXAxisMeanAverage=mean(BodyAccelerationXAxisMean), BodyAccelerationXAxisStdDeviationAverage=mean(BodyAccelerationXAxisStdDeviation),BodyAccelerationYAxisMeanAverage=mean(BodyAccelerationYAxisMean), BodyAccelerationYAxisStdDeviationAverage=mean(BodyAccelerationYAxisStdDeviation), BodyAccelerationZAxisMeanAverage=mean(BodyAccelerationZAxisMean), BodyAccelerationZAxisStdDeviationAverage=mean(BodyAccelerationZAxisStdDeviation), BodyVelocityXAxisMeanAverage=mean(BodyVelocityXAxisMean), BodyVelocityXAxisStdDeviationAverage=mean(BodyVelocityXAxisStdDeviation),BodyVelocityYAxisMeanAverage=mean(BodyVelocityYAxisMean), BodyVelocityYAxisStdDeviationAverage=mean(BodyVelocityYAxisStdDeviation), BodyVelocityZAxisMeanAverage=mean(BodyVelocityZAxisMean), BodyVelocityZAxisStdDeviationAverage=mean(BodyVelocityZAxisStdDeviation) )
