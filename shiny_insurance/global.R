library(shiny)
library(dplyr)
library(ggplot2)
library(data.table)
library(shinydashboard)
library(googleVis)
library(DT)

insurance_df <- read.csv(file="./insurance.csv")

names(insurance_df)[names(insurance_df) == "sex"] <- "gender"
insurance_df