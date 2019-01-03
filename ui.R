library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "BItools (by zsq)"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Bubble chart", tabName = "bubbleplot"),
      menuItem("Heatmap chart", tabName = "heatmapplot")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("bubbleplot",
              fluidRow(
                column(width = 8,
                       box(width = NULL,solidHeader = TRUE,
                           plotOutput("bubblechartplot", height = 500)
                         )
                       ),
                column(width = 4,
                       box(width = NULL,status = "warning",
                           fileInput("filename1","Choose File to Upload:", accept = c(".txt")),
                           numericInput("bubbleheigh",label = "Graph heigh value",value = 4),
                           numericInput("bubblewidth",label = "Graph width value",value = 10),
                           downloadButton("downloadbubble",label = "Download Bubble chart")
                       )
                )
      
              )
       ),
       tabItem("heatmapplot",
            fluidRow(
              column(width = 8,
                     box(width = NULL,solidHeader = TRUE,
                         plotOutput("heatmapchartplot",height = 500)
                       ),
                     fluidRow(
                       column(width = 8,
                              box(width = NULL, status = "info",
                                  title = "Download Heatmap chart",
                                  numericInput("heatmapheigh",label = "Graph heigh",value = 20),
                                  numericInput("heatmapwidth",label = "Graph width",value = 10),
                                  downloadButton("downloadheatmap",label = "Download Heatmap chart") 
                              )
                       )
                     )
                    ),
              column(width = 4,
                   box(title = "Parameter for heatmap",
                     width =NULL, status = "warning",
                     fileInput("filename2","Choose File to Upload:", accept = c(".txt")),
                     selectInput("color", label = "Select color for data",
                                 c("green yellow red", "blue yellow red")),
                     
                     selectInput("scale", label = "Select scale for data",
                                 c("row", "column", "none")),
                     selectInput("clusterrows", label = "Select cluster rows for cluster",
                                 c("TRUE", "FALSE")),
                     selectInput("clustercols", label = "Select cluster columns for cluster",
                                 c("TRUE", "FALSE")),
                     selectInput("algorithm", label = "Select algorithm to cluster",
                                 c("complete", "single", "average", "centroid", "median")),
                     selectInput("rownames", label = "Select show row name",
                                 c("TRUE", "FALSE")),
                     selectInput("colnames", label = "Select show column name",
                                 c("TRUE", "FALSE")),
                     numericInput("cellheight",label = "Cell heigh value",value = 1),
                     numericInput("cellwidth",label = "Cell width value",value = 20)
                   )
        )
      )
    )
  )
 )  
)