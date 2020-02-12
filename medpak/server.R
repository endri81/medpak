library(DT)
load("./data/data.rdata")

function(input, output) {
  
  # Filter data based on selections
output$table <- DT::renderDataTable({
DT::datatable(
data, 
extensions = c('Buttons','FixedColumns','Scroller', 'Select', 'SearchPanes'), 
options = list(
  lengthMenu = c(5, 30, 50), pageLength = 15,
  language = list(
    search = 'Kërko',
    paginate = list(previous = 'Pas', `next` = 'Para'),
    info = 'Po, _TOTAL_ rekorde nga _START_ deri _END_'
  ),  
deferRender = TRUE,
scrollY = 500,
scroller = TRUE,
fixedColumns = TRUE,      
initComplete = JS(
        "function(settings, json) {",
        "$(this.api().table().header()).css({'background-color': '#ad1d28', 'color': '#fff'});",
        "}"),
columnDefs = list(list(
searchPanes = list(show = FALSE), targets = 1:4
  )),
selection = 'none',
buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
                                       searchHighlight = TRUE,
                                       autoWidth = TRUE
                                       ))
    
    
    })
    
 }