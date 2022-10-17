# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)
library(lubridate)
library(robotstxt)

# check that we can scrape data from Forbes ------------------------------------

paths_allowed("https://www.forbes.com/top-colleges/")

# read page --------------------------------------------------------------------

page <- read_html("https://www.forbes.com/top-colleges/")

# parse components -------------------------------------------------------------

college <- page |>
  html_elements(".table-row .organizationName") |>
  html_text()

