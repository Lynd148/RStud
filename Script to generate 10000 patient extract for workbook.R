# create small dataframe for RSudio intro
#names(SISS2015main)
#Take random sample of 10000 patients from SISS2015main and limit to Id, age, gender,hypertension, SBP and DBP
testdf <-SISS2015main[sample(nrow(SISS2015main),size=10000),c("PatientId","PatientAge2014","GenderMF","Hypert","SBpClean","DBpClean")]
#clean age and gender
testdf <-testdf[testdf$PatientAge2014 <111,]
testdf$GenderMF <- factor(as.character(testdf$GenderMF),exclude='I')
#Rename the columns - though this will be more relevant on import
#colnames <- names(testdf)
#fix(colnames)
names(testdf) <- colnames
#Rename rownames
rownames(testdf) <-seq(length=nrow(testdf))
#Overwrite Id using new rownames
testdf$Id <-as.numeric(rownames(testdf))+10000
#Make Hypert a two level 'Yes' / 'No' factor
testdf$Hypert <- factor(ifelse(is.na(testdf$Hypert),"No","Yes"),levels=c("Yes","No"))   #Makes Hypert a binary factor
#write out crude data without column names or rownames
write.table(testdf,file = "WBdata.csv",row.names = FALSE, col.names=FALSE,sep = ",")
#####
#####
#Remainder provides quick overview of the data to ensure that it gives meaningful results and will support workbooko requirements
##
#Add agebands 5years x 21 bands
testdf <-AddAgeBandsCol(testdf,"Age",5,21,"Agebands5")
PlotAsp(testdf,"Agebands5","GenderMF",mtitle="Test population")
##
testHypert <-testdf[testdf$Hypert=="Yes",]
nrow(testdf)
nrow(testHypert)
summary(testHypert$Hypert)
PlotAsp(testHypert,"Agebands5","GenderMF",mtitle="Hypertension population")
PlotPrevAsp(testdf,testHypert,"Agebands5","GenderMF","Hypertensives per 1000 population")
summary(testdf$DBP)
summary(testdf$SBP)
hist(testdf$DBP,xlim=c(0,160),breaks=seq(0,160, by=5), col="red",main="Diastolic BP in general population", xlab="BP in mm Hg")
hist(testHypert$DBP,xlim=c(0,160),breaks=seq(0,160, by=5), col="red",main="Diastolic BP in hypertensive population", xlab="BP in mm Hg")
hist(testdf$SBP,xlim=c(0,250),breaks=seq(0,250, by=5), col="red",main="Systolic BP in general population", xlab="BP in mm Hg")
hist(testHypert$SBP,xlim=c(0,250),breaks=seq(0,250, by=5), col="red",main="Systolic BP in hypertensive population", xlab="BP in mm Hg")
View(testdf)
##
rm(testdf,testHypert,WBdata)
