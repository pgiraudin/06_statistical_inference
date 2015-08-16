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
        p <- ggplot(data = dataSelection, aes(x = Time, y = weight, group = Chick, colour = Diet));
        p <- p + geom_line(); 
        p <- p + facet_grid(Diet ~ .) ;        
      
      #case of boxplot graphic
      }else if (input$Graphic == 2){
        p <- ggplot(data = dataSelection, aes(x = Time, y = weight, group = Time,colour = Diet))
        p <- p + geom_boxplot(); 
        p <- p + facet_wrap(~Diet, ncol=2);        
      }
      print(p);
    }
  })
  
  output$Documentation <- renderText({
    t1 <- h2("Documentation");
    t2 <- "This application aims to create graphics for the exploration of the \"ChickWeight\" data."
    t3 <- "The sidepanel is composed of two elements : "
    t4 <- "- a list of checkbox that represent the different diets for chicks"
    t5 <- "- two radio buttons that represent the type of graphic to render whit the selected datas."
    t6 <- "<br>"
    t7 <- "To display the datas, select the Diet checkbox that you want to display, then select a type of graphic, then click on the submit button."
    t8 <- "results are show in the main panel"
    print(paste(t1, t2, t3, t4, t5, t6, t7, t8, sep = "<br>"))
  })
  
})