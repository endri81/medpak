library(DT)
library(readxl)
load("./data/data.rdata")

function(input, output) {

  # Filter data based on selections
output$table <- DT::renderDataTable({
  inFile <- input$file1
  
  if (!is.null(inFile)){
    data <- read_excel(inFile$datapath)
    data <- data[, -c(1:2)]
  }
  else {
    data <- data[, -c(1:2)]
    data
  }
    DT::datatable(
    data, 
    extensions = c('Buttons','Scroller', 'SearchPanes'), 
    options = list(
      dom = 'Bfrtip',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
      lengthMenu = c(5, 30, 50), pageLength = 15,
      language = list(
        search = 'Kërko',
        paginate = list(previous = 'Pas', `next` = 'Para'),
        info = 'Po, _TOTAL_ rekorde nga _START_ deri _END_'
      ),  
      initComplete = JS(
        "function(settings, json) {",
        "$(this.api().table().header()).css({'background-color': '#ad1d28', 'color': '#fff'});",
        "}"),
      searchHighlight = TRUE,
      autoWidth = TRUE
    ))

  })}  
 