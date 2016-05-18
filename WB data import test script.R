### WBdata import test script
##
##
names(WBdata) <- colnames
#Add agebands 5years x 21 bands
WBdata <-AddAgeBandsCol(WBdata,"Age",5,21,"Agebands5")
str(WBdata)
PlotAsp(WBdata,"Agebands5","GenderMF",mtitle="Test population")
##
Hypertdf <- WBdata[WBdata$Hypert=="Yes",]
nrow(WBdata)
nrow(Hypertdf)
summary(Hypertdf$Hypert)
PlotAsp(Hypertdf,"Agebands5","GenderMF",mtitle="Hypertension population")
PlotPrevAsp(WBdata,Hypertdf,"Agebands5","GenderMF","Hypertensives per 1000 population")
summary(WBdata$DBP)
summary(WBdata$SBP)
hist(WBdata$DBP,xlim=c(0,160),breaks=seq(0,160, by=5), col="red",main="Diastolic BP in general population", xlab="BP in mm Hg")
hist(Hypertdf$DBP,xlim=c(0,160),breaks=seq(0,160, by=5), col="red",main="Diastolic BP in hypertensive population", xlab="BP in mm Hg")
hist(WBdata$SBP,xlim=c(0,250),breaks=seq(0,250, by=5), col="red",main="Systolic BP in general population", xlab="BP in mm Hg")
hist(Hypertdf$SBP,xlim=c(0,250),breaks=seq(0,250, by=5), col="red",main="Systolic BP in hypertensive population", xlab="BP in mm Hg")
