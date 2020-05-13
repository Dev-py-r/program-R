if(FALSE){
  attach(mtcars)#attach dataframe
  plot(wt,mpg)#generate scatter plot
  abline(lm(mpg~wt))#add best fit line to linear regression
  title("Regression of MPG on Weight")#add title
  detach(mtcars)#detach data frame
  
  #Save graph as PDF
  
  pdf("mygraph.pdf")             
  attach(mtcars)#attach dataframe
  plot(wt,mpg)#generate scatter plot
  abline(lm(mpg~wt))#add best fit line to linear regression
  title("Regression of MPG on Weight")#add title
  detach(mtcars)#detach data frame
  dev.off()
  
  #Create more than one graph and still have access to each
  #plot(),hist(),boxplot()
  dev.new()
  #statement to creat a graph 1
  dev.new()                     #open a new graph window before creating  a new graph
  #statement to creat a graph 2
  etc
  
  #can use functions like dev.new(),dev.next(),dev.prev(),dev.set() and dev.off() #help(dev.cur) for details
  
  dose<-c(20,30,40,45,60)
  drugA<-c(16,20,27,40,60)
  drugB<-c(15,18,25,31,40)
  
  plot(dose,drugA,type="b") #plot(x,y,type=b) # x on horizontal (_) y on vertical access (|)
  
  #Graphical parameters
  par()#produces list of graphical settings
  no.readonly=TRUE #produces a list of current graphical settings that can be modified. 
  
  Opar<-par(no.readonly=TRUE) #copy of current statement
  par(lty=2,pch=17)#change default line to dash and the default symbol for plotting points to solid triangle
  plot(does,drugA,type = "b")
  par(Opar)
  
  plot(does,drugA,type="b",lty=2,pch=17) #Other type to plot
  
  #(col=)specify border (bg=) fill colors
  
  #plot(dose,drugA,type="b",lty=3,pch=15,lwd=4,cex=2)
  #col=c("red","blue")
  #col.axis color for axis text
  #col.lab color for axis labels.
  #col.main color for titles
  #col.sub color for subtitles
  #fg color for plot's foreground
  #bg color for the plot's background
  
  #col=1,col="white",col="FFF" col=rgb(1,1,1) and col=hsv(0,0,1) hsv (hue-saturation-values)
  #rainbow(),heat.colors(),...help(colors) for more
  #rainbow(10) produces 10 contiguous "rainbow" color
  #install.package("RColorBrewer") #famous for creating attractive color palettes
  liabrary(RColorBrewer)
  n<-7
  mycolors<-brewer.pal(n,"set1")
  barplot(rep(1,n),col = mycolors)
  
  #Text Characteristics 
  #Parameters specifying text size
  #Parameters specifying font family,size and style 
  #eg: par(font.lab=3,cex.lab=1.5,font.main=4,cex.main=2)
  
  windowsFonts(
    A=windowFont("Arial Black"),
    B=windowFont("Bookman Old style"),
    C=windowsFont("Comic Sans MS")
  )
    #on mac use quartzFonts()
  #use names(pdfFonts()) to find out fonts available
  #pdf(file="myplot.pdf",family="fontname") to check font available in system
  #name(post-scriptFonts()) and postscript(file="myplot.ps",family="fontname") graphs that are output in PostScript format
  #parameters for graph and margin dimenstion
  #par(pin=c(4,3),mai=c(1,.5,1,.2))
  
  #using graphical parameters to control graph appearance 
  
  dose <-c(20,30,40,45,60)
  drugA<-c(16,20,27,40,60)
  drugB<-c(15,18,25,31,40)
  Opar<-par(no.readonly=TRUE)
  par(pin=c(2,3))
  par(lwd=2,cex=1.5)
  par(cex.axis=.75,font.axis=3)
  plot(dose,drugA,type = "b",pch=19,lty=2,col="red")
  plot(dose,drugB,type = "b",pch=23,lty=6,col="blue",bg="green")
  par(Opar)
  
  #Adding text, customized axes, and legends
  #title(main),subtitle(sub),axis labels(xlab,ylab) and axis ranges(xlim,ylim)
  plot(dose, drugA, type="b",
       col="red", lty=2,pch=2,lwd=2,
       main="Clinical Trials for Drugs A",
       sub="This is hypothetical data",
       xlab = "Dosage",ylab = "Drug Response",
       xlim=c(0,60),tlim=c(0,70))  
  
  #remove default titles and labels by adding ann=False in the plot() statment or in a par()
  #Title funtion to add a title and axis labels to a plot.
  title(main = "My Title", col.main="red",
        sub = "My subtitle", col.sub="blue",
        xlab = "My X label", ylab="My Y label",
        col.lab="green", cex.lab=0.75)
  #Axes
  #eg
  x<-c(1:10)
  y<-x
  z<-10/x
  Opar<-par(no.readonly=TRUE)   #specifies data
  
  par(mar=c(5,4,4,8)+0.1) #increases margins
  plot(x,y, type = "b",
       pch=21,col="red",
       yaxt="n",lty=3,ann = FALSE)  #plots x vs y, suppressing annotations
  
  lines(x,z,type = "b",pch=22,col="blue",lty=2) #Adds an x versus l/x line
  
  axis(2, at=x, labels = x,col.axis="red",las=2)
                                                          #Draw the axes
  axis(4, at=z, labels = round(z, digits=2),
       col.axis="blue",las=2,cex.axis=0.7,tck=-.01)
  
  mtext("y=1/x",side=4,line=3,cex.lab=1,las=2,col="blue")
  
  title("An Example of Creative Axes",                     #Adds titles and text
        xlab = "X values",
        ylab = "Y=X")
  par(Opar)
  
  #by line() you can add new graph element to an existing graph
  #mtext() is used to add text to the margins of the plot.
  
  #To creat minor tick mark you need the minor.tick() funtion add using
  library(Hmisc)
  minor.tick(nx=n,ny=n,tick.ratio=n)#nx and ny specify the number of intervals into which to divide the area
  #between major tick marks on the x-axis and y-axis, respectively. 
  #tick.ratio is the size of the minor tick mark relative to major tick mark
  #The current length of the major tick mark can be retrieved using par("tck")
  #minor.tick (nx=2,ny=3, tick.ratio=0.5)
  
  #Reference lines
  #The abline() function is used to add reference lines to a graph.
  #Format abline(h=yvalues,v=xvalues)
  #line type, color and width can also be specified abline(h=c(1,5,7))
  #adds solid horizontal line at y=1,5 and  7, whereas the code
  #abline(v=seq(1,10,2),lty=2,col="blue")
  #add dashed blue vertical lines at x = 1,3,5,7 and 9
  
  #Legend
  legend("topleft",inset = .05,title = "Drug Type", c("A","B"),
         lty = c(1,2),pch=c(15,17),col = c("red","blue"))
  
  #Text annotations
  #added using text() and mtext()
  opar<-par(no.readonly = TRUE)
  par(cex=1.5)
  plot(1:7,1:7,type = "n")
  text(3,3,"Example of default text")
  text(4,4, family="mono","Example of mono-spaced text")
  text(5,5, family="serif","Example of serif text")
  par(opar)
  
  
  #Math annotations
  help("plotmath")
  demo(plotmath)
  
  #Combination graphs
  #can use mfrow=c(nrows,ncols) to be filled by rows
  #can use mfcol=c(nrows,ncols) to be filled by cols
  
  
attach(mtcars)
opar<-par(no.readonly = TRUE)
par(mfrow=c(2,2))
plot(wt,mpg, main = "Scatterplot of wt vs. mpg")
plot(wt,disp,main = "Scatterplot of wt vs. disp")
hist(wt,main="Histogram of wt")
boxplot(wt,main="Boxplot of wt")
par(opar)
detach(mtcars)
  
#Layout 
attach(mtcars)
layout(matrix(c(l,1,2,3),2,2,byrow = TRUE),widths = c(3,1),heights = c(1,2))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)
 
help("layout")

#Fine control over the placement of he figures using fig funtion
opar<-par(no.readonly = TRUE)
par(fig=c(0,0.8,0,0.8))
plot(mtcars$wt,mtcars$mpg,
     xlab = "Miles per Gallon",
     ylab = "Car Weight")
par(fig=c(0,0.8,0.55,1),new=TRUE)
boxplot(mtcars$wt,horizontal = TRUE, axes= Flase)
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mtcars$mpg,axes=FALSE)
mtext("Enhanced Scatterplot",side=3,outer=TRUE,line=3)
par(opar)



}


