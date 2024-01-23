#### Preamble ####
# Purpose: Obtain and prepare a graph of information related to 
# death registration in Toronto's four municipal centers 
#(Scarborough, North York, Toronto and Etobicoke).
# Author: Xuecheng Gao
# Email: xuecheng.gao@mail.utoronto.ca
# Date: 23 January 2024


#### Workspace setup ####
install.packages("tidyverse")
install.packages("janitor")
install.packages("lubridate")


library(janitor)
library(lubridate)
library(tidyverse)




#### Simulate data ####
set.seed(888)

number_of_years <- 13

simulated_DEATH_LICENSES_data <-
  tibble(
    CIVIC_CENTRE =
      c(rep("ET", number_of_years), rep("NY", number_of_years), 
        rep("TO", number_of_years), rep("SC", number_of_years)),
    year =
      rep(c(1:number_of_years + 2010), 4),
    DEATH_LICENSES =
      runif(n = 52, min = 0, max = 1500)
  )

head(simulated_DEATH_LICENSES_data)

simulated_DEATH_LICENSES_data$CIVIC_CENTRE |>
  unique() == c("ET", "NY", "TO", "SC")

simulated_DEATH_LICENSES_data$CIVIC_CENTRE |>
  unique() |>
  length() == 4

simulated_DEATH_LICENSES_data$year |> min() == 2011
simulated_DEATH_LICENSES_data$year |> max() == 2023
simulated_DEATH_LICENSES_data$DEATH_LICENSES |> min() >= 0
simulated_DEATH_LICENSES_data$DEATH_LICENSES |> max() <= 1500
simulated_DEATH_LICENSES_data$DEATH_LICENSES |> class() == "numeric"