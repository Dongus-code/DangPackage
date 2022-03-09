library(billboard)
library(tidyverse)

data("wiki_hot_100s")

songs <- wiki_hot_100s %>%
  mutate(no = case_when(
    no == "Tie" ~ lag(no),
    TRUE ~ no
    )
  ) %>%
  mutate(score = 1 + 1 / as.numeric(no))

songs <- songs %>%
  group_by(title, artist) %>%
  summarise(score = sum(score),
            n_years = n(),
            .groups = "drop")

artists <- songs %>%
  group_by(artist) %>%
  summarise(score = sum(score),
            n = sum(n_years),
            .groups = "drop")


#########################################################################
random_song <- function(artist = "Rihanna", data = billboard::wiki_hot_100s){
  data <- data[data$artists == artist, ]|
  song <- base::sample(data$title, 1)
  cat(paste0("Random song by ", artist, ": ", song))
}
