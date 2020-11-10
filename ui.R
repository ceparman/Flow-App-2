
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinyjs)

shinyUI(fluidPage(
  useShinyjs(),
  # Application title
  titlePanel(title=div(img(src="logo-frequency-therapeutics.png"))
             ,windowTitle = "Flow App 2"),

  
  
  # Sidebar with a slider input for number of bins
  sidebarLayout( 
    sidebarPanel(
      tags$h4("Flow App 2"),
      tags$hr(),
      
    
     
     textOutput("status"),
     tags$hr(),
    
     
     
     fileInput("plate_file", 'Choose Plate Data File',        #plate File
               accept=c('text/csv', 
                        'text/comma-separated-values,text/plain', 
                        '.csv','application/zip')),
    tags$hr(),
     
    #radioButtons( "file_type", "Single or Dual Files", choices = NULL, selected = NULL,
     #            inline = TRUE, width = NULL, choiceNames = c("Single File","Two Files"),
      #           choiceValues = c("single","dual")),
    
   # uiOutput("fileinput"),
   
   fileInput("input_file", 'Choose Data File',     
             accept=c('text/csv', 
                      'text/comma-separated-values,text/plain', 
                      '.csv','application/zip')),
    
    tags$hr(),
    fluidRow(
    column(12,checkboxInput("uselimsplate","Use LIMS Plate",value = FALSE))
    ),
   uiOutput("limsplate"),
   
   
      
   tags$hr(),
   
   disabled(actionButton("load","Load Data and Sample Info")),   
   
    ),

    # Show a plot of the generated distribution
    mainPanel(
       tabsetPanel(id = "inTabset",
      tabPanel("Controls",
         uiOutput("controls") #, 
        #  actionButton("process","Process Data")
      ),
      tabPanel ("Review Data",
        uiOutput("reject") #,
       # textOutput("click_info"),
       # actionButton("write","Write Results"),
       # downloadButton("downloadData", "Download")
       )
    )
    )
      
      
  
  )
))
