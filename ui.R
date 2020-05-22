#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
library(openintro)
library(shinythemes)

fluidPage(
  #theme = shinytheme("cerulean"),
  theme = shinytheme("darkly"),
  headerPanel("Create a Tutorial"),
  sidebarLayout(
    sidebarPanel(
      helpText(),
      textInput("logo", "Logo", "Logo_URL"),
      textInput("title", "Title", "Type Title text here"),
      radioButtons('format', 'Document format', c('PDF', 'HTML', 'Word'),
                   inline = TRUE),
      downloadButton('downloadReport'),
      h6( "Powered by:"),
     tags$img(src= 'Rstudio-ball.jpeg',height =50, width = 50)
    ),
    mainPanel(
   #   plotOutput('regPlot'),
     # selectInput('x', 'Build a regression model of Body weight against:',
      #            choices = names(mammals)[-2]),
      fileInput("data", "Choose data files", multiple = TRUE),
      fileInput("image", "Choose image files", multiple = TRUE),
      textInput("header1", "Header1", "Header 1"),
      textInput("header2", "Header2", "Header 2"),
      textInput("narrative1", "Narrative Text", "Type narrative text here"),
      verbatimTextOutput("value")
    )
  )

)

#for images: https://rstudio.github.io/shiny/tutorial/#sending-images

