# find your working directory 
getwd()
# change working directory
setwd("") 
# check 
getwd()

# using R as calculator

1 + 100
100 - 10
10 * 10
500 / 5
3 + 5 * 2

# change the order of operations using brackets 

(3 + 5) * 2

sin(1)
log(1)
log10(10)

# find more information about a function

?sin()

# comparisons

1 == 1 # 1 is equal to 1
1 != 2 # 1 is not equal to 2
1 < 2 
1 > 3

# variable assignment in R
x <- 1/40
100 + x
2 * x
log(x)

# if you change your mind and want to assign a diff value to x
x <- 100
x <- x + 1 # immediately updated in your environment 
y <- x * 2

# variable names cannot start with a number or contain spaces
period.between.words <- 1 + 1
underscore_words <- 2 * 8
lowercaseUppercaseletters <- 5 * 2

# hidden variable
.mass <- 10 + 10 # not shown in the environment

# vectorisation
1:5 # numbers 1 to 5
2^(1:5) # raise all these numbers to the power of 2
 x <- 1:5 # assign numbers 1 to 5 to value x
2^x # square x values 

# to see what variables or functions you have in your environment
ls()

# to also show hidden variables
ls(all.names = TRUE)

# to remove the variable
rm(x) # disappears from environment

# R packages 

# Challenge 2

mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20

# Challenge 3

mass > age # TRUE

# Challenge 4

rm(mass)
rm(age)

# install package
install.packages("rlang")
install.packages("ggplot2")

# mak a package available
library(ggplot2)

install.packages("gapminder")

library(gapminder)

install.packages("tidyverse")

library(tidyverse)

# Episode 3: Getting Help
?function_name
help(function_name)
?hist
# use quotes for special operators 
?"<-"

# all the documentation that exists for that package
vignette()
vignette(package="ggplot2")
# to see more details:
vignette("ggplot2-specs")

# in R there are 5 data types: double, integer, complex, logical

# create a double 
dbl <- c(1.5, 2.5, 4, 5)
# check what type of variable you have created
typeof(dbl) # double

int <- c(1L, 6L, 10L)
typeof(int) # integer

typeof(1+1i) # complex

typeof(TRUE) # logical

# Challenge 1
?c
one <- c(1,2,3)
two <- c("d","e","f")
three <- c(1, 2, "f")
typeof(one) # double
typeof(two) # character
typeof(three) # numbers forced to be a character 

# Challenge 2
?paste

# Lists 
# can accept different types of data
list_example <- list(1, "a", TRUE, 1+4i) 
# check details of your list- what type of data 
str(list_example)
list_example # see the diff elements inside your list

another_list <- list(title="numbers", numbers= 1:10, data=TRUE)
another_list
str(another_list)

# List subsetting 
xlist <- list(a="software carpentry", b=1:10, data=head(iris))
str(xlist)

# extract specific elements of your list
xlist[1] # extract software carpentary, which is first element of list

xlist[1:2] # get first two elements from your list 

# another way to extract elements is by using the names
xlist["a"]
# or
xlist$a
xlist$data

# to extract more specific elements 

# Challenge 1

x <- 1:26
x * 2
names (x) <- LETTERS

# Episode 4

cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0, 3.2), 
                   like_string = c(1, 0, 1))
getwd()
write.csv(cats, file = "/Users/Titilayo/Desktop/R Training/feline-data.csv")

# read your tables into R
cats <- read.csv(file = "feline-data.csv")

read.table()  # does a similar thing 
read.table(file = "feline-data.csv", sep = ",")

View(cats)
cats$coat
cats$weight * 2
paste("My cat is", cats$coat)

# to make sure columns with strings are not converted into factors
# so when you are reading your file you do:
cats <- read.csv(file = "feline-data.csv", stringsAsFactors = FALSE)
typeof(cats$coat)

my_vector <- vector(length = 3)
another_vector <- vector(mode = "character", length = 3)

vector <- c(2, 6, "a")
typeof(vector)
vector <- c("a", TRUE)
typeof(vector)
vector <- c(1, TRUE)
typeof(vector)

vector <- c(1)
typeof(vector) # double

# to change to integer
vector <- as.integer(1)
typeof(vector)

vector <- as.logical(c(1, 0))
typeof(vector)

2:10
seq(from=1, to =120, by = 3) # by is the step size

sequence <- seq(10) # sequence from 1 to 10
head(sequence, n = 2) # look at first two of sequence
tail(sequence, n = 2) # look at the last two of the sequence
head(cats, n = 1) # all the top values 

length(sequence) # how long is the sequence
length(cats) # 3

# length is normally just applied to single dimension objects

my_example <- 5:8
str(my_example)

# give names to your element
names(my_example) <- c("a", "b", "c", "d")
names(my_example)

# Challenge 1

vector <- sequence(26) # or you could use colon 1:26
vector * 2
names(vector) <- LETTERS 
names(vector)
vector

# names(vector) <- LETTERS[-1] to remove first value [-26] to remove last

# Data-Frames

class(cats) # says its a data frame
str(cats) 

# Challenge 2

cats <- read.csv(file = "feline-data.csv", stringsAsFactors = FALSE)
#second way of doing this
cats <- read.csv(file = "feline-data.csv", colClasses = c(NA, NA, "character"))

# with NA it just means you want R to use its default option
# but you want the last column to be a character 
# so if you do str(cats) it will show you that its a character not integer

my_factor <- factor(c("calico", "black", "black", "white"))
my_factor # shows you have three unique levels

# if you want to specify the order of the levels
my_factor <- factor(c("calico", "black", "black", "white"),
                    levels = c("white", "black", "calico"))

# you could label your variables value from the beginning 

## lists 
list_example <- list(1, "a", TRUE, 1+4i)

# create lists with specific names within the list
another_list <- list(title = "Numbers", numbers = 1:10, data = TRUE)  

names(list_example)
names(another_list)

# when you give names to variables inside a function..
# you must use an equal sign to assign anything, not <- 

another_list$title
another_list$numbers

# Challenge 3

cats[2]
cats[[2]]
cats$coat
cats["coat"]
cats[2, 2]
cats[, 2]
cats[2, ]

## matrix 
matrix_example <- matrix(0, ncol = 6, nrow = 3)
View(matrix_example)

class(matrix_example) #matrix
typeof(matrix_example) #double 

length(matrix_example) #18= number of cells 

# matrix has to have a single type in all columns
# data frames can have different types in different columns

ncol(matrix_example) # number of columns
nrow(matrix_example) # number of rows

### Episode 5: Exploring Data Frames

# to add new data but not create a new data frame
# e.g. to an already created table

age <- c(2, 3, 5)
cbind(cats, age) # binds new column to your dataframe

# new column will be added to the far right of your table

age <- c(2, 3, 5, 12)

nrow(cats)                   

# add new row
new_row <- c("fluffy", 3.1, TRUE, 0.5) # new row representing new cat

rbind(cats, new_row)

View(cats)
cats[, -1]
View(cats)

## remove rows
small_cats <- cats [-1, ]
cats[c(1,2), c(1,3)]
cats[1:2,]
cats[c(1,3),]

new_col <- c("cute", "naught", NA)
View(cats)
na.omit
na.omit(cats)

## bind mulitple dataframes into one
big_cats <- rbind(cats, cats)
view(big_cats)

# Challenge 2
df <- data.frame(id = c("first name", "last name", "lucky number"))

### Episode 7: Control Flow

library(gapminder)
gapminder <- gapminder

# if (condition) { 
#  perform operatoin
# }

# if (condition) {
# perform operation no1
# else {perfor, perform opoeration no2
# }

x <- 8

if (x >= 10) {
  print ("x is equal or bigger than 10")
}
if (TRUE) {
  print("x is equal or bigger than 10")
}

## multiple outcomes
x <- 8
if (x >= 10) {
  print("x is equal or bigger than 10")
} else if (x> 5) {
    print("x is smaller than 10 but bigger than 5")
}   else { 
      print("x is smaller than 5")}

# Challenge 1

gapminder[(gapminder$year == 2002),]

rows2002 <- gapminder[which(gapminder$year == 2002),]
nrow(rows2002)

if (nrow(rows2002) >= 1) {
  print("dataframe contains entries for year 2002")
}
2002 %in% gapminder$year # check if a value is present or not
1000 %in% gapminder$year #FALSE

if (all(gapminder$year > 1000)) {
  print("dataframe entries are all in 2nd millenia")
} 

if (any(gapminder$year > 1000)) {
  print("dataframe contains entries that are all in 2nd millenia")
} #any means it contains it but might not be all

## repeating operations
#for loops 

# for (iterator in values) {
#  do a thing
# }

for (i in 1:10) {
  print(i)
}

for (y in 1:10) {
  print(y)
}

## nested loop
for (i in 1:5) {
  for (j in c("a", "b", "c", "d", "e")) {
    print(paste(i,j))
  }
}

output_vector <- c()
for (i in 1:5) {
  for (j in c("a", "b", "c", "d", "e")) {
    temp_output <- paste(i, j)
    output_vector <- c(output_vector , temp_output)
  }
}
output_vector

output_matrix <- matrix(nrow = 5, ncol = 5)
j_vector <- c("a", "b", "c", "d", "e")
for (i in 1:5)
  for (j in 1:5) {
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i, j] <- temp_output
  }
output_matrix
output_vector
output_vector2 <- as.vector(output_matrix)
output_vector2

# Challenge 3
for (icontinent in unique(gapminder$continent)) {
  tmp <- gapminder[which(gapminder$continent == icontinent), ]
  cat(icontinent, mean(tmp$lifeExp), "\n") # "\n" lets you separate results in to new lines
}


### Functions

function_name <- function(input) {
  operations
  return(output)
} # in curly brackets define operation you want this function to perform

fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin(temp = 200)

kelvin_to_celsius <- function(temp) {
  celsius <- ((temp - 273.15))
  return(celsius)
}
kelvin_to_celsius(temp=400)

result <- kelvin_to_celsius(temp = 200)
result

### ggplot 

library(ggplot2)

gapminder <- gapminder

str(gapminder)

dim(gapminder) # dimensions: number of rows and columns

colnames(gapminder) # names of the columns in the data 

# graph
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) # first layer

# with each new layer you add a + 
# scatter plot 
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

## Challenge 1
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + 
  geom_point()

# colour 
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, colour = continent)) +
  geom_point()

# line 
ggplot(data = gapminder, mapping = aes(x= year, y = lifeExp, by = country, colour = continent)) +
  geom_line() 

# add new layers: line and points
ggplot(data = gapminder, mapping = aes(x= year, y = lifeExp, by = country, colour = continent)) +
  geom_line() +
  geom_point()

ggplot(data = gapminder, mapping = aes(x= year, y = lifeExp, by = country, colour = continent)) +
  geom_point() +
  geom_line()

# change colour of points only
ggplot(data = gapminder, mapping = aes(x= year, y = lifeExp, by = country)) +
  geom_line(mapping = aes(colour = continent)) +
  geom_point()

## Challenge 3
ggplot(data = gapminder, mapping = aes(x= year, y = lifeExp, by = country)) +
  geom_point(mapping = aes(colour = continent)) +
  geom_line()

### Transformations and statistics
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp, colour = continent)) +
  geom_point()

# change scale of x axis to log
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp, colour = continent)) +
  geom_point() +
  scale_x_log10()

# regression line
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp, colour = continent)) +
  geom_point() +
  scale_x_log10() + 
  geom_smooth(method = "lm") # linear regression 

# previous shows different regression line plotted by continents
# if you just want one regression line 
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10() + 
  geom_smooth(method = "lm")

# OR if you want to keep colour
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp)) +
  geom_point(mapping = aes(colour = continent)) +
  scale_x_log10() + 
  geom_smooth(method = "lm")

# change size of regression line
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp)) +
  geom_point(mapping = aes(colour = continent)) +
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)

## Challenge 4a
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp)) +
  geom_point(colour = "red") +
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)

# change size of points 
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp)) +
  geom_point(colour = "red", size = 0.5) +
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)

## Challenge 4b
ggplot(data = gapminder, mapping = aes(x= gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(colour = "orange", size = 0.8, shape = "triangle") +
  scale_x_log10() + 
  geom_smooth(method = "lm")

# change shape by continent
ggplot(data = gapminder, mapping = aes(x= gdpPercap,
                                       y = lifeExp, 
                                       colour = continent,
                                       shape = continent)) +
  geom_point(colour = "orange", size = 0.8) +
  scale_x_log10() + 
  geom_smooth(method = "lm")

# multi-panel figures
starts.with <- substr(gapminder$country, start = 1, stop = 1) # first letter of each country in gapminder
az.countries <- gapminder[starts.with %in% c("A", "Z"), ] # subsetting so it only returns countries and A or Z countries

unique(az.countries$country)

ggplot(data = az.countries, mapping = aes(x = year, y = lifeExp, colour = continent)) + 
  geom_line() +
  facet_wrap(~ country) # separate plot for each country

# add labels for axis, title for figure and label for key 
ggplot(data = az.countries, mapping = aes(x = year, y = lifeExp, colour = continent)) + 
  geom_line() +
  facet_wrap(~ country) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1", colour = "Continent")

# change axis text format 
ggplot(data = az.countries, mapping = aes(x = year, y = lifeExp, colour = continent)) + 
  geom_line() +
  facet_wrap(~ country) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1", colour = "Continent") +
  theme(axis.text.x = element_text(angle = 90)) 

# saving your plot 
p <- ggplot(data = az.countries, mapping = aes(x = year, y = lifeExp, colour = continent)) + 
  geom_line() +
  facet_wrap(~ country) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1", colour = "Continent") +
  theme(axis.text.x = element_text(angle = 90)) 

ggsave(filename = "plot.png", plot = p)

# specify how big you want plot to be
ggsave(filename = "plot2.png", plot = p, width = 5, height = 5) 
# you can change units by adding , unit = "cm" etc.

## Challenge 5 : Density Plot 
ggplot(data = gapminder, mapping = aes(x = gdpPercap, fill = continent)) +
  geom_density()

ggplot(data = gapminder, mapping = aes(x = gdpPercap, fill = continent)) + 
  geom_density(alpha = 0.6) +
  scale_x_log10() +
  facet_wrap(~ year) +
  labs(x = "Year", y = "GDP per capita", title = "Figure 2") +
  theme(axis.text.x = element_text(angle = 90))

# mean gdp per cap in Africa
class(gapminder$gdpPercap)
table(is.na(gapminder$gdpPercap)) # check for missing values - FALSE, so there's none
df <- gapminder[gapminder$continent == "Africa", "gdpPercap"]
mean(df$gdpPercap)

# mean gdp in Americas
df <- gapminder[gapminder$continent == "Americas", "gdpPercap"]
mean(df$gdpPercap)

# mean gdp in Asia
df <- gapminder[gapminder$continent == "Asia", "gdpPercap"]
mean(df$gdpPercap)

# dplyr functions: select columns
year_country_gdp <- select(gapminder, 
                           year, 
                           country,
                           gdpPercap)

# tidy way of coding using piping %>% 
year_country_gdp <- gapminder %>% 
  select(year, country, gdpPercap)

# dplyr functions: filtering rows
year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe")

year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)

## Challenge 1
lifeExp_country_year_afr <- gapminder %>%
  filter(continent == "Africa") %>%
  select(lifeExp, country, year)

# group by function to separate dataframe into different groups
# using group by to calculate stats

gdp_by_continents <- gapminder %>%
  group_by(continent) %>%
  summarise(mean_gdpPercap = mean(gdpPercap)) #take mean of gdp per cap of each continent and add new column

## Challenge 2

lifeExp_by_country <- gapminder %>%
  group_by(country) %>%
  summarise(mean_lifeExp = mean(lifeExp))

# multiple group columns to calculate stats

df <- gapminder %>%
  group_by(continent, year) %>%
  summarise(mean_gdp = mean(gdpPercap))

df <- gapminder %>%
  group_by(continent, year) %>%
  summarise(mean_gdp = mean(gdpPercap), 
            mean_lifeExp = mean(lifeExp))

#count how many values
gapminder %>%
  filter(year == 2002) %>%
  count(continent)

gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)

# calculate SE of lifeExp

gapminder %>%
  group_by(continent) %>%
  summarise(se_le = sd(lifeExp)/ sqrt(n()))

# add a new column with gdp per cap per billion people

df <- gapminder %>%
  mutate(gdpPercap_bil = gdpPercap*pop/10^9) #sets function to a column and output to new column
  
df <- gapminder %>%
  mutate(gdpPercap_bil = gdpPercap*pop/10^9) %>%
  group_by(continent, year) %>%
  summarise(mean_gdp_bil = mean(gdpPercap_bil))

# sort from greatest to least 
df <- gapminder %>%
  mutate(gdpPercap_bil = gdpPercap*pop/10^9) %>%
  group_by(continent, year) %>%
  summarise(mean_gdp_bil = mean(gdpPercap_bil)) %>%
  arrange(desc(mean_gdp_bil))

## Advanced Challenge

#gapminder %>% 
 # group_by(country, year) %>%
  #summarise(mean_lifeExp = mean(lifeExp)) %>%
  #filter(year = 2002) %>%
  #arrange(desc(mean_lifeExp))

# dpylr with ggplot
gapminder %>% 
  filter(country %in% c("Austria", "Norway")) %>%
  ggplot(mapping = aes(x = year, y = lifeExp,
                       colour = country)) + 
  geom_line()
           