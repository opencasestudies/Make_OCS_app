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
  theme = shinytheme("cerulean"),
  headerPanel("Create a Tutorial"),
  title = 'Download a PDF report',
  sidebarLayout(
    sidebarPanel(
      helpText(),
      data(mammals),
      fileInput("image", "Choose image files", multiple = TRUE),
      textInput("logo", "Logo", "Logo_URL"),
      textInput("title", "Title", "Type Title text here"),
      textInput("header1", "Header1", "test"),
      selectInput('x', 'Build a regression model of Body weight against:',
                  choices = names(mammals)[-2]),
      radioButtons('format', 'Document format', c('PDF', 'HTML', 'Word'),
                   inline = TRUE),
      textInput("narrative1", "Narrative Text", "Type narrative text here"),
      verbatimTextOutput("value"),
      downloadButton('downloadReport')
    ),
    mainPanel(
      plotOutput('regPlot')

    )
  )

)

#for images: https://rstudio.github.io/shiny/tutorial/#sending-images

