# Load Packages 
library(tidyverse)

# Loading Data 
titanic <- read.csv("titanic.csv", stringsAsFactors = TRUE)

# Dimensions 
dim(titanic)
# Structures 
str(titanic)

# Convert Data Types 
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)

# Creating Bar Charts 
ggplot(titanic, aes(x=Survived))+
  geom_bar()

# Survival rates by sex
ggplot(titanic, aes(x=Survived, fill=Sex))+
  geom_bar()+
  labs(title = "Surviaval Rates by Sex", 
       x= "Survived", 
       y = "Counts")+
  facet_wrap(~Sex)

# Survival rates by pclass 
ggplot(titanic, aes(x=Survived, fill=Pclass))+
  geom_bar()+
  labs(title = "Surviaval Rates by Pclass", 
       x= "Survived", 
       y = "Counts", 
       caption = "Data Source: https://hossainlab.github.io/", 
       tag = "A")+
  facet_wrap(~Pclass)+
  theme_dark(base_size = 18)



summary(titanic$Age)

# Histogram 
titanic %>% 
  ggplot(aes(x=Age))+
  geom_histogram(binwidth = 5, bins = 30)+
  labs(x="Age", 
       y = "Passenger Counts", 
       title = "Passenger Age Distribution")


titanic %>% 
  ggplot(aes(x=Age, fill=Survived))+
  geom_histogram(binwidth = 5, bins = 30)+
  labs(x="Age", 
       y = "Passenger Counts", 
       title = "Survival Rates by Age")

titanic %>% 
  ggplot(aes(x=Age, fill=Sex))+
  geom_histogram(binwidth = 5, bins = 30)+
  labs(x="Age", 
       y = "Passenger Counts", 
       title = "Passenger Age Distribution by Sex")

titanic %>% 
  ggplot(aes(x=Age, fill=Pclass))+
  geom_histogram(binwidth = 5, bins = 30)+
  labs(x="Age", 
       y = "Passenger Counts", 
       title = "Passenger Age Distribution by Pclass")+
  facet_wrap(~Pclass)


titanic %>% 
  ggplot(aes(x=Age, fill=Pclass))+
  geom_density()+
  labs(x="Age", 
       y = "Passenger Counts", 
       title = "Passenger Age Distribution by Pclass")+
  facet_wrap(~Pclass)



titanic %>% 
  ggplot(aes(x=Age))+
  geom_boxplot()


data("iris")
str(iris)

iris %>% 
  ggplot(aes(x=Species, y=Sepal.Length))+
  geom_boxplot()

iris %>% 
  ggplot(aes(x=Species, y=Sepal.Width))+
  geom_boxplot()

iris %>% 
  ggplot(aes(x=Species, y=Sepal.Width))+
  geom_violin()


# Scatter Plot 
iris %>% 
  ggplot(aes(x=Sepal.Length, y=Petal.Length, color=Species))+
  geom_point()+
  facet_wrap(~Species)

iris %>% 
  ggplot(aes(x=Sepal.Length, y=Petal.Length, color=Species))+
  geom_line()