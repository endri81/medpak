# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

fluidPage(
includeCSS("styles.css"),
h1(id="big-heading", "Shërbime për fëmijët me aftësi të kufizuar"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Zgjidh skedarin Excel",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv","xls", "xlsx")
      ),
      tags$hr()
    ),
    mainPanel(
      # Create a new row for the table.
      DT::dataTableOutput("table")
    )
  )
)

