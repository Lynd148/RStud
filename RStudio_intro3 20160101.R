##### Data frames using real health care data already in R format
##
##    Load in .Rdata file
##
##    Use of row column indexing to select a subset of columns
##    Introduce use of 'is.na' / '!is.na'
##    Review data types
##
##    Visualise population data using 'hist'
##      and user defined functions for age sex profile
##      for general population and diseases
##
##    Visualise numeric data both non parametric and parametric
##    Introduce 'summary' and 'nrow'
##
##    Visualise categorical variables, tables, barplot and boxplot
##    Use of ~ with boxplot
##############################################################################################################
##Load in the dataframe using .Rdata file that is a 'wrapper' for previously prepared R environment
##Use SISS2015.RData
load("~/SWISS2016/SWISS2016.RData")
##
##
names(SISS2015main)
str(SISS2015main)
################################
##
##
##    Select a more manageable subset of the columns to work with in this session
##
## There are many ways of doing this; the following two lines give alternatives using "row / column" indexing 
##
df1 <-SISS2015main[,c(1,3,4,8,7,37,39,43,13,48,49,18,26,32,9,10,30)]
##
df1 <-SISS2015main[,c("PatientId","PracticeGroup","PatientAge2014","GenderMF","Agebands5","DiabType","Hypert",
                      "StrokeTia","BmiValue","SBpClean","DBpClean","CholesterolValue","CreatinineValue",
                      "HbA1cValue","Ethnicity5cat","DeprivationScore","SmokingCat")]
## 
names(df1)
## Note we now have only 17 columns and have changed their order
##
str(df1)
##Look at the different data types
###############################
##
##
##     Look at the overall population data
##
summary(df1$GenderMF)
summary(df1$PatientAge2014)
## Clean these up
df2 <-df1
##
df2$GenderMF<-factor(df2$GenderMF,levels=c("F","M"))       #Simply takes out the "I" category that we don't need
df2 <- df2[df2$PatientAge2014 <110,]                       #Only allow rows where age is less than 110 but keep all columns
##
summary(df2$GenderMF)
summary(df2$PatientAge2014)
##
hist(df2$PatientAge2014)
hist(df2$PatientAge2014,col="coral2",main="Overall population age distribution",xlab="Age")
hist(df2$PatientAge2014,xlim =c(0,110),breaks=seq(0,110, by=5),col="coral2",main="Overall population age distribution",xlab="Age")
##
##  For age sex profile can use function 'plotasp'
plotasp(df2,Agebands="Agebands5",GenderMF="GenderMF",mtitle="ASP for overall population")
################################
##
##
##     Look at the population for a particular diagnosis
##
names(df2)
summary(df2$Hypert)
diagdf <- df2[!is.na(df2$Hypert),]                        #Only keep rows where Hypert is"Yes" while keeping all columns
##
summary(diagdf$Hypert)
##
hist(diagdf$PatientAge2014,col="darkorange3",main="Hypertension population age distribution",xlab="Age")
plotasp(diagdf,Agebands="Agebands5",GenderMF="GenderMF",mtitle="ASP for hypertension population")
##
## Can look at the prevalence with age and sex using function 'plotprevasp'
plotprevasp(df2,diagdf,Agebands="Agebands5",GenderMF="GenderMF",mtitle="ASP for hypertension per 1000 population")
################
##
## Can repeat the above sequence for any of the other diagnoses
names(df2)
summary(df2$DiabType)
diagdf2 <- df2[!is.na(df2$DiabType),]
summary(diagdf2$DiabType)
##
hist(diagdf2$PatientAge2014,col="darkorange1",main="Diabetes population age distribution",xlab="Age")
plotasp(diagdf2,Agebands="Agebands5",GenderMF="GenderMF",mtitle="ASP for diabetes population")
##
plotprevasp(df2,diagdf2,Agebands="Agebands5",GenderMF="GenderMF",mtitle="ASP for diabetes per 1000 population")
################################
##
##
##     Numeric variables - look at HbA1c levels in type 2 diabetes
##
summary(diagdf$DiabType)
str(diagdf$DiabType)
##
## Refine from diabetes to just T2
diagdf3 <- diagdf2[diagdf2$DiabType == "T2",]
##
## Look at the data
summary(diagdf3$DiabType)
plotasp(diagdf3,Agebands="Agebands5",GenderMF="GenderMF",mtitle="ASP for T2 diabetes population")
##
plotprevasp(df2,diagdf3,Agebands="Agebands5",GenderMF="GenderMF",mtitle="ASP for T2 diabetes per 1000 population")
##
##
summary(diagdf3$HbA1cValue)
##
diagdf4 <-diagdf3[!is.na(diagdf3$HbA1cValue) & diagdf3$HbA1cValue >20 & diagdf3$HbA1cValue <200,]  #Remove extremes and NAs
##
## What percentage of rows have we lost through this cleaning?
(nrow(diagdf3)-nrow(diagdf4))/nrow(diagdf3) *100
##
## Look at the data
summary(diagdf4$HbA1cValue)
hist(diagdf4$HbA1cValue)
hist(diagdf4$HbA1cValue,xlim =c(0,186),breaks=seq(0,186, by=2),col="orange",main="IFCC HbA1c values in T2 diabetes",xlab="IFCC HbA1c")
boxplot(diagdf4$HbA1cValue,main="IFCC HbA1c values in T2 diabetes",ylab="mmol/mol")
########
##
## Can repeat the above sequence for diastolic BP
summary(diagdf3$DBpClean)
##
diagdf5 <-diagdf3[!is.na(diagdf3$DBpClean) & diagdf3$DBpClean >20 & diagdf3$DBpClean <130,]  #Remove extremes and NAs
##
## What percentage of rows have we lost through this cleaning?
(nrow(diagdf3)-nrow(diagdf5))/nrow(diagdf3) *100
##
## Look at the data
summary(diagdf5$DBpClean)
hist(diagdf5$DBpClean,xlim =c(25,130),breaks=seq(25,130, by=5),col="orange",main="DBP values in T2 diabetes",xlab="mm Hg")
boxplot(diagdf5$DBpClean,main="DBP values in T2 diabetes",ylab="mm Hg")
########################################
##
##
##
##     Tables, categorical variables, barplot and boxplot
##
## Look for categorical variables
str(diagdf3)
##
table(diagdf3$GenderMF)
table(diagdf3$SmokingCat)
table(diagdf3$Ethnicity5cat)
##
table(diagdf3$SmokingCat,diagdf3$GenderMF)
tbla <- table(diagdf3$SmokingCat,diagdf3$GenderMF,useNA="ifany")       #useNA is optional - but don't forget that there may be NAs
tbla
str(tbla)
barplot(tbla,legend=rownames(tbla),main="Smoking category and gender in T2 DM")
##
table(diagdf3$SmokingCat,diagdf3$Ethnicity5cat)
tblb <- table(diagdf3$SmokingCat,diagdf3$Ethnicity5cat,useNA="ifany")
tblb
barplot(tblb,legend=rownames(tblb),beside=FALSE,main="Smoking category and ethnicity category in T2 DM")
barplot(tblb,legend=rownames(tblb),beside=TRUE,main="Smoking category and ethnicity category in T2 DM")
##
tblc <- table(diagdf2$GenderMF,diagdf2$DiabType,useNA="ifany")
tblc
barplot(tblc,legend=rownames(tblc),beside=FALSE,main="Gender and Diabetes type in diabetes")
##
## Can relate numeric variable to categorical variable - note use of ~
boxplot(diagdf2$HbA1cValue~diagdf2$DiabType,main="HbA1c values in T1 and T2 diabetes",ylab="mmol/mol")
########################################
##
##     Clean up
##
rm(df1,df2,diagdf,diagdf2,diagdf3,diagdf4,diagdf5,tbla,tblb,tblc)
gc()

