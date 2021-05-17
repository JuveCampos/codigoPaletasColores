# Librerias ----
library(shiny)
library(shinycssloaders)

# GLOBAL ----
# Jalamos un script con funciones desde la carpeta de trabajo.
source("t1.R")

# UI ----
ui = shinyUI(fluidPage(
  tags$head(
    includeCSS("styles.css")
  ),

  titlePanel("Generar paletas desde una imagen"),
  sidebarLayout(
    sidebarPanel(
      fileInput(inputId = 'files',
                label = 'Seleccione una imagen',
                multiple = TRUE,
                placeholder = "No se ha cargado una imagen",
                buttonLabel = "Explorar Archivos",
                accept=c('image/png', 'image/jpeg')),
      actionButton("btnRegenerar", "Rehacer gráfica"),
      br(),br(),
      p("Cargue una imágen para conseguir una gráfica circular de 10 paletas generadas aleatoriamente a partir de la descomposición de los colores de la imagen seleccionada.", br(),  "Esta aplicación tiene como objetivo ser una herramienta para la extracción de colores para generar nuestras propias paletas y utilizar dichos colores en otros productos de datos.")

    ),
    mainPanel(
      fluidPage(
        fluidRow(
          column(12,
                 tabsetPanel(
                   tabPanel("Imagen cargada", uiOutput('images', width = "90%")),
                   tabPanel("Gráfica", withSpinner(plotOutput("grafica_circular", height = "90vh"))),
                   tabPanel("Tabla de colores", uiOutput("tabla_colores"))
                 )
            )
        )
      )
    )
  )
))

# SERVIDOR ----
server = shinyServer(function(input, output) {

  # Generaación de tabla de archivos
  img <- reactive({
      a = load.image(str_c(files()$datapath)) %>%
        as.data.frame()
      print(a)
  })

  # Generamos un objeto reactivo
  files <- reactive({
    # Files va a guardar los datos del upload
    if(is.null(input$files)){
      files <- input$files
      files$datapath <- "www/acnh.png"
    } else {
      files <- input$files
      # print(str_c("files: ", files))
      # Quitamos cosas a la linea de los archivos (corregimos las rutas)
      files$datapath <- gsub("\\\\", "/", files$datapath)
    }

    # print(str_c("files$datapath: ", files$datapath))
    files # Objeto que contiene datos de la imagen subida
  })

  tabla_colores <- reactive({
    input$btnRegenerar
    datos_colores(files()$datapath)
  })

  output$tabla_colores <- renderUI({
    print(input$files)
    HTML(gen_tabla_colores(colores2 = tabla_colores()))
  })

  output$grafica_circular <- renderPlot({
    # Generamos la grafica ----
    grafica_circular(colores2 = tabla_colores(),
                     img_url = files()$datapath)
  })


  output$images <- renderUI({
    if(is.null(input$files)){
      imageOutput("acnh.png")
    } else {
    # Lista de imagenes de salida
    image_output_list <-
      # Para todos los elementos del objeto files()
      lapply(seq_along(nrow(files())),
             function(i)
             {
               imagename = paste0("image", i)
               # Programamos el Output
               imageOutput(imagename)
             })

    do.call(tagList, image_output_list)

    }

  })

  observe({
    for (i in seq_along(nrow(files())))
    {
      local({
        my_i <- i
        imagename = paste0("image", my_i)
        # print(imagename)
        output[[imagename]] <-
          renderImage({
            list(src = files()$datapath[my_i],
                 width = "90%",
                 alt = "No se pudo generar la imagen")
          }, deleteFile = FALSE)
      })
    }
  })
})

# App
shinyApp(ui = ui, server = server)
