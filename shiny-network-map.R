# Load the Shiny library
library(shiny)

# Define the UI/UX for the application
ui <- fluidPage(
  titlePanel("Shiny Network Map"),   # Title of the application
  sidebarLayout(
    sidebarPanel(
      textInput("ip", "Enter IP range or hostname:", value = ""),   # Input field for IP range or hostname
      actionButton("scan", "Scan")   # Scan button
    ),
    mainPanel(
      tableOutput("results")   # Output table to show the scan results
    )
  )
)

# TODO change to -T0 sltealthy slow nmap scan by default and add option to change flags

# Define the server logic
server <- function(input, output) {
  scan_data <- reactive({
    if (input$scan > 0) {  # Check if the scan button is clicked
      system_output <- system(paste("nmap -sC -sV -p-", 
                                    input$ip), intern = TRUE)  # Run the 'nmap' command with the input IP range or hostname
      scan <- as.data.frame(system_output)  # Convert the output to a dataframe
      return(scan)  # Return the scan results
    }
  })
  
  # Render the scan results as a table
  output$results <- renderTable({
    scan_data()
  })
}

shinyApp(ui, server, options = "launch.browser")
