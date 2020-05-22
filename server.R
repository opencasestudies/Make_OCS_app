




function(input, output) {
  
 output$value <-renderImage({input$image
  })
 
 output$value <- renderText({ input$logo
 })
  
  output$value <- renderText({ input$title
  })
  
  output$value <- renderText({ input$header1
  })
  
  data("mammals")
  
  regFormula <- reactive({
    as.formula(paste('BodyWt ~', input$x))
  })

  output$value <- renderText({ input$narrative1
  })
  
  output$regPlot <- renderPlot({
    par(mar = c(4, 4, .1, .1))
    plot(regFormula(), data = mammals, pch = 19)
  })
  
  output$downloadReport <- downloadHandler(
    filename = function() {
      paste('my-report', sep = '.', switch(
        input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
      ))
    },
    
    content = function(file) {
      src <- normalizePath('report.Rmd')
      
      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'report.Rmd', overwrite = TRUE)
      
      library(rmarkdown)
      out <- render('report.Rmd')
      file.rename(out, file)
      
      # out <- render('report.Rmd', switch(
      #   input$format,
      #   PDF = pdf_document(), HTML = html_document(), Word = word_document()
      # ))
      # file.rename(out, file)
    }
  )
  
}