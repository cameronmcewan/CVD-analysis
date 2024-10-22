# Install and load the readr package
library(readr) 	#	readr: Part of the tidyverse, this package provides functions like read_csv() and write_csv() for fast and efficient reading/writing of flat files (CSV, TSV).
library(readxl)	# readxl: For reading Excel files (.xls, .xlsx). It can load specific sheets and ranges from Excel files without requiring additional software.
library(knitr) # knitr: Converts R scripts into dynamic reports, often used in conjunction with rmarkdown for generating HTML, PDF, or Word documents that combine text, code, and results.
library(ggplot2)   # ggplot2: The go-to package for creating complex and highly customizable visualizations. It is based on the grammar of graphics and can create bar plots, scatter plots, histograms, and more.
library(shiny)  # shiny: For building interactive web applications directly from R. It allows users to build dashboards and interactive data visualization tools.
library(shinydashboard)
library(plotly)

library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("Viewing Data in Shiny App"),
  sidebarLayout(
    sidebarPanel(
      # UI Input: Button to reload data
      actionButton("load_data", "Load Data")
    ),
    mainPanel(
      # Output: Table to display data
      tableOutput("data_table")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  # Reactive value to store data
  data <- reactiveVal(NULL)
  
  # Load data when button is clicked
  observeEvent(input$load_data, {
    # Load data from CSV using readr
    data <- read_csv("../data/cvd_data.csv")
  })
  
  # Render the table
  output$data_table <- renderTable({
    data()  # Display the loaded data
  })
}

# Run the application
shinyApp(ui = ui, server = server)


