shinyUI(fluidPage(
  titlePanel("ChickWeight Explorer"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("Diet", 
                  label = h3("Select Diet"), 
                  choices = list("Diet 1" = 1,
                                 "Diet 2" = 2,
                                 "Diet 3" = 3,
                                 "Diet 4" = 4),
                            selected =c(1,2,3,4)
                  ),
      radioButtons("Graphic", label = h3("Graphic type"),
                   choices = list("spaghetti" = 1, 
                                  "boxplot" = 2)
                             ,selected = 1
                  ),
      submitButton("Submit")
              
    ),
    mainPanel(label =h3("main panel"),
              plotOutput("chickPlot")
    )
  )
))