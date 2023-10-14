#   Libraries
library(tidyverse)
library(readxl)
library(stringr)

#   Importing experimental data
data_raw <- read_excel("thermodynamics\\exp3-4\\equivmec.xlsx",
                       1, col_names = TRUE)

#   Parsing badly formatted PASCO thermistor data
equiv_raw <- paste(readLines("thermodynamics\\exp3-4\\equiv_data.txt"),
                   collapse = "\n")
equiv_clean <- gsub(" ", ",", gsub(",", "\\.", gsub("\\.", "", equiv_raw)))
equiv_list <- lapply(str_split(equiv_clean, "\n")[[1]],
                     function(i) unlist(str_split(i, ",")))
equiv <- as_tibble(t(as_tibble(equiv_list, .name_repair = "minimal")),
                   .name_repair = "minimal")
