library(shiny)
library(dplyr)
library(ggplot2)
library(data.table)
library(shinydashboard)
library(googleVis)
library(DT)
library(rsconnect)

#read dataset 
insurance_df <- read.csv(file="./insurance.csv")

#rename column name
names(insurance_df)[names(insurance_df) == "sex"] <- "gender"

#add log_expenses column
insurance_df$log_expenses <- log(insurance_df$expenses, 10)

