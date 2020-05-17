if(FALSE){
  #Creating the leadership data frame
  manager<-c(1,2,3,4,5)
  date<-c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
  country<-c("us","us","uk","uk","uk")
  gender<-c("M","F","F","M","F")
  age<-c(32,45,25,39,99)
  q1<-c(5,3,3,3,2)
  q2<-c(4,5,5,3,2)
  q3<-c(5,2,5,4,1)
  q4<-c(5,5,5,NA,2)
  q5<-c(5,5,2,NA,1)
  leadership<-data.frame(manager,date,country,gender,age,q1,q2,q3,q4,q5, stringsAsFactors = FALSE)
  leadership
  
  #Arithmetic operators
  #+ Addition, - Subtraction, * Multiplication, / Division, ^ or ** Exponentiation, 
  #x%%y Modulus(x and y):for example,5%%2 is 1. x%/%y integer division:for example, 5%/%2 is 2.
  
  #Creating new variables
  mydata<-data.frame(x1=c(2,2,6,4),
                     x2=c(3,4,2,8))
  mydata$sumx <-mydata$x1 + mydata$x2
  mydata$meanx<-(mydata$x1+mydata$x2)/2
  
  attach(mydata)
  mydata$sumx <- x1+x2
  mydata$meanx<-(x1+x2)/2
  detach(mydata)
  
  mydata<-transform(mydata, sumx=x1+x2,meanx=(x1+x2)/2) #Preferred
  
  #Recoding the variables
  
  #Logical Operators expressions that return True or False
  
  #< Less than,<= Less than or equal to,> Greater than, >= Greater than or equal to,
  #== Exactly equal to, != Not equal to, !x Not x, x|y x or y, x & y x and y, isTRuE(x) Tests whether x is TRue
  
  #From continous variable age to the categorical variable agecat(Young,Middle Aged,Elder)
  leadership$age[leadership$age == 99] <- NA #First record the value 99 is missing
  
  leadership$agecat[leadership$age > 75] <- "Elder"
  leadership$agecat[leadership$age >= 55 &
                    leadership$age<=75] <- "Middle Aged"
  leadership$agecat[leadership$age < 55] <- "Young"
  
  #Can also be written
  leadership<-within(leadership,{
    agecat<-NA
    agecat[age>75]    <-"Elder"
    agecat[age>=55 & agecat<=75] <-"Middle Aged"
    agecat[age<55] <-"Young"
  })
  
  #several package offer useful funtions car package's recode(), package doBy offer recodeVar()
  #cut() divide the range of a numeric variable into intervals, returning a factor.
  
  #Renaming variables
  
  #Let say you want to change the variable to manager to managerID
  #invoke an interactive editor:
  fix(leadership)
  
  #renaming using program
  name(leadership)
  names(leadership) [2]<-"testDate"
  leadership
  
  names(leadership)[6:10]<-c("item1","item2","item3","item4","item5") #replace q1,q2...
  
  #install.package("plyr")
  library(plyr)
  leadership<-rename(leadership,c(manager="managerID",data="testDate"))
  
  #Missing value
  #Funtion is.na() allows you to test for the presense of missing values.
  y<-c(1,2,3,NA)
  is.na(y)
  #Returns(False,False,False,True)
  >is.na(leadership[,6:10])
  #Impossible value like 5/0 represented by the symbol NaN (not a number)
  #To identify these values, you need to use is.infinite() or is.nan().
  
  #Excluding missing values from  analyses
  
  x<-c(1,2,NA,3)
  y<-sum(x,na.rm = TRUE) #remove missing value prior to calculation
  
  newdata<-na.omit(leadership) #remove complete row which has missing value
  newdata
  
  #Deleting all observation with missing data (called listwise deletion)
  
  #Data values
  #Funtion as.Data() used to make the translation
  #as.Data(x,"input_format")
  
  # %d Day as a number (0-31)   eg 01-31
  # %a Abbreviated weekday      eg Mon
  # %A Unabbreviated weekday    eg Monday
  # %m Month (00-12)            eg 00-12
  # %b Abbreviated month        eg Jan
  # %B Unabbreviated month      eg January
  # %y Two-digit year           eg 07
  # %Y Four-digit year          eg 2007
  
  
  strdata<-c("01/05/1965","08/16/1975")
  dates<-as.Date(strDates,"%m/%d/%Y")
  
  #Leadership dataset
  myformat<-"%m/%d/%y"
  leadership$date<-as.Date(leadership$date,myformat)
  
  #Time-stamping data
  Sys.Date()#returns todays date
  date()#returns date and time
  
  #Format
  today<-Sys.Date()
  format(today,format="%B %d %Y") 
  format(today,format="%A")
  
  #Arithmetic operations
  startdate<-as.Date("2004-02-13")
  enddate<-as.Date("2011-01-22")
  days<-enddate-startdate
  days
  
  #Also use difftime() to calculate second,minutes,hours,days or weeks
  today<-Sys.Date()
  bob<-as.Date("1956-10-12")
  difftime(today,bob,units="weeks")
  
  #Converting dates to character variables
  strdates<-as.character(dates) 
  #allows to apply character functions(subsetting,replacement,concatenation and so on)
  
  #Going Further
  #to know more about converting character data to dates look at help(as.Date) and help(strf.time)
  #Formatting dates and times help(ISOdate-time)
  # lubridate package contain number of funtions that simplify working with dates
  # timedate package help in complex calculations
  
  #Type conversions functions
  
  is.numeric()     as.numeric()
  is.character()   as.character()  
  is.vector()      as.vector()
  is.metrix()      as.metrix()
  is.data.frame()  as.data.frame()
  is.factor()      as.factor()
  is.logical()     as.logical()
  
  #Converting from one data type to another
  a <-c(1,2,3)
  a # [1 2 3]
  is.numeric(a) # True
  is.vector(a) #True
  a<-as.character(a)
  a                    # "1" "2" "3"
  
  as.datatype() #specific type (character or numeric, matrix or data frame)
  
  #Sorting Data
  order() #sort data
  
  #Eg
  attach(leadership)
  newdata<-leadership[order(gender,-age),] #row into female followed by male. Youngest to oldest
  detach(leadership)
  
  
  #Merging datasets
  #to merge two dataframe (datasets) horizontally you use the merge()
  #In most case dataframe are joined by one or more common key variables(that is an inner join)
  total<-merge(dataframA,dataframB,by=c("ID","Country"))
  
  #If you are concatenating two matrics or dataframes horizontally and don't need to specify a common key,
  #you can use the cbind()
  total<-cbind(A,B)
  
  #Adding rows to dataframe
  #Joining two data frames vertically 
  total<-rbind(data.frameA,data.frameB) #if one variable is extra in one df then delete it or add NA to other df 
  
  #Subsetting datasets
  #selecting (keeping) variables
  myvars<-paste("q",1:5,sep="") #past() create same character vector
  newdata<-leadership[myvars]
  
  
  #Excluding (dropping) variables #if varable has missing values you may have to drop it.
  #Exclude q3 and q4 with these statements
  
  myvars<-names(leadership) %in% c("q3","q4")
  newdata<-leadership[!myvars]
  
  #why it works
  #1 names(leadership) produces a character vector containing the variable names
  #2 names(leadership) %in% c("q3","q4") returns a logical vector with TRue for each element in 
  # name(leadership) that matches q3 or q4 and FALSE otherwise
  #3 Not(!) operator reverses the logical values
  #4 Selects columns with True logical values, so q3 and q4 are excluded.
  #Knowing that q3 and q4 are the eighth and ninth variables you can exclude them with 
  newdata<-leadership[c(-8,-9)]
  #same can be accomplised via
  leadership$q3 <-leadership$q4 <- Null
  #here you can set columns q3 and q4 to undefined (Null). Note that NUll is't the same as NA(missing)  
  
  #Selecting observations
  #selecting or excluding observations (rows) is typically a key aspect of successful data perparation and 
  #analysis.
  newdata<-leadership[1:3,]
  newdata<-leadership[leadership$gender=="M"&leadership$age > 30,] #selects all men over 30
  
  attach(leadership)  #uses attach() so you don't have to prepare variable names with data-frame names
  newdata<-leadership[gender=="M" & age > 30,]
  detach(leadership)
  
  #The subset()
  newdata<-subset(leadership,age>=35|age<24,select=c(q1,q2,q3,q4)) 
  #Selects all rows that have value of age greater than or equal to 35 or less than 24.
  #Keeps variables q1 through q4
  
  newdata<-subset(leadership,gender=="M"& age>25,select=gender:q4)
  #selects all men over the age of 25, and keeps variables gender through q4(gender, q4, and all columns between them)
  
  #Random Samples
  #The sample() functions enables you to take a random sample
  mysample<-leadership[sample(1:nrow(leadership),3,replace = FALSE),]
  #R has extensive facilities for sampling, including drawing and calibrating survey sample (see sampling package)
  #And analyzing complex survey data (survey package)
  
  
  #Using sql statements to manipulate data frames
  install.packages("sqldf")
  library(sqldf)
  newdf<-sqldf("select * from mtcars where carb=1 order by  mpg",row.names=TRUE)
  newdf 
  #selects all variable (columns) from data frame mtcars, keeps only automobiles(rows) with one carburetor (carb),
  #sorts in ascending order by mpg, and saves the results as the data frame newdf. The option row.names= True carries
  #the row names from the original data frame over to the new one.
  sqldf("select avg(mpg) as avg_mpg,avg(disp) as avg_disp,gear from mtcars where cyl in (4,6) group by gear " )
  #prints the mean mpg and disp within each level of gear for automobiles with four or six cylinders(cyl)
  
  
  
  }

