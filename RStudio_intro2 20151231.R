####RStudio_intro2 20151231
##
##    Import text file into R to create a data frame
##
##    Use of names function
##    Rename columns using vectors
##
##    Copy data frame
##
##    Add a column to existing data frame
##    Briefly show data type conversions 
##    head and tail commands to look at dataframes
##    
##    Removing columns from data frame
##    Reordering columns in dataframe
##
##    Use of hist to view cholesterol data
##    Histogram
#############################################################################################################################
##     Importing data from non Rdata source
##
##
## ***** NB first ensure that Working Directory is correctly set *****
##
## View Cholesteroliso text file
## Note that you are now using top left panel as data viewer
## Use inbuilt Tools | Import dataset | From text file command
## Note the appearance of Cholesteroliso object in Workspace and the information available there
##
## Can use str function
str(Cholesteroliso)      # this is a data frame
##
## Delete this data frame 
rm(Cholesteroliso)
##
## use this script to import
##
setwd("~/SWISS2016")
##
Choldf <- read.csv("Cholesteroliso.csv")
View(Choldf)
##################################
##
##
##     Rename data frame columns
##
## names function to find names and ordering of columns
names(Choldf)
##
orignames <- names(Choldf)    # assign this to a vector
edit(orignames)     #Note edit function may not work in this lab environment
fix(orignames)      #Note fix function may not work in this lab environment
orignames
##
## can change column names either by editing orignames or by creating new vector
newnames <- c("IsoDate","CholValue")
##
## Now assign this modified vector and look at data frame structural information
names(Choldf) <- newnames
##################################
##
##
##     Add a column to data frame by creating a proper date column
##
## First make a copy of the data frame
Choldf2 <- Choldf
##
## Next line creates the new column
Choldf2$Rdate <-as.Date(as.character(Choldf2$IsoDate), format='%Y%m%d')
head(Choldf2)
str(Choldf2)
##  Object of above exercise was to demonstrate addition of a column but also demonstrates
#      use of $ convention for naming specific column
#      data types can be converted from one to another
#      R expressions can be nested into quite complicated command lines
#      R has a very flexible way of formatting imported foreign dates 
##
## Run this next section as a block to add a further column that shows days since reference date
## R can do maths on dates - not relevant here
AnotherDate <- "01/01/1995"
ReferenceDate <- as.Date(AnotherDate, format='%d/%m/%Y')
Choldf2$DateDiff <- Choldf2$Rdate - ReferenceDate
head(Choldf2)
tail(Choldf2)
str(Choldf2)
#################################
##
##
##
##       Remove columns from data frame, re-order columns
##
View(Choldf2)
names(Choldf2)
## Use row, column indexing - note the square brackets [] again.  This way we can select just the columns we want in the required order
Choldf3 <- Choldf2[,c(3,2,4)]
View(Choldf3)
##
## Alternatively if we ONLY want to remove a column we can do
Choldf2$IsoDate <- NULL
View(Choldf2)
#################################
##
##
##
##    Attempt to visualise this data using hist
summary(Choldf3$CholValue)      # 'summary' is useful command
hist(Choldf3$CholValue)
##
## Data cleaning needed.  Run next section to achieve this.  Will revisit this later in more detail
CholesterolClean <- Choldf3[!is.na(Choldf3$CholValue) & Choldf$CholValue > 0 & Choldf3$CholValue < 15,]
summary(CholesterolClean$CholValue)
hist(CholesterolClean$CholValue,breaks = seq(1,10,by = 0.4),col="red",main="Histogram of cleaned cholesterol values")
#################################
##
##
##
##     Clean up
##
rm(CholesterolClean,Choldf,Choldf2,Choldf3,AnotherDate,orignames,newnames,ReferenceDate)
gc()
