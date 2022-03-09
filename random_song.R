#' Select a Random Song
#'
#' @param artist A band/artist to select a song from
#' @param data The dataset to use; defaults to billboard::wiki_hots_100s
#'
#' @return A random song get printed on the console
#' @export
#'
#' @examples random_song()
#' @examples random_song("Eminem")
#' @examples random_song(artist = "The Beatles")

random_song <- function(artist = "Rihanna", data = billboard::wiki_hot_100s){
  data <- data[data$artist == artist, ]
    song <- base::sample(data$title, 1)
    cat(paste0("Random song by ", artist, ": ", song))
}

