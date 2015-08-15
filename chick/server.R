data(ChickWeight);
library(ggplot2);
library(dplyr);

shinyServer(function(input, output) {
  
  output$chickPlot <- renderPlot( {
    
    #test if data is null
    if (!is.null(input$Diet) ){
    # select diet from input checkbox
    dataSelection <- filter(ChickWeight,  Diet %in% input$Diet)
      
      #case of spaghetti graphic
      if (input$Graphic == 1){
        p<-ggplot(data = dataSelection, aes(x = Time, y = weight, group = Chick, colour = Diet));
        p <- p + geom_line(); 
        p <- p + facet_grid(Diet ~ .) ;        
      
      #case of boxplot graphic
      }else if (input$Graphic == 2){
        p<-ggplot(data = dataSelection, aes(x = Time, y = weight, group = Time,colour = Diet))
        p <- p + geom_boxplot(); 
        p <- p + facet_wrap(~Diet, ncol=2);        
      }
      print(p);
    }
    else{
      print("No data to display")
    }
    
  })
})