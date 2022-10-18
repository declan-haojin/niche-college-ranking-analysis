# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)
library(lubridate)
library(robotstxt)
library(dplyr)

# check that we can scrape data from Forbes ------------------------------------

paths_allowed("https://www.niche.com/colleges/search/best-colleges/?page=1")

# read page --------------------------------------------------------------------

page <- read_html("https://www.niche.com/colleges/search/best-colleges/")

# parse components -------------------------------------------------------------

urls <- c(str_c("https://www.niche.com/colleges/search/best-colleges/?page=", c(1:20)))

scrape_niche <- function(url){
  Sys.sleep(runif(1))
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

page1 <- scrape_niche("https://www.niche.com/colleges/search/best-colleges/?page=1")
page2 <- scrape_niche("https://www.niche.com/colleges/search/best-colleges/?page=2")
page3 <- scrape_niche("https://www.niche.com/colleges/search/best-colleges/?page=3")

first_three_pages_list <- c(page1, page2, page3)

first_three_pages <- merge(page1, merge(page2, page3, all = TRUE), all = TRUE) |>
  arrange(rank)

write_csv(first_three_pages, "data/first_three_pages_niche.csv")


# this causes an error 403
niche_rankings <- map_dfr(urls, scrape_niche)

