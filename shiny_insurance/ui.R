library(googleVis)
library(shiny)


shinyUI(dashboardPage(
    skin = "black",
    dashboardHeader(title = 'Medical Cost'), 
    dashboardSidebar(
        sidebarMenu(
            menuItem("Region Information", tabName = "region_info", icon = icon("map")),
            menuItem("Who Pays The Most", tabName="medical_cost", icon=icon("wallet")),
            menuItem("Correlation", tabName="correlation", icon=icon("chart-bar")),
            menuItem("Data", tabName = "data", icon = icon("database")),
            menuItem("About Me", tabName = "aboutme", icon = icon("smile"))

            
        )
    
        
        
    ), 
    dashboardBody(
        tabItems(
            tabItem(tabName = "region_info",
                    selectizeInput ('selected_region',
                    'Select Region to Obtain Information',
                    c('southwest', 'southeast', 'northwest', 'northeast')),
                    fluidRow(infoBoxOutput("avgbmiBox"),
                             infoBoxOutput("avgageBox"),
                             infoBoxOutput("avgexpensesBox"),
                             infoBoxOutput("smokerBox"),
                             infoBoxOutput("maleBox"),
                             infoBoxOutput("femaleBox")),
                        
                      
                    fluidRow(
                        column(width=3,
                             plotOutput("bmihist")),
                        
                        column(width=3,
                             plotOutput("agehist")),
                        
                        
                        column(width=3,
                               plotOutput("expenseshist")),
                        
                        column(width=3,
                             plotOutput("log_expenseshist")))
                   
                    ),
                    
            tabItem(tabName = "medical_cost", 
                    selectizeInput('selected',
                                    'Select Variable to Display',
                                    c('gender','children','region','smoker')),
                    plotOutput("boxplot"),
                    ),
            
            tabItem(tabName = "correlation", 
                    
                    selectizeInput('selected_numeric',
                                            'Select Variable to Display',
                                            c('bmi','age')),
                    plotOutput("scatterplot"),
                    br(),
                    strong(textOutput("correlation"))
                        
                    ),
            
            tabItem(tabName = "data", 
                    fluidRow(box(DT::dataTableOutput("table")))),
            
            tabItem(tabName="aboutme",
                    fluidRow(
                    tags$div(style='text-align: left; width: 50%; margin-left: auto; margin-right: auto; color=blue ',
                    h4("Yiling Lin is a data enthusiast with proven talent for for executing business strategy according to data analytics and project management paradigms."),
                    h4("Her professional experience in the music industry is also recogized for effectively coordinating clients and cross-functional teams from international cultures and backgrounds to deliver exceptional programs."),
                    h4("She holds a M.A. in Performing Arts Administration from New York University.")
                    ))
                    
                    )
        )
    )))
