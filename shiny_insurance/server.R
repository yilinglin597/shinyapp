
shinyServer(function(input, output){
    
    output$avgbmiBox <- renderInfoBox({
        
        
        
        avg_bmi_value <- insurance_df %>% group_by(region) %>% 
          summarise(avg_bmi=mean(bmi))  %>%
          filter(region==input$selected_region)
        infoBox(paste("AVG BMI"), round(avg_bmi_value$avg_bmi,2), icon=icon('weight'), color='red')
    
        
    })
    
    output$avgageBox <- renderInfoBox({
      
      avg_age_value <- insurance_df %>% group_by(region) %>% 
        summarise(avg_age=mean(age))  %>%
        filter(region==input$selected_region)
      infoBox(paste("AVG AGE"), round(avg_age_value$avg_age,2), icon=icon('portrait'), color='yellow')
      
    })
    
    
    output$avgexpensesBox <- renderInfoBox({
      avg_expenses_value <- insurance_df %>% group_by(region) %>% 
        summarise(avg_expenses=mean(expenses))  %>%
        filter(region==input$selected_region)
      infoBox(paste("AVG EXPENSES"), round(avg_expenses_value$avg_expenses), icon=icon('money-bill'))
      
    })
    
    output$smokerBox <- renderInfoBox({
      smoker_ratio <- insurance_df %>% group_by(region) %>% 
        summarise(ratio=sum(smoker=="yes")/n())  %>%
        filter(region==input$selected_region)
      infoBox(paste("Percentage of Smoker"), round(smoker_ratio$ratio,2), icon=icon('smoking'), color="black")
      
    })
    
    output$maleBox <- renderInfoBox({
      male_ratio <- insurance_df %>% group_by(region) %>% 
        summarise(m_ratio=sum(gender=="male")/n())  %>%
        filter(region==input$selected_region)
      infoBox(paste("Percentage of Male"), round(male_ratio$m_ratio,2), icon=icon('male'), color="green")
      
    })
    
    output$femaleBox <- renderInfoBox({
      female_ratio <- insurance_df %>% group_by(region) %>% 
        summarise(f_ratio=sum(gender=="female")/n())  %>%
        filter(region==input$selected_region)
      infoBox(paste("Percentage of Female"), round(female_ratio$f_ratio,2), icon=icon('female'), color="purple")
      
    })
    
    
    output$bmihist <- renderPlot({
      insurance_df %>% filter(region==input$selected_region) %>% 
        ggplot(aes(x=bmi)) + geom_histogram()
      
      
    })
    
    output$agehist <- renderPlot({
      insurance_df %>% filter(region==input$selected_region) %>% 
        ggplot(aes(x=age)) + geom_histogram()
      
    })
    
    output$expenseshist <- renderPlot({
      insurance_df %>% filter(region==input$selected_region) %>% 
        ggplot(aes(x=expenses)) + geom_histogram()
      
    })
    
    
    output$log_expenseshist <- renderPlot({
      insurance_df %>% filter(region==input$selected_region) %>% 
        ggplot(aes(x=log_expenses)) + geom_histogram()
      
    })
    
    
    
    
    output$boxplot <- renderPlot({
        insurance_df %>% 
            mutate(children=as.factor(children)) %>% 
            ggplot() + geom_boxplot(aes_string(x=input$selected, y="log_expenses"))
        
    })
    
    

    output$scatterplot <- renderPlot({
        insurance_df %>% 
            ggplot(aes_string(x=input$selected_numeric, y="log_expenses")) + geom_point() + geom_smooth(method = "lm")
        
                                        
    })
    
    
    output$correlation = renderText({
        x=insurance_df %>%
            select(input$selected_numeric)
        y= insurance_df %>%
            select(log_expenses)
        corr = round(cor(x, y), digits = 5)
        
        paste('Correlation:',as.character(corr))
    })
    
    
    output$table <- DT::renderDataTable({
      datatable(insurance_df, rownames=FALSE) %>% 
        formatStyle(input$selected, background="skyblue", fontWeight="bold")
      
    })
    
})
