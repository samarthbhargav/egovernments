shinyUI(fluidPage(
  titlePanel("Egovernments"),
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        selectInput(
          "complaintType", label = h5("Select Complaint Type"), 
          choices = c( "All", unique(as.character(df$Complaint.Type)))
        ),
        selectInput(
          "ward", label = h5("Select Ward"),
          choices = c("All", as.character(unique(df$Ward)))
        ),
        selectInput(
          "timePeriod", label = h5("Select Time Period"),
          choices = choicesForTime
        ),
        dateRangeInput(
          "dateRange", label = "Date Range",
          min=minDate, max=maxDate,
          start=minDate, end=maxDate
        )
      )
    ),
    mainPanel(
      fluidRow(
        column(12,
          tableOutput("outputSummary")
        ),
        column(12,
         plotOutput("plotData")
        )
      )
    )
  )
))