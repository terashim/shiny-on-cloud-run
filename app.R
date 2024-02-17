library(shiny)
library(httr2)

# Cloud Run のリビジョンを取得
get_revision <- function() {
  Sys.getenv("K_REVISION")
}

# Cloud Run のインスタンスIDを取得
get_instance_id <- function() {
  instance_id <- NULL
  try({
    req <-
      request("http://metadata.google.internal/computeMetadata/v1/instance/id") |>
      req_headers(`Metadata-Flavor` = "Google")
    resp <- req |> req_perform()
    instance_id <- rawToChar(resp_body_raw(resp))
  })
  return(instance_id)
}

revision <- get_revision()
instance_id <- get_instance_id()
n <- 200

ui <- fluidPage(
  titlePanel("Shiny on Cloud Run"),
  p("このShinyアプリはCloud Runで実行されています"),
  numericInput('n', 'Number of obs', n),
  plotOutput('plot'),

  h3("システム情報"),
  pre(
    paste0(
      "Revision: ", revision, "\n",
      "Instamce ID: ", instance_id
    )
  ),

  h3("説明"),
  p(
    "このサイトはCloud Runで動作するShinyアプリのデモです。",
    "詳細についてはブログ記事",
    a(
      "ShinyをCloud Runで動かす | terashim.com",
      href="https://terashim.com/shiny-on-cloud-run",
      target="_blank"
    ),
    "をご覧ください。"
  ),
  p(
    "ソースコードは GitHub リポジトリ",
    a(
      "terashim/shiny-on-cloud-run",
      href="https://github.com/terashim/shiny-on-cloud-run",
      target="_blank"
    ),
    "で公開されています。"
  )
)

server <- function(input, output, session) {
  session$allowReconnect("force")

  output$plot <- renderPlot({
    hist(runif(input$n))
  })
}

shinyApp(ui = ui, server = server)
