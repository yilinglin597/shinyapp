
library(googleVis)
library(shiny)


shinyUI(dashboardPage( 
    dashboardHeader(title = 'Medical Cost'), 
    dashboardSidebar(
        sidebarMenu(
            menuItem("Map", tabName = "map", icon = icon("map")),
            menuItem("Analysis", tabName="analysis", icon=icon("chart-bar"),
                menuSubItem("Who Pays The Most", tabName="medical_cost"),
                menuSubItem("Correlation", tabName="correlation")),
            menuItem("Data", tabName = "data", icon = icon("database")),
            menuItem("About Me", tabName = "aboutme", icon = icon("smile"))
            
        )
        
        #selectizeInput('selected',
                       #'Select Item to Display',
                       #choice)
        

        
    ), 
    dashboardBody(
        tabItems(
            tabItem(tabName = "map",
                    "put map"),
            tabItem(tabName ="analysis", 
                    "general"),
            tabItem(tabName = "medical_cost",
                    selectInput('choose variable',
                                'Select Variable to Display',
                                choice),
                    "chart"),
            tabItem(tabName = "correlation", "cor"),
            tabItem(tabName = "data", 
                    fluidRow(box(DT::dataTableOutput("table"))))
    )
)))