library(shiny)
library(ggplot2)

dataset <- mtcars

fluidPage(
  
  titlePanel("Car compsumption analysis"),
  
    sidebarPanel(

      fluidRow(
    
          selectInput('x', 'X axis variable',c("cyl","disp","hp","drat","wt","qsec","vs","gear","carb")),
                           
          sliderInput('confidence_interval', 'Confidence interval', min=0.75, max=0.975,
                           value=0.95, step=0.025, round=FALSE),
               
          checkboxInput('confidence', 'Regresion line and confidence interval')
               
      )
    ),
    
  
    mainPanel(
      tabsetPanel(
        tabPanel('Summary',
                h2('Background'),
                h4('This shiny app allows to conduct an exploratory analysis over a dataset 
                    of cars to explore the relationship between car’s transmission 
                    and miles per gallon (mpg) taking into consideration the potential 
                    influence of other variables'),
                h2('How to use'),
                h4('The sidebar panel'),
                h5('The sidebar panel allows to chose:'),
                HTML("<ul><li>The x axis variable you want to plot against the mpg (miles per galon)</li></ul>"),
                HTML("<ul><li>Include the linear regresion on the plot checking on 'Regresions line and confidence interval' checkbox'</li></ul>"),
                HTML("<ul><li>If 'Regesion line and confidence interval' checkbox is selected, the you can determine the confidence interval (70% to 97.5%) you want to show on the plot'</li></ul>"),
                h4('The plot'),
                HTML("<ul><li>To see the plot click the 'Plot' tab</li></ul>"),
                HTML("<ul><li>The y axis represent mpg (miles per galon)</li></ul>"),
                HTML("<ul><li>The x axis variable can be chosen on the sidemar menu</li></ul>"),
                HTML("<ul><li>Points in red represents cars with automatic transmision</li></ul>"),
                HTML("<ul><li>Points in blue represents cars with manual transmision</li></ul>"),
                HTML("<ul><li>Regresion line for automatic cars is red</li></ul>"),
                HTML("<ul><li>Regresion line for manual cars is blue</li></ul>"),                
                HTML("<ul><li>Confidence interval is shown by a grey shadow</li></ul>")
          ),
          
        tabPanel('Plot',plotOutput('plot'))
      )
    )

)