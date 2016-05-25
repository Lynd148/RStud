### WBdata quick view script
#
#Next line creates a Vector variable called colnames and populates it with the names thatt we want to allocate to the dataframe columns
colnames<-c("Id","Age","GenderMF","Hypert","SBP","DBP")
##5 year 
##
#Next line assigns the values in colnames to the dataframe column names
names(WBdata) <- colnames
##
##
#The dataframe has 'one line per patient' data
#We are going to need a column that enables patients to be grouped according to age
#The next line uses a function to apportion individual patients to age bands in a new column - in this case 5 year bands x 21 bands
WBdata <-AddAgeBandsCol(WBdata,"Age",5,21,"Agebands5")
##
##
#Next line looks at the structure of the dataframe (i.e. number of columns, names, datatypes and examples of data)
str(WBdata)
##
##
##
#We can now look at the agesex profile of the overall population using another function
#The function simply needs to know the dataframe of interest, the names of the Agebands and Gender columns and a title for the graph
#Next line uses the function to generate the age sex profile (see bottom right panel)
PlotAsp(WBdata,"Agebands5","GenderMF",mtitle="Test population")
##
##
##
#Next line creates a new dataframe that contains patient details for all antihypertensives (numerator)
Hypertdf <- WBdata[WBdata$Hypert=="Yes",]
##
##
#Next two lines give us the population numbers (row counts) for general population (deniminator) and for hypertensives
nrow(WBdata)
nrow(Hypertdf)
##
##
#Next line performs summary count on Hypert column of Hypertdf to confirm that only patients with hypertension are included
summary(Hypertdf$Hypert)
##
##
#Next line uses PLotAsp function again but this time to look at raw age sex distribution for hypertension
PlotAsp(Hypertdf,"Agebands5","GenderMF",mtitle="Hypertension population")
##
##
#What happens to the prevalence of hypertension with sex and age?
#We can plot age sex distribution for hypertension based on prevalence per 1000 geeral population
#Next line runs a function to do this.  It uses the geeral population as demoninator and the hypertensive population as numerator
PlotPrevAsp(WBdata,Hypertdf,"Agebands5","GenderMF","Hypertensives per 1000 population")
#Compare the age sex distribution with the previous graph.  Use the arrows on the bar below Files plots... to toggle back and forth
##
##
##
##
#Look at diastolic blood pressures in general population and in hypertensive population
#Next two lines run summary functions to compare.  Look in particular at the means
summary(WBdata$DBP)
summary(Hypertdf$DBP)
##
##
#Next two lines do the same for systolic BP
summary(WBdata$SBP)
summary(Hypertdf$SBP)
##
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
##
#Finally a demonstration of data cleaning
#Data cleaning typically requires removal of extreme low and extreme high values - and also of records with no data
#
#Next block shows this for systolic BP.  Arbitrarily here we hace set the lower bound to >60 and the upper bound to <220
#First line is default excluding NAs and second line shows arguments for including NAs
df1 <-DataClean(Hypertdf,"SBP",60,220)
df1 <-DataClean(Hypertdf,"SBP",60,220,naremove = FALSE)
##
##
#Tidy up
rm(df1,CleanDBP,Hypertdf)
##
##
#Garbage collection to release memory
gc()
