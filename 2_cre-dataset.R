if(False){
  #PatientID - row/case identifier
  #AdmDate - data variable
  #Age - Continue variable
  #Diabetes - nominal variable
  #Status - ordinal varibable
  
  
  #(List(Data Frame(Array(Matrix(vector)))))
  
  #vector
  a<-c(1,2,4,5,6,7,8,7)
  
  
  #Matrix
  
  #Eg: one
  y<-matrix(1:20,nrow = 5,ncol = 4)
  y
  
  #Eg: two
  cells<-c(1,26,24,68)
  rnames<-c("R1","R2")
  cnames<-c("C1","C2")
  mymatrix<-matrix(cells,nrow = 2,ncol = 2,byrow = TRUE,dimnames = list(rnames,cnames))
  mymatrix
  
  #Eg three
  x<-matrix(1:10,nrow = 2)
  x
  x[2,]
  X[,2]
  x[1,4]
  x[1,c(4,5)]
  
  #Arrays-similar to Matrix but can have more than two dimensions.
  
  #myarray<-array(vector,dimenstions,dimnames)
  
  #Eg
  
  dim1<-c("A1","A2")
  dim2<-c("B1","B2","B3")
  dim3<-c("C1","C2","C3","C4")
  z<-array(1:24,c(2,3,4),dimnames=list(dim1,dim2,dim3))
  z
  
  #Data Frames 
  
  #mydata<-data.frame(col1,col2,col3,...)
  
  patientID<-c(1,2,3,4)
  age<-c(25,34,28,52)
  diabetes<-c("Type1","Type2","Type1","Type1")
  status<-c("Poor","Improved","Excellent","Poor")
  patientdata<-data.frame(patientID,age,diabetes,status)
  patientdata
  
  patientdata[1:2]
  patientdata[c("diabetes","status")]
  patientdata$age
  table(patientdata$diabetes,patientdata$status)
  
  #attach/detach/with
  
  summary(mtcars$mpg)
  plot(mtcars$mpg,mtcars$disp)
  plot(mtcars$mpg,mtcars$wt)
  
  #This can also be written as follows
  attach(mtcars)
  summary(mpg)
  plot(mpg,disp)
  plot(mpg,wt)
  detach(mtcars)#remove datafram from search path.
  
  #limit of this function
  mgp<-c(25,36,47)
  attach(mtcars)#<-Masked by globalenv: mpg
  plot(mpg,wt)
  #Error in xy.coords -- x and y lengths differ
  mpg #output 25,36,47
  
  with(mtcars{
    print(summary(mpg))
    plot(mpg,disp)
    plot(mpg,wt)
  })
  
  with(mtcars,{
    stats<-summary(mpg)
    stats
  })
  
  stats#generally will give error 'object "stats" not found'
  
  with(mtcars,{
    keepstats<<-summary(mpg)#save object as global variable
  })
  
  #Case Identifiers
  
  #case identifiers can be specified with rowname option.
  
  #Eg:
    
  patientdata<-data.frame(patientID,age,diabetes,status,row.names = patientID)
  
  #specifies patientID as the variable to use in labeling cases on various printsouts and graphs product by R.
  
  #Factors
  
  status<-c("Poor","Improved","Excellent","Poor")
  status<-factor(status,ordered = TRUE)
  #will encode vector as (3,2,1,3)1=Excellent,2=Improved and 3=Poor
  
  #(Above is created in alphabatical order)
  
  status<-factor(status,ordered=TRUE,
  levels=c("Poor","Improved","Excellent"))#level option specifies order
  
  #if sex code is one for male and two for female in original data then
  sex<-factor(sex,levels=c(1,2),labels=c("Male","Female"))
  #The labels "Male and Female" would appear in the output instead of 1 and 2
  
  patientID<-c(1,2,3,4)
  age<-c(25,34,28,52)
  diabetes<-c("Type1","Type2","Type1","Type1") 
  status<-c("Poor","Improved","Excellent","Poor") 
  diabetes<-factor(diabetes)# 1 2 1 1
  status<-factor(status,order=TRUE)#3 2 1 3
  patientdata<-data.frame(patientID,age,diabetes,status)
  str(patientdata)
  #gives normal summary with frequency count for the categorical variables "diabetes and status"
  
  #Lists
  #can contain combination of vectors, matrices,data frames, and even other lists
  #Eg
  g<-"My First List"
  h<-c(25,26,18,39)
  j<-matrix(1:10,nrow = 5)
  k<-c("one","two","three")
  mylist<-list(title=g,ages=h,j,k) #create list
  mylist #print entire list
  
  mylist[[2]] #print second component
  mylist[["ages"]]
  
  #indices in R starts from 1
  
  #stylic guidance "Google's R style guide" (https://mng.bz/i775).
  
  #Data input
  
  #using keyboard
  
  mydata<-data.frame(age=numeric (0), gender=character (0), weight=numeric (0))
  mydata<-edit(mydata)
  fix(mydata) #short cut to above code.
 
  #Alternatively can embed data directly
  mydatatxt<-"
  age gender weight
  25 m 166
  30 f 155
  18 f 120
  "
  mydata<-read.table(header = TRUE,text=mydatatxt)
  


#using delimited text file

#mydataframe<-read.table(file,options)
#options
#header-logical value check whether the file contain header // header=True
#sep- delimiter separating data values // " "
#row.names- one or more variables to represent row identifiers
#col.names- can use col.names to specify a character vector in case header=False
#na.strings- eg- na.strings=c("-9","?") converts each -9 and ? value to NA 
#colclasses 
  {
          #Eg colclasses=c("numeric","numeric","character","NULL","numeric")
          #read first,second,fifth as numeric,third character and skips fourth
  }  
  
#quote- character use to delimit strings that contain special characters 
#(default is double(")or single (') quotes.)
  
#skip - number of lines to be skiped. useful to skip header comment
  
#strings-AsFactors - 
  {
    #A logical value indicating whether character should be converted to factors.
    #The default is True unless this is overridden by colclasses. 
    #setting stringAsFactors=False can speed up processing
  }
  
#text-character string specifying a text string to process.
  
  #StudentID,First,Last,Math,Science,Social Studies
  #011,Bob,Smith,90,80,67
  #012,Jane,Weary,75,,80
  #010,Dan,"Thornton,III",65,75,70
  #040,Mary,"0'Leary",90,95,92
  
  #file can be imported by:-
  
grades<-read.table("studentgrades.cvs",header = TRUE,row.names = "StudentID",sep=",")
grades
str(grades)

#read.table convert all the variable to factors. Can suppress this behaviour by stringsAsFactors=False
#Alternative can use colClasses option to specify each column in a class
#(eg: logical,numeric,character or factor) 

grades<-read.table("studentgrades.cvs",header = TRUE,row.names = "StudentID",sep=",",
colClasses=c("character","character","character","numeric","numeric","numeric"))

#Import data from Excel
library(xlsx)
workbook<-"c:/workbook.xlsx"
mydataframe<-read.xlsx(workbook,1)

#Import data from XML check documentation at www.omegahat.org/RSXL

#Import data from the web via webscraping or from APIs for more details vistit www.programmingr.com
{
#text can be downloaded using readLines(), function manipulation grep() and gsub()
#Rcurl and XML packages can be used to extract information desired
#can access twitter via twitterR,Facebook via Rfacebook,Flickr via Rflickr
#http://mng.bz/370r 
}

#Import data from SPSS
{
#Ibm SPSS imported into R via read.spss() in foreign package.
#Also can use spss.get() in Hmisc package ---is a wrapper function that automatically set many parameters of read.spss()
#install Hmisc package
}

#Importing data from SAS
{
#read.ssd() in foreign package
#sas.get() in Hmisc package
#read.sas7bdat() in sas7bdat package
#If SAS installed sas.get() can be a good point
}

#Importing data from Stata 
library(foreign)
mydataframe<-read.dta("mydata.dta")

#Importing data from NetCDF
library(ncdf)
nc<-nc_open("mynetCDFfile")
myarray<-get.var.ncdf(nc,myvar)

#Importing data from HDF5 tuttorial by Bernd Fischer http://mng.bz/eg6j

#Access (DBMS)
{
#First set to install and configure the appropriate ODBMS(this drivers aren't part of R)
#install.package("RODBC")
#help(package="RODBC")
}
#Importing data via stat/Transfer 
#Stat/Transfer (www.stattransfer.com) is a standalone application that can transfer data amount 34 data formats


#Annotating datasets - adding descriptive labels to variable names and value labels
#Eg variable age - more descriptive label-"Age at hospitalization (in years)

#Variable Labels
#name(patientdata)[2]<-Age at hospitalization (in years) <-instead of long name assign short names

#Value labels-factor function can be used
patientdata$gender<-factor(patientdata$gender, levels = c(1,2),labels = c("male","female"))

#Useful functions for working with data objects
#length() - give number of elements/components
#dim() - dimensions of an object
#str() - structure of an object
#class()-class of an object
#mode()-how an object is stored
#names()-names component in object
#c()-combines
#cbind()-combines objects as columns
#rbind()-combines object as rows
#object - print an object
#head/tail()#list first/last of an object
#Is()#list current object
#rm()#remove/delete objects
#newobject<-edit()#edit object and save it as newobject
#fix(object)#edit object in place




}




