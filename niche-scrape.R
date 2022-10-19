# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)
library(lubridate)
library(robotstxt)
library(dplyr)

# check that we can scrape data from Forbes ------------------------------------

paths_allowed("https://www.niche.com/colleges/search/best-colleges/")

# read page --------------------------------------------------------------------

page <- read_html("https://www.niche.com/colleges/search/best-colleges/")

# parse components -------------------------------------------------------------

scrape_niche <- function(url){

  Sys.sleep(runif(1, min = 0, max = 5))

  page <- read_html(url)

  colleges <- page |>
    html_elements(".nss-griot4 .nss-ihhgee") |>
    html_text()

  ranks <- page |>
    html_elements(".search-result-badge") |>
    html_text() |>
    str_remove("#") |>
    str_remove(" Best Colleges in America") |>
    as.numeric()

  tibble(
    college = colleges,
    rank = ranks
  )
}

# didn't work ---
one_to_five_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(1:5)))
six_to_ten_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(6:10)))

one_to_five_data <- map_dfr(one_to_five_urls, scrape_niche)
six_to_ten_data <- map_dfr(six_to_ten_urls, scrape_niche)
#---

page1 <- scrape_niche("https://www.niche.com/colleges/search/best-colleges/?page=1")
page2 <- scrape_niche("https://www.niche.com/colleges/search/best-colleges/?page=2")
page3 <- scrape_niche("https://www.niche.com/colleges/search/best-colleges/?page=3")


first_three_pages <- merge(page1, merge(page2, page3, all = TRUE), all = TRUE) |>
  arrange(rank)

write_csv(first_three_pages, "data/first_three_pages_niche.csv")

thirteen_to_sixteen_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(13:16)))
seventeen_to_twenty_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(17:20)))

four_to_seven <- map_dfr(urls, scrape_niche)
eight_to_twelve <- map_dfr(urls, scrape_niche)
thirteen_to_sixteen <- map_dfr(thirteen_to_sixteen_urls, scrape_niche)
seventeen_to_twenty <- map_dfr(seventeen_to_twenty_urls, scrape_niche)


one_to_three <- read_csv("data/first_three_pages_niche.csv")

one_to_twelve <- bind_rows(one_to_three, four_to_seven, eight_to_twelve)
write_csv(one_to_twelve, "data/one_to_twelve.csv")


one_to_twelve <- read_csv("data/one_to_twelve.csv")
one_to_sixteen <- bind_rows(one_to_twelve, thirteen_to_sixteen)
write_csv(one_to_sixteen, "data/one_to_sixteen.csv")


# this causes an error 403
niche_rankings <- map_dfr(urls, scrape_niche)

