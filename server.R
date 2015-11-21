library(shiny)
library(ggplot2)

function(input, output) {
  
    data<-mtcars
    data$am<-factor(mtcars$am)      
    
    output$plot <- renderPlot({
        
        p<-ggplot(data,aes_string(x=input$x,y="mpg",color="am")) + 
            geom_point(size=6) +
            labs(title="Miles per galon by transmision type")+
            scale_y_continuous(limits=c(5, 35))+
            theme(plot.title=element_text(vjust=1.5,face="bold.italic",size=12),strip.text=element_text(size=12))+
            scale_color_discrete(name="Transmission",breaks=c(0,1),labels=c("Automatic", "Manual"))
    
        if (input$confidence)
            p <- p + stat_smooth(method="lm",level=input$confidence_interval,fullrange=TRUE)
    
        print(p)
  
    }, height=700)
  
}