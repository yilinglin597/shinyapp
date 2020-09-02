
library(shiny)
library(dplyr)
library(ggplot2)
library(data.table)
library(shinydashboard)
library(googleVis)
library(DT)

insurance_df <- data.frame(read.csv(file="./insurance.csv"))

choice <- colnames(insurance_df[1:5])