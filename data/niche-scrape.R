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

# Error if trying to scrape all 20 pages at once, so scraped in 4 sessions

# First session ----------------------------------------------------------------

one_to_three_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(1:3)))
one_to_three <- map_dfr(four_to_seven_urls, scrape_niche)
write_csv(first_three_pages, "data/first_three_pages_niche.csv")

# Second session ---------------------------------------------------------------

four_to_seven_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(4:7)))
four_to_seven <- map_dfr(four_to_seven_urls, scrape_niche)

eight_to_twelve_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(8:12)))
eight_to_twelve <- map_dfr(eight_to_twelve_urls, scrape_niche)

one_to_three <- read_csv("data/first_three_pages_niche.csv")

one_to_twelve <- bind_rows(one_to_three, four_to_seven, eight_to_twelve)
write_csv(one_to_twelve, "data/one_to_twelve.csv")

# Third session ----------------------------------------------------------------

thirteen_to_sixteen_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(13:16)))
thirteen_to_sixteen <- map_dfr(thirteen_to_sixteen_urls, scrape_niche)

one_to_twelve <- read_csv("data/one_to_twelve.csv")

one_to_sixteen <- bind_rows(one_to_twelve, thirteen_to_sixteen)
write_csv(one_to_sixteen, "data/one_to_sixteen.csv")

# Fourth session ---------------------------------------------------------------

seventeen_to_twenty_urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(17:20)))
seventeen_to_twenty <- map_dfr(seventeen_to_twenty_urls, scrape_niche)

one_to_sixteen <- read_csv("data/one_to_sixteen.csv")

niche_data <- bind_rows(one_to_sixteen, seventeen_to_twenty)
write_csv(niche_data, "data/niche_data_500")


