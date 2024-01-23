#### Preamble ####
# Purpose: Obtain and prepare a graph of information related to 
# death registration in Toronto's four municipal centers 
#(Scarborough, North York, Toronto and Etobicoke).
# Author: Xuecheng Gao
# Email: xuecheng.gao@mail.utoronto.ca
# Date: 23 January 2024


#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("tidyverse")
install.packages("janitor")

library(opendatatoronto)
library(tidyverse)
library(janitor)



#### Acquire ####
Death_Registry <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  #https://open.toronto.ca/dataset/death-registry-statistics/
  list_package_resources("cba07a90-984b-42d2-9131-701c8c2a9788")|>
  
  filter(name == 
           "Death Registry Statistics Data.csv") |>
  # Reduced the dataset to one row 
  get_resource()

write_csv(
  x = Death_Registry,
  file = "inputs/data/unedited_data.csv"
)

head(Death_Registry )

