

function(input, output) {
  
 output$value <-renderText({input$mainimage
  })
 shinyalert(
   title = "This tool helps make online lessons. Click the Make Case Study button to see an example.",
   text = "You will need to check your downloads",
   size = "s", 
   closeOnEsc = FALSE,
   closeOnClickOutside = FALSE,
   html = FALSE,
   type = "success",
   showConfirmButton = TRUE,
   showCancelButton = FALSE,
   confirmButtonText = "OK",
   confirmButtonCol = "#47AD84",
   timer = 0,
   imageUrl = "https://raw.githubusercontent.com/opencasestudies/opencasestudies.github.io/master/img/buttonbig.png",
   # imageUrl = "https://opencasestudies.github.io/img/logo.jpg",
   animation = TRUE
 )
 # createdusing Dean Attali's code https://daattali.com/shiny/shinyalert-demo/
 
  output$value <- renderText({ input$logo
  })
  
  output$value <- renderText({ input$title
  })
  
  output$value <- renderText({ input$header1
  })
  
  output$value <- renderText({ input$narrative1
  })
  
  output$value <-renderText({input$image1
  })
  
  output$value <- renderText({ input$header2
  })
  
  output$value <- renderText({ input$narrative2
  })
  
  output$value <-renderText({input$image2
  })
  
  output$value <-renderText({input$video
  })
  
  insertedHeader <- c()
  insertedNarrative <- c()
  insertedImage <- c()
  
  observeEvent(input$insertHeader, {
    btn <- input$insertHeader
    id <- paste0('hdr', btn)
    num <- 3 + length(insertedHeader)
    input_label <- paste0('Header ', as.character(num))
    insertUI(
      selector = '#placeholder',
      ui = textInput(id, input_label, width='400px')
    )
    insertedHeader <<- c(id, insertedHeader)
  })
  
  observeEvent(input$removeHeader, {
    removeUI(
      selector = paste0("div:has(> #", insertedHeader[length(insertedHeader)], ')')
    )
    insertedHeader <<- insertedHeader[-length(insertedHeader)]
  })
  
  observeEvent(input$insertNarrative, {
    btn <- input$insertNarrative
    id <- paste0('txt', btn)
    num <- 3 + length(insertedNarrative)
    input_label <- paste0('Narrative Text Section ', as.character(num))
    insertUI(
      selector = '#placeholder',
      ui = textAreaInput(id, input_label, width='600px',height='400px')
    )
    insertedNarrative <<- c(id, insertedNarrative)
  })
  
  observeEvent(input$removeNarrative, {
    removeUI(
      selector = paste0("div:has(> #", insertedNarrative[length(insertedNarrative)], ')')
    )
    insertedNarrative <<- insertedNarrative[-length(insertedNarrative)]
  })
  
  observeEvent(input$insertImage, {
    btn <- input$insertImage
    id <- paste0('img', btn)
    num <- 3 + length(insertedImage)
    input_label <- paste0('Image ', as.character(num), ' URL')
    insertUI(
      selector = '#placeholder',
      ui = textInput(id, input_label, width='400px')
    )
    insertedImage <<- c(id, insertedImage)
  })
  
  observeEvent(input$removeImage, {
    removeUI(
      selector = paste0("div:has(> #", insertedImage[length(insertedImage)], ')')
    )
    insertedImage <<- insertedImage[-length(insertedImage)]
  })
  
  output$downloadReport <- downloadHandler(
    filename = function() {
      paste('my-report', sep = '.', 'html')
          # switch(input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
      # )
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
      #   PDF = pdf_document(), HTML = 'html_document', Word = word_document()
      # ))
      # file.rename(out, file)
    }
  )
  
}