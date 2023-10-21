library(ggplot2)
library(readxl)

#   Datos experimentales
data <- lapply(excel_sheets("thermodynamics\\exp4\\data.xlsx"),
               function(sheet_name) {
                 read_excel("thermodynamics\\exp4\\data.xlsx",
                            sheet = sheet_name)
               })

