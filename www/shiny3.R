# Minimal example of Shiny widget using 'magick' images
ui <- fluidPage(
  titlePanel("Magick Shiny Demo"),

  sidebarLayout(

    sidebarPanel(

      fileInput("upload", "Upload new image", accept = c('image/png', 'image/jpeg')),
      textInput("size", "Size", value = "500x500"),
      sliderInput("rotation", "Rotation", 0, 360, 0),
      sliderInput("blur", "Blur", 0, 20, 0),
      sliderInput("implode", "Implode", -1, 1, 0, step = 0.01),

      checkboxGroupInput("effects", "Effects",
                         choices = list("negate", "charcoal", "edge", "flip", "flop"))
    ),
    mainPanel(
      imageOutput("img"),
      HTML("<table> <thead>  <tr>   <th style=\"text-align:left;\"> Pal_1 </th>   <th style=\"text-align:left;\"> Pal_2 </th>   <th style=\"text-align:left;\"> Pal_3 </th>   <th style=\"text-align:left;\"> Pal_4 </th>   <th style=\"text-align:left;\"> Pal_5 </th>   <th style=\"text-align:left;\"> Pal_6 </th>   <th style=\"text-align:left;\"> Pal_7 </th>   <th style=\"text-align:left;\"> Pal_8 </th>   <th style=\"text-align:left;\"> Pal_9 </th>   <th style=\"text-align:left;\"> Pal_10 </th>  </tr> </thead><tbody>  <tr>   <td style=\"text-align:left; background-color: #4C7DDC; color: white;\"> #4C7DDC </td>   <td style=\"text-align:left; background-color: #4A7DE4; color: white;\"> #4A7DE4 </td>   <td style=\"text-align:left; background-color: #EBF5FD; color: black;\"> #EBF5FD </td>   <td style=\"text-align:left; background-color: #D8C5A4; color: black;\"> #D8C5A4 </td>   <td style=\"text-align:left; background-color: #8FD1F7; color: black;\"> #8FD1F7 </td>   <td style=\"text-align:left; background-color: #4F8C3C; color: white;\"> #4F8C3C </td>   <td style=\"text-align:left; background-color: #B9ECFD; color: black;\"> #B9ECFD </td>   <td style=\"text-align:left; background-color: #5B99E9; color: black;\"> #5B99E9 </td>   <td style=\"text-align:left; background-color: #617470; color: white;\"> #617470 </td>   <td style=\"text-align:left; background-color: #648750; color: white;\"> #648750 </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #5394E7; color: black;\"> #5394E7 </td>   <td style=\"text-align:left; background-color: #6FADE7; color: black;\"> #6FADE7 </td>   <td style=\"text-align:left; background-color: #D7EAFB; color: black;\"> #D7EAFB </td>   <td style=\"text-align:left; background-color: #87C7F9; color: black;\"> #87C7F9 </td>   <td style=\"text-align:left; background-color: #E6DAC9; color: black;\"> #E6DAC9 </td>   <td style=\"text-align:left; background-color: #2D1404; color: white;\"> #2D1404 </td>   <td style=\"text-align:left; background-color: #BEDCF4; color: black;\"> #BEDCF4 </td>   <td style=\"text-align:left; background-color: #4C6483; color: white;\"> #4C6483 </td>   <td style=\"text-align:left; background-color: #9BABB5; color: black;\"> #9BABB5 </td>   <td style=\"text-align:left; background-color: #DFC384; color: black;\"> #DFC384 </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #C0E0FA; color: black;\"> #C0E0FA </td>   <td style=\"text-align:left; background-color: #92D1F7; color: black;\"> #92D1F7 </td>   <td style=\"text-align:left; background-color: #D4E9F9; color: black;\"> #D4E9F9 </td>   <td style=\"text-align:left; background-color: #83C2F9; color: black;\"> #83C2F9 </td>   <td style=\"text-align:left; background-color: #B7B7A9; color: black;\"> #B7B7A9 </td>   <td style=\"text-align:left; background-color: #3E5673; color: white;\"> #3E5673 </td>   <td style=\"text-align:left; background-color: #6EA8E1; color: black;\"> #6EA8E1 </td>   <td style=\"text-align:left; background-color: #55A44D; color: black;\"> #55A44D </td>   <td style=\"text-align:left; background-color: #A9DBF7; color: black;\"> #A9DBF7 </td>   <td style=\"text-align:left; background-color: #E7C98D; color: black;\"> #E7C98D </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #BAEFFC; color: black;\"> #BAEFFC </td>   <td style=\"text-align:left; background-color: #C3E0F6; color: black;\"> #C3E0F6 </td>   <td style=\"text-align:left; background-color: #6FA8E6; color: black;\"> #6FA8E6 </td>   <td style=\"text-align:left; background-color: #669FE3; color: black;\"> #669FE3 </td>   <td style=\"text-align:left; background-color: #C8A57A; color: black;\"> #C8A57A </td>   <td style=\"text-align:left; background-color: #579C9F; color: black;\"> #579C9F </td>   <td style=\"text-align:left; background-color: #5183D9; color: black;\"> #5183D9 </td>   <td style=\"text-align:left; background-color: #866153; color: white;\"> #866153 </td>   <td style=\"text-align:left; background-color: #CDEDFB; color: black;\"> #CDEDFB </td>   <td style=\"text-align:left; background-color: #ACE4FA; color: black;\"> #ACE4FA </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #CBE8FB; color: black;\"> #CBE8FB </td>   <td style=\"text-align:left; background-color: #EFF6F0; color: black;\"> #EFF6F0 </td>   <td style=\"text-align:left; background-color: #91AB97; color: black;\"> #91AB97 </td>   <td style=\"text-align:left; background-color: #84CE7E; color: black;\"> #84CE7E </td>   <td style=\"text-align:left; background-color: #D78F51; color: black;\"> #D78F51 </td>   <td style=\"text-align:left; background-color: #B1EEF8; color: black;\"> #B1EEF8 </td>   <td style=\"text-align:left; background-color: #5D954B; color: black;\"> #5D954B </td>   <td style=\"text-align:left; background-color: #C79A73; color: black;\"> #C79A73 </td>   <td style=\"text-align:left; background-color: #D0EEFD; color: black;\"> #D0EEFD </td>   <td style=\"text-align:left; background-color: #AED5F8; color: black;\"> #AED5F8 </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #E5F3FE; color: black;\"> #E5F3FE </td>   <td style=\"text-align:left; background-color: #D7A5DF; color: black;\"> #D7A5DF </td>   <td style=\"text-align:left; background-color: #85D17F; color: black;\"> #85D17F </td>   <td style=\"text-align:left; background-color: #66A856; color: black;\"> #66A856 </td>   <td style=\"text-align:left; background-color: #78C16A; color: black;\"> #78C16A </td>   <td style=\"text-align:left; background-color: #BFE6FA; color: black;\"> #BFE6FA </td>   <td style=\"text-align:left; background-color: #4D8C3D; color: white;\"> #4D8C3D </td>   <td style=\"text-align:left; background-color: #ACAAA2; color: black;\"> #ACAAA2 </td>   <td style=\"text-align:left; background-color: #F1F1EB; color: black;\"> #F1F1EB </td>   <td style=\"text-align:left; background-color: #83BFFA; color: black;\"> #83BFFA </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #F1EFC8; color: black;\"> #F1EFC8 </td>   <td style=\"text-align:left; background-color: #BDB082; color: black;\"> #BDB082 </td>   <td style=\"text-align:left; background-color: #5C3719; color: white;\"> #5C3719 </td>   <td style=\"text-align:left; background-color: #589F55; color: black;\"> #589F55 </td>   <td style=\"text-align:left; background-color: #65AC5D; color: black;\"> #65AC5D </td>   <td style=\"text-align:left; background-color: #DFD7A8; color: black;\"> #DFD7A8 </td>   <td style=\"text-align:left; background-color: #5F5546; color: white;\"> #5F5546 </td>   <td style=\"text-align:left; background-color: #E9D293; color: black;\"> #E9D293 </td>   <td style=\"text-align:left; background-color: #CED0CD; color: black;\"> #CED0CD </td>   <td style=\"text-align:left; background-color: #63A3EB; color: black;\"> #63A3EB </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #EBD890; color: black;\"> #EBD890 </td>   <td style=\"text-align:left; background-color: #916647; color: white;\"> #916647 </td>   <td style=\"text-align:left; background-color: #DCA555; color: black;\"> #DCA555 </td>   <td style=\"text-align:left; background-color: #60A24E; color: black;\"> #60A24E </td>   <td style=\"text-align:left; background-color: #5D9F4A; color: black;\"> #5D9F4A </td>   <td style=\"text-align:left; background-color: #EABF94; color: black;\"> #EABF94 </td>   <td style=\"text-align:left; background-color: #AB7A43; color: black;\"> #AB7A43 </td>   <td style=\"text-align:left; background-color: #EFF6DB; color: black;\"> #EFF6DB </td>   <td style=\"text-align:left; background-color: #EBE0AF; color: black;\"> #EBE0AF </td>   <td style=\"text-align:left; background-color: #487F76; color: white;\"> #487F76 </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #F2DF7B; color: black;\"> #F2DF7B </td>   <td style=\"text-align:left; background-color: #396250; color: white;\"> #396250 </td>   <td style=\"text-align:left; background-color: #F7D160; color: black;\"> #F7D160 </td>   <td style=\"text-align:left; background-color: #B78449; color: black;\"> #B78449 </td>   <td style=\"text-align:left; background-color: #4E6D80; color: white;\"> #4E6D80 </td>   <td style=\"text-align:left; background-color: #76BB68; color: black;\"> #76BB68 </td>   <td style=\"text-align:left; background-color: #EED2A2; color: black;\"> #EED2A2 </td>   <td style=\"text-align:left; background-color: #D3D8D3; color: black;\"> #D3D8D3 </td>   <td style=\"text-align:left; background-color: #CEB07E; color: black;\"> #CEB07E </td>   <td style=\"text-align:left; background-color: #34180E; color: white;\"> #34180E </td>  </tr>  <tr>   <td style=\"text-align:left; background-color: #352D24; color: white;\"> #352D24 </td>   <td style=\"text-align:left; background-color: #4B7BDE; color: white;\"> #4B7BDE </td>   <td style=\"text-align:left; background-color: #E4C78A; color: black;\"> #E4C78A </td>   <td style=\"text-align:left; background-color: #E2CF47; color: black;\"> #E2CF47 </td>   <td style=\"text-align:left; background-color: #6FABE7; color: black;\"> #6FABE7 </td>   <td style=\"text-align:left; background-color: #6BA965; color: black;\"> #6BA965 </td>   <td style=\"text-align:left; background-color: #F8FCFE; color: black;\"> #F8FCFE </td>   <td style=\"text-align:left; background-color: #82BEF9; color: black;\"> #82BEF9 </td>   <td style=\"text-align:left; background-color: #BE9944; color: black;\"> #BE9944 </td>   <td style=\"text-align:left; background-color: #509141; color: white;\"> #509141 </td>  </tr></tbody></table>")
    )
  )
)

server <- function(input, output, session) {

  library(magick)

  # Start with placeholder img
  image <- image_read("https://images-na.ssl-images-amazon.com/images/I/81fXghaAb3L.jpg")
  observeEvent(input$upload, {
    if (length(input$upload$datapath))
      image <<- image_read(input$upload$datapath)
      image_df <<- load.image(input$upload$datapath) %>% as.data.frame()
    print(image_df)
    info <- image_info(image)
    updateCheckboxGroupInput(session, "effects", selected = "")
    updateTextInput(session, "size", value = paste(info$width, info$height, sep = "x"))
  })

  # A plot of fixed size
  output$img <- renderImage({

    # Boolean operators
    if("negate" %in% input$effects)
      image <- image_negate(image)

    if("charcoal" %in% input$effects)
      image <- image_charcoal(image)

    if("edge" %in% input$effects)
      image <- image_edge(image)

    if("flip" %in% input$effects)
      image <- image_flip(image)

    if("flop" %in% input$effects)
      image <- image_flop(image)

    # Numeric operators
    tmpfile <- image %>%
      image_rotate(input$rotation) %>%
      image_implode(input$implode) %>%
      image_blur(input$blur, input$blur) %>%
      image_resize(input$size) %>%
      image_write(tempfile(fileext='jpg'), format = 'jpg')

    # Return a list
    list(src = tmpfile, contentType = "image/jpeg")
  })
}

shinyApp(ui, server)
