
#' Get the data
#'
#' Get the data from the API
#'
#' @export
#' @param API_Key API Key present
#' @param territorio Territorio
#' @param tema Tema
#' @param natura Natura
#'
records_by_progetti <- function(API_Key = FALSE, territorio = NULL, tema = NULL, natura = NULL) {

  user_agent <- 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0'

  url <- paste0(OPENCOESIONE_API_URL, "progetti?")

  if(!is.null(territorio)){
    url <- paste0(url, "&territorio=", territorio)
  }

  if(!is.null(tema)){
    url <- paste0(url, "&tema=", tema)
  }

  if(!is.null(natura)){
    url <- paste0(url, "&natura=", natura)
  }

  w <- list()
  i <- 1

  repeat{
    if(API_Key == FALSE){
       Sys.sleep(15)
       res <- httr::GET(url, httr::add_headers("User-Agent" = user_agent))
    } else {
      Sys.sleep(3)
      res <- httr::GET(url, check_api(), httr::add_headers("User-Agent" = user_agent))
    }

    httr::stop_for_status(res)

    srs <- jsonlite::fromJSON(content(res, as="text", encoding = "UTF-8"), flatten=TRUE)
    class(srs) <- c("ropencoesione_srs", class(srs))
    w[[i]] <- srs

    url <- next_page(res)
    if(is.null(url) | i == 3){
      break
    }
    i <- i + 1
  }

  w
}
