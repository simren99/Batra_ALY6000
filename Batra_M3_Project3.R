##1 Print your name at the top of the script and load these libraries: FSA, FSAdata, magrittr,dplyr, tidyr plyr and tidyverse

print("Simren Batra")
install.packages("FSA")
install.packages("FSAdata")
install.packages("magrittr")
install.packages("dplyr")
install.packages("tidyr")
install.packages("plyr")
install.packages("tidyverse")
library(FSA)
library(FSAdata)
library(magrittr)
library(dplyr)
library(tidyr)
library(plyr)
library(tidyverse)
##2. Import the inchBio.csv and name the table <bio> 

bio <- read.csv("inchBio.csv")
bio
##3. Display the head, tail and structure of <bio>

head(bio)
tail(bio)
structure(bio)
str(bio)
##4. Create an object, <counts>, that counts and lists all the species records

counts <- count(bio, "species")
counts
##5. Display just the 8 levels (names) of the species

class(bio$species)
levels(bio$species)
##6. Create a <tmp> object that displays the different species and the number of record of each species in the dataset. Include this information in your report.-

tmp <- counts
tmp
##7. Create a subset, <tmp2>, of just the species variable and display the first five records

tmp2 <- subset(bio,select = species)
head(tmp2,5)
##8. Create a table, <w>, of the species variable. Display the class of w

w <- table(bio$species)
w
class(w)
##9. Convert <w> to a data frame named <t> and display the results

t <- as.data.frame(w)
class(t)
##10. Extract and display the frequency values from the <t> data frame

t$Freq
##11. Create a table named <cSpec> from the bio species attribute (variable) and confirm that you created a table which displays the number of species in the dataset <bio>

cSpec <- table(bio$species)
cSpec
class(cSpec)
##12. Create a table named <cSpecPct> that displays the species and percentage of records for each species. Confirm you created a table class.

cSpecPct <- round(prop.table(cSpec),digits = 3)
cSpecPct
class(cSpecPct)
##13. Convert the table, <cSpecPct>, to a data frame named <u> and confirm that <u> is a data frame

u <- as.data.frame(cSpecPct)
class(u)
##14 barplot

barplot(cSpec,main="Fish Count",ylab="Species",xlab="COUNTS",col="lightgreen",horiz=T,las=1,cex.axis=0.6,cex.names = 0.6)
##15 barplot

barplot(cSpecPct,main="FishRelativeFrequency",xlab="Species",ylab="COUNTS",ylim=c(0.0,0.4),col="lightblue",las=2)
##16.Rearranging the <u> cSpec Pct data frame in descending order of relative frequency. 

d<- u %>% arrange(desc(Freq))
d
class(d)
##17.Rename the <d> columns Var 1 to Species, and Freq to RelFreq

names(d)[names(d) == 'Var1'] <- "Species"
names(d)[names(d) == 'Freq'] <- "RelFreq"
##18. Add new variables to <d> and call them cumfreq, counts, and cumcounts

d <- transform(d, cumfreq = cumsum(RelFreq))
d
Dcount <- as.data.frame(t[order(-t$Freq),])
d <- transform(d, count=Dcount$Freq)
d
d <- transform(d, cumcounts=cumsum(count))
d
##19. Create a parameter variable <def_par> to store parameter variables
def_par <- par(mar = c(10,5,5,8))
##20 barplot

pc <-barplot(d$count, width = 1, space = 0.15,
             border = NA, axes = F,
             ylim = c(0, 3.05 * max(d$count, na.rm = TRUE)),
             ylab = 'Cumulative Counts',
             cex.axis = 1.7,
             names.arg = d$Species,
             main = 'Species Pareto',
             las = 2
)
##21. Add a cumulative counts line to the <pc> plot with the following:
lines(pc, d$cumcounts, type = 'b', pch = 19, col = 'cyan4')
##22. Place a grey box around the pareto plot 

box(col = 'grey62')
##23. Add a left side axis with the following specifications

axis(side = 2, at = c(0, d$cumcounts), tick = TRUE ,line = NA,
     col.ticks = "grey62",col = "grey62", cex.axis=0.8, las=2 )
##24. Add axis details on right side of box with the specifications:

axis(side = 4, at = c(0, d$cumcounts), col = "cyan", cex.axis = 0.8, las = 2,
     tick = TRUE, line = NA,
     col.axis = "cyan4", labels = paste0(round( c(0,d$cumfreq) * 100,digits = 0),
                                         '%'))
##25. Display the finished Species Pareto Plot (without the star watermarks). Have your last name on the plot

pc <-barplot(d$count, width = 1, space = 0.15,
             border = NA, axes = F,
             ylim = c(0, 3.05 * max(d$count, na.rm = TRUE)),
             ylab = 'Cumulative Counts',
             cex.axis = 1.7,
             names.arg = d$Species,
             main = 'Batra',
             las = 2
)
