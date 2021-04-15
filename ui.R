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
  theme = shinytheme("flatly"),
  headerPanel("Create an Online Case Study"),
  sidebarLayout(
    sidebarPanel(
      helpText(),
      textInput("logo", "Logo URL", "https://opencasestudies.github.io/img/logo.jpg", width = '400px'),
      textInput("title", "Title", "Gram Negative Vs Gram Positive Bacteria", width = '400px'),
      radioButtons('format', 'Document format', c('PDF', 'HTML', 'Word'),
                   inline = TRUE),
      h1('_______________'),
      h5('All done? Click here!'),
      downloadButton('downloadReport','Compile and Download!'),
      h6('Format: HTML'),
      h6('Hosted by:'),
     tags$a(href='https://www.opencasestudies.org/','Open Case Studies',target='_blank'),
     ## <a href="https://www.opencasestudies.org/">Open Case Studies/a> 
      h6( "Powered by:"),
     tags$img(src= 'RStudio-Ball.png',height =50, width = 50)
    ),
    mainPanel(
      textInput("mainimage", "Main Image URL", "https://thisonevsthatone.com/wp-content/uploads/Gram-positive-vs-Gram-negative.webp", width = '400px'),
  
      textInput("header1", "Header 1", "Gram-positive vs Gram-negative, what’s the difference??", width='400px'),
      textAreaInput("narrative1", "Narrative Text Section 1", "Gram-positive is a type of bacteria that have a thick, multilayered cell wall and no outer cell membrane. They stain purple when you perform a Gram stain on them.

Gram-negative is a type of bacteria that have a thin, single-layered cell wall and do have an outer cell membrane. They stain red or pink when you perform a Gram stain on them.

One way to help distinguish between the two different types is to associate the beginning letters of the words with a corresponding color attribute.

So gram-positive bacteria stain purple, and gram-negative bacteria do not.
",width='600px', height = '400px'),
      textInput("image1", "Image 1 URL", "https://cdn1.byjus.com/wp-content/uploads/2018/11/biology/2018/05/16065016/Difference-between-Gram-positive-and-Gram-negative-Bacteria.png", width='400px'),
      
      textInput("header2", "Header 2", "Gram Stain Method", width = '400px'),
      textAreaInput("narrative2", "Narrative Text Section 2", "During Gram staining both bacteria are stained with a purple dye, but the gram-negative does not retain it. So, you could also associate that concept to their names as well.

So gram-positive (plus) bacteria have the purple stain, and gram-negative bacteria (minus) do not have the purple stain.

Of course, there is much more to these two bacterial types than that, so let’s delve a bit deeper into both types.


Gram staining was invented by Hans Christian Gram, and it’s sometimes referred to as Gram’s method. This process is where gram-positive and gram-negative bacteria derived their names. Since bacteria are so tiny, Gram staining is used to determine the bacterial type (positive or negative).

This is incredibly important for treating ailments caused by bacteria. Different bacterial types react in different ways to different treatments, so we need to know the bacterial type to be able to know the best treatment option.
", width='600px',height='400px'),
      textInput("image2", "Image 2 URL", "https://cdn.technologynetworks.com/tn/images/body/g-pos-g-neg-cell-wall-structure-final1566305996142.jpg", width='400px'),
      
      textInput("video", "Youtube Video Code", "AZS2wb7pMo4")
      
    )
  )

)

#for images: https://rstudio.github.io/shiny/tutorial/#sending-images

