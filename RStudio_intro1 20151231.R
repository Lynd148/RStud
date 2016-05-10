####RStudio_intro1 20141208
###
###Basic introduction to R in the R Studio environment
###   Prime objective to familiarise with the 4 panels
##
##    Console
##    Files, plots, packages, help 
##    Source editor and data viewer
##    Command history and workspace browser
##
##    Arithmetic operators
##    Logical operators
##
##    Simple functions such as  c and seq and use of :
##
##    introducing vectors - creating, indexing, processing
##
##    Use bmi calculation as example of using vectors
##    Simple plot of resulting bmi vector against height showing colours and plot function of lower R hand panel
################################################################################################################
##
##
##    Console
##
## Try these
2+2
5-3
12*5
100/25
5^3
13%%5     # This finds modulus of 13 divided by 5
13%/%5
## and a few more
log(6.6)
sin(60)
(1+3)*(6-4)/(3+4+12-3)
###########################
##
##
##    Files, Plots, Packages, Help
##
## Set the working directory
## Look at files
## .R denotes R script
## .Rdata denotes a file that contains all of the objects saved from a workspace
###########################
##
##
##    Source editor and data viewer
##
## This script opened in the source editor
## Any script can be run, edited and saved repeatedly until the desired results are obtained
## Note that anything following a hash # in a script is treated by R as a comment
##
## Perform some algebra / assign values / look at logical operators 
## Note use of <- is considered to be best practice for assigning values to variables
a <- 2
b <- 3
c <- 5
d <- a+c
a
b
c
d
a < b
b > c
e <- a+b
c == e
c <=e
c >=e
## Logical operators | (pipe) is OR & is AND  ! signifies NOT
(a+b)== c | (a+b)== d
(a+b)== c & (a+b)== d
c !=d
##
isTRUE((a+b)== c | (a+b)== d)
############################
##
##
##    Workspace browser and command history
##  
## Note the appearance of 'objects' under the environment tab in the fourth panel
## Note the entries under the history tab in the fourth panel
############################
##
##
##
##     Vectors and some useful simple R functions / features
##
## Use of colon to denote a simple range
a <- (2:6)
## Note that a is now a vector.  In excel would be a single dimensional array
a
## Use of seq to create sequences
b <- seq(from=4.5,to=5.1,by=0.2)
b
## Use of c to 'combine'
c <-c(1,7,3,4.1,12)
c
## Can combine all of the above
d <-c(2:6,seq(from=4.5,to=5.1,by=0.2),1,7,3,4.1,12)
d
## Or algebraically more simply as
e <-c(a,b,c)
e
## Note that c works for categorical variables too
animals <- c("cat","dog","hamster","rabbit","horse","pig","cow","goat","sheep")
############################
##
##    Indexing of values in vectors
animals
animals[4]
animals[c(5,1,3)]
animals[2:4]
animals[c(1:3,8)]
###########################
##
##
##     Use of str function to get structural information about these variables / objects
str(a)
str(e)
str(animals)
##########################
##
##
##     Calculate a BMI, set up height as a vector and then plot resulting bmi vector values against height
height <- 1.6
weight <- 70
bmi <- weight/height^2
bmi
##
## Set up height as a vector and repeat this calculation
##
height <- seq(from=1.2,to=2,by=0.1)
bmi <- weight/height^2
plot(height,bmi)
plot(height,bmi, type= "l",col="green")
####################################
##
##
##Cleaning up
## Workspace
rm(a,b,c,d,e,animals,bmi,height,weight)
## Or we could simply use the Clear for both environment and history
##
## Clear plots from bottom R panel
##
## Clear console by using <CTRL> L
##
## Next function call advised by the experts to clear out memory (especially for Windows)
gc()
##
## Finally close this script
