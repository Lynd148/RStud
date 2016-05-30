### WBdata quick view script
#
#Next line creates a Vector variable called colnames and populates it with the names that we want to allocate to the dataframe columns
colnames<-c("Id","Age","GenderMF","Hypert","SBP","DBP")
##
#Next line assigns the values in colnames to the dataframe column names
names(WBdata) <- colnames
View(WBdata)
##
#The next line uses a function to apportion individual patients to age bands in a new column - in this case 5 year bands x 21 bands
WBdata <-AddAgeBandsCol(WBdata,"Age",5,21,"Agebands5")
View(WBdata)
##
#Next line uses the function to generate the age sex profile (see bottom right panel)
PlotAsp(WBdata,"Agebands5","GenderMF",mtitle="Test population")
##
#Next line creates a new dataframe that contains patient details for all antihypertensives
Hypertdf <- WBdata[WBdata$Hypert=="Yes",]
##
#Next line uses PLotAsp function again but this time to look at raw age sex distribution for hypertension
PlotAsp(Hypertdf,"Agebands5","GenderMF",mtitle="Hypertension population")
##
##
#What happens to the prevalence of hypertension with sex and age?
#We can plot age sex distribution for hypertension based on prevalence per 1000 geeral population
#Next line runs a function to do this.  It uses the general population as denominator and the hypertensive population as numerator
PlotPrevAsp(WBdata,Hypertdf,"Agebands5","GenderMF","Hypertensives per 1000 population")
#Compare the age sex distribution with the previous graph.  Use the arrows on the bar below Files plots... to toggle back and forth
##
##
#Next two lines display diastolic BP as histogram for general population and then for hypertensive population
hist(WBdata$DBP,xlim=c(0,160),breaks=seq(0,160, by=5), col="red",main="Diastolic BP in general population", xlab="BP in mm Hg")
hist(Hypertdf$DBP,xlim=c(0,160),breaks=seq(0,160, by=5), col="red",main="Diastolic BP in hypertensive population", xlab="BP in mm Hg")
##
##
#Next two lines display systolic BP as histoogram for general population and then for hypertensive population
hist(WBdata$SBP,xlim=c(0,250),breaks=seq(0,250, by=5), col="red",main="Systolic BP in general population", xlab="BP in mm Hg")
hist(Hypertdf$SBP,xlim=c(0,250),breaks=seq(0,250, by=5), col="red",main="Systolic BP in hypertensive population", xlab="BP in mm Hg")#
##
##
#Tidy up
rm(WBdata,colnames,Hypertdf)
##
#Garbage collection to release memory
gc()
