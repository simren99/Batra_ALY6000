print("Simren Batra")
help.start()
install.packages("vcd")
help(package="vcd")
library(vcd)
Sales_Data <- c(7,11,15,20,19,11,18,10,6,22)
Temp_Data <- c(69,81,77,84,80,97,87,70,65,90)
mean(Temp_Data)
sd(Temp_Data)
cor(Sales_Data,Temp_Data)
plot(Sales_Data,Temp_Data)
indices <- c(3)
Sales_data <- Sales_Data[-indices]
print(Sales_data)
Sales_data <- c(Sales_data[1:2], 16, Sales_data[3:length(Sales_data)])
print(Sales_data)
names <- c("Tom","Dick","Harry")
y <- matrix(1:10, nrow=5, ncol=2)
y
icSales <- data.frame(Sales_data, Temp_Data)
icSales
with(icSales,{
  summary(Sales_data,Temp_Data)
  plot(Sales_data,Temp_Data)
})
with(icSales,{
  stats <- summary(Sales_data)
  stats
})
with(icSales,{
  stats <- summary(Temp_Data)
  stats
})
getwd()
student <- read.csv("Student.csv")
colnames(student)