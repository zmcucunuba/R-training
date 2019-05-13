#---Title---

#This is my branch script

rm(list = ls())
source("fun/libraries.R")


#---Read-data---
dat <- read_excel("data/Sample - Superstore.xls")
str(dat)
class(dat)


#---Processing-data---
object1 <- dat$City
object2 <- unique(object1)
object3 <- unique(dat$City)
object4 <- unique(dat$City[1:10])
str(dat)
object5 <- unique(dat$Sales)
object6 <- (dat$Sales)
object7 <- (dat$Quantity)

#---Plotting-results---
hist(object5)
plot(object6 , object7)
plot(dat$Sales , dat$Quantity)
mean(dat$Sales)
sum(dat$Sales)


