OPENCOESIONE_API_URL <- "http://www.opencoesione.gov.it/api/"

# FROM https://github.com/hrbrmstr/censys/blob/master/R/utils.r

# OPENCOESIONE_API_ID
# OPENCOESIONE_API_SECRET

check_api <- function() {

  id <- Sys.getenv("OPENCOESIONE_API_ID")
  secret <- Sys.getenv("OPENCOESIONE_API_SECRET")

  if (id == "" | secret == "") {
    stop("Both OPENCOESIONE_API_ID and OPENCOESIONE_API_SECRET must be present in the R environment.")
  }

  return(httr::authenticate(id, secret))

}

get_content <- function(x) { jsonlite::fromJSON(rawToChar(x$content))$results }

next_page <- function(x) { jsonlite::fromJSON(rawToChar(x$content))[["next"]] }

check4pkg <- function(x) {
  if (!requireNamespace(x, quietly = TRUE)) {
    stop("Please install ", x, call. = FALSE)
  } else {
    invisible(TRUE)
  }
}