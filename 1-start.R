if(FALSE){
  
    #importdata
      
    #prepare, explore and clean data
      
    #fit a statistical model
     
    #Evaluate the model fit/cross-validate the model
      
    #Evaluate the model prediction on new data
     
    #produce report
  
}
if(FALSE){
age <-c(1,3,5,2,11,9,3,9,12,13)
weight <-c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
mean(weight)
sd(weight)
cor(age,weight) #correlation
plot(age,weight)
q()#quite
}
#demo()
#help.start() General help
#help("foo") Search help system for instances of the string foo
#example("foo") Examples of function foo (quotation marks optional)
#RsiteSearch("foo") Search for the string foo in online help manuals and archieved mailing lists
#apropos ("foo", mode="function") Lists all functions with foo in their name
#data() Lists all available example datasets contained in currently loaded packages
#vignette() List all available vignettes for currently installed packages
#vignette("foo") Displays specific vignettes for topic foo
if(FALSE){
getwd() #find current directory
dir.create()#create dir
setwd()#argument "dir" is missing set dir
ls()#List the objects in the current workspace 
rm(objectlist)#Remove deletes) one or more objects.
help("options")#Provides information about available options.
options()#Lets you view or set current options.
#history(#)#Display your last # commands (default = 25)
savehistory("myfile") #saves the commands history to myfile(default=.Rhistory).
loadhistory("myfile") #Reloads a command's history (default=.Rhistory)
save.image("myfile") #Saves the workspace to myfile (default=.RData)
save(objectlist, file="myfile") #Saves specific objects to a file
load("myfile") #Loads a workspace into the current session

options(digits=3)
x<-runif(20)
summary(x)
hist(x)

source("filename")#submits a script to current session
#Text
sink("filename")#function redirects output to the file filename.
#append=TRUE
#split=TRUE
#dev.off() to return output to terminal.

bmp("filename.bmp")
jpeg()
pdf()
png()
postscript(".ps")
svg()
win.metafile(.wmf)

source("script1.R")
sink("myoutput",append=TRUE,split=TRUE)
pdf("mygraphs.pdf")
source("script2.R")
sink()
dev.off()
source("script3.R")

.libPaths() #show you where your library is located
library() #show pakage saved in library
#R include basic set of pakage base, datasets,utils,grDevices,graphics,stats and methods
#install.packages("gclus")
#update.packages()
#installed.packages() #details of packages


#library(gclus) #load the package

#help(package="package_name")#package details

#Linux or Mac OS X command in terminal window

#R CMD BATCH options infile outfile
#infile name of file containing R code to be executed
#outfile is the name of the file receiving the output
#options lists options that controls execution
#By convention infile is given the extension .R
#outfile is given extension .Rout

#For windows, use
#"C:\path\R.exe" CMD BATCH
#--vanilla --slave "c:\my projects\myscript.R"

#For more details see "Introdution to R" documentation available from CRAN (http://cran.r-project.org).




lm(mpg~wt,data=mtcars)# simple linear regression predicting miles per gallon (mpg) from car weight(wt) using automative dataset mtcars.
lmfit<-lm(mpg~wt,data=mtcars)#store it in an object
summary(lmfit)
plot(lmfit)
cook<-cooks.distance(lmfit)#generates and stores influence statistics
plot(cook)#graph them
predict(lmfit, mynewdata)#predict miles per gallon from car weight in a new set of data

help.start()#open general help
install.packages("vcd")#install package
help(package="vcd")#list the functions in package
library(vcd)#load the package
help("Arthritis")#discription of the dataset Arthritis
Arthritis#printout Arthritis
example("Arthritis")#run example 
q()#quite

}
