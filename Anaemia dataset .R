#---Title---


rm(list = ls())
source("fun/libraries.R")


#---Read-data---
anaemiaB <- read.csv("data/anaemiaB.csv")
str(anaemiaB)
class(anaemiaB)


#---Processing-data---

str(anaemiaB)
anaemiaB$hb_diff <- anaemiaB$hb_post - anaemiaB$hb_pre
summary(anaemiaB)
summary(anaemiaB$hb_diff)
hist(anaemiaB$hb_diff)
anaemiaB$BMI <- anaemiaB$weight / anaemiaB$height^2
hist(anaemiaB$BMI)
summary(anaemiaB$BMI)
subset(anaemiaB, BMI > 100)
subset(anaemiaB, BMI < 1)
BMI_hist <- subset(anaemiaB, !id2 %in% c("AB18", "AB171"))$BMI
hist(BMI_hist)
anaemiaB$log_los_post <- log(anaemiaB$los_post)
View(anaemiaB[c("los_post", "log_los_post")])
summary(anaemiaB[c("los_post", "log_los_post")])
hist(anaemiaB$log_los_post)
anaemiaB$los_post2 <- exp(anaemiaB$log_los_post)
all.equal(anaemiaB$los_post, anaemiaB$los_post2)
summary(anaemiaB$operat)
anaemiaB$elective <- anaemiaB$operat == "Elective"
table(anaemiaB$operat, anaemiaB$elective, exclude = NULL)
anaemiaB$elective <- ifelse(anaemiaB$operat == "Elective", TRUE, FALSE)
anaemiaB$sex2 <- ifelse(anaemiaB$sex == "Female", 1,
                        ifelse(anaemiaB$sex %in% c("Male", "male"), 2, NA))
table(anaemiaB$sex2, useNA="ifany")
table(anaemiaB$sex, anaemiaB$sex2, useNA="ifany")
anaemiaB$long_post <- as.integer(anaemiaB$los_post > 20.5)
anaemiaB$long_post <- ifelse(anaemiaB$los_post > 20.5, 1, 0)
table(anaemiaB$long_post)
summary(anaemiaB$long_post)
anaemiaB$anaemia <- ifelse(anaemiaB$sex == "Female", anaemiaB$hb_pre < 120,
                           ifelse(anaemiaB$sex %in% c("Male", "male"), anaemiaB$hb_pre < 130, NA))
table(anaemiaB$sex, anaemiaB$anaemia, useNA="ifany")
anaemiaB$anaemia2 <- anaemiaB$sex == "Female" & anaemiaB$hb_pre < 120 | 
  anaemiaB$sex %in% c("Male", "male") & anaemiaB$hb_pre < 130
table(anaemiaB$sex, anaemiaB$anaemia2, useNA="ifany")
summary(anaemiaB)
table(anaemiaB$death)
summary(anaemiaB$height)
summary(anaemiaB$weight)
summary(anaemiaB$los)
summary(anaemiaB[c("sex", "operat", "death", "deathICU", "return", "hpt")])
levels(anaemiaB$sex)
levels(anaemiaB$operat)
levels(anaemiaB$death)
levels(anaemiaB$deathICU)
levels(anaemiaB$return)
levels(anaemiaB$hpt)
prop.table(table(anaemiaB$futime <= 10))
hist(anaemiaB$weight)
hist(anaemiaB$hb_pre)
los_check <- anaemiaB$los_pre + anaemiaB$los_post
table(anaemiaB$los == los_check, useNA="always")
table(is.na(anaemiaB$los))
subset(anaemiaB, los != los_check)
anaemiaB$los[anaemiaB$id2 == "AB204"] <- 8
anaemiaB[anaemiaB$sex == "Female", ]
subset(anaemiaB, sex == "Female")
weight_plausible <- anaemiaB$weight[anaemiaB$weight >= 20 & anaemiaB$weight <= 200]
hist(weight_plausible)
summary(weight_plausible)
height_plausible <- anaemiaB$height[anaemiaB$height <= 2.5 & !is.na(anaemiaB$height)]
hist(height_plausible)
summary(height_plausible)
table(anaemiaB$sex)
height_males <- anaemiaB$height[!is.na(anaemiaB$height) &
                                  anaemiaB$height <= 2.5 &
                                  anaemiaB$sex %in% c("Male", "male")]
hist(height_males)
summary(height_males)
mean(height_plausible)
sd(height_plausible)
return_males <- anaemiaB$return[anaemiaB$sex %in% c("Male", "male")]
prop.table(table(return_males, useNA="always"))
anaemiaB_men <- subset(anaemiaB, sex %in% c("male", "Male"))
table(anaemiaB_men$operat, anaemiaB_men$return, useNA = "ifany")
table(subset(anaemiaB, sex %in% c("male", "Male"), c(operat, return)), useNA = "ifany")
anaemiaB$height[anaemiaB$height == 9] <- NA
summary(anaemiaB$height)
summary(anaemiaB$weight)
anaemiaB$weight[anaemiaB$weight == 999] <- NA
summary(anaemiaB$weight)
summary(anaemiaB[c("weight", "height", "los")])
anaemiaB$sex[anaemiaB$sex == "male"] <- "Male"
anaemiaB$sex[anaemiaB$sex == ""] <- NA
table(anaemiaB$sex)
anaemiaB$sex <- factor(anaemiaB$sex, c("Female", "Male"))
table(anaemiaB$sex)
table(anaemiaB$sex, useNA = "always")
names(anaemiaB)
anaemiaB$log_los_post <- NULL
anaemiaB$log_post2 <- NULL
anaemiaB$elective <- NULL
anaemiaB$long_post <- NULL
anaemiaB$anaemia2 <- NULL
names(anaemiaB)
summary(anaemiaB$BMI)
hist(anaemiaB$hb_pre, main = "Pre-operation haemoglobin levels")
summary(anaemiaB$hb_pre)
t.test(anaemiaB$hb_pre)
death_table <- table(anaemiaB$death) 
print(death_table)
n_alive <- death_table[1]
n_died <- death_table[2]
n <- n_alive + n_died
prop.test(n_died, n, conf.level=0.95)
?na.rm
female_hb_pre <- anaemiaB[anaemiaB$sex == "Female", "hb_pre"]
male_hb_pre <- anaemiaB[anaemiaB$sex == "Male", "hb_pre"]
par(mfrow=c(1,1))
hist(female_hb_pre, xlim=c(70, 200), main= "Pre-operation haemoglobin levels in women")
hist(male_hb_pre, xlim=c(70, 200), main= "Pre-operation haemoglobin levels in men")
t.test(x=female_hb_pre, y=male_hb_pre, var.equal = TRUE)
t.test(anaemiaB$hb_pre[anaemiaB$death == "alive"],
       anaemiaB$hb_pre[anaemiaB$death == "died"],
       var.equal = TRUE)
anaemia <- anaemiaB[!is.na(anaemiaB$hb_pre) & !is.na(anaemiaB$hb_post), ]
plot(anaemia$hb_post, anaemia$hb_pre)
lines(lowess(anaemia$hb_post, anaemia$hb_pre), col=2)
cor(anaemia$hb_pre, anaemia$hb_post)
cor(anaemia[,c('hb_pre', 'hb_post', 'BMI')])
cor(anaemia[,c('hb_pre', 'hb_post', 'BMI')], use = "complete.obs")
cor.test(anaemia$hb_pre, anaemia$BMI)
plot(anaemia$hb_pre, anaemia$BMI)
hist(anaemia$hb_pre)
plot(anaemia$hb_pre, anaemia$hb_post)
fit <- lm(hb_post ~ hb_pre, anaemia)
summary(fit)
confint(fit)
fitval1 <- predict(fit)
newdf <- data.frame(hb_pre = seq(80, 180, 1))
newdf$pred <- predict(fit, newdata = newdf)
plot(anaemia$hb_pre, anaemia$hb_post, col = "grey")
lines(newdf$hb_pre, newdf$pred, col = 2, lwd = 2)
plot(anaemia$hb_pre, anaemia$hb_post, col = "grey")
abline(fit, col = 3, lwd = 2)