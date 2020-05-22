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
      textInput("logo", "Type Image URL", "https://opencasestudies.github.io/img/logo.jpg"),
      textInput("title", "Title", "Type Title text here"),
      radioButtons('format', 'Document format', c('PDF', 'HTML', 'Word'),
                   inline = TRUE),
      downloadButton('downloadReport'),
      h6( "Powered by:"),
     tags$img(src= 'RStudio-Ball.png',height =50, width = 50)
    ),
    mainPanel(
      fileInput("data", "Choose data files", multiple = TRUE),
      textInput("image", "Type Image URL", "https://www.searchdiscovery.com/wp-content/uploads/2019/07/cropped-Asset-2-768x112.png"),
      textInput("header1", "Header1", "Header 1"),
      textInput("header2", "Header2", "Header 2"),
      textInput("narrative1", "Narrative Text", "Type narrative text here"),
      verbatimTextOutput("value")
    )
  )

)

#for images: https://rstudio.github.io/shiny/tutorial/#sending-images

