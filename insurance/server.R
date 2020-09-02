library(googleVis)

shinyServer(function(input, output, session){


    
    
    output$table <- DT::renderDataTable({
        datatable(insurance_df, rownames=FALSE) %>% 
            formatStyle(input$selected, background="skyblue", fontWeight="bold")
        
    })
   
    
    
})

