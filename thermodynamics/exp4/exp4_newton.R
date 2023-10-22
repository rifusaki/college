library(ggplot2)
library(readxl)

#   Datos experimentales
#   Las tablas están ordenadas de menos a mayor masa
#   La última tabla es la de la masa con resistencia interna
data <- lapply(excel_sheets("thermodynamics\\exp4\\data.xlsx"),
               function(sheet_name) {
                 read_excel("thermodynamics\\exp4\\data.xlsx",
                            sheet = sheet_name, skip = 1,
                            col_names = c("Temp", "time"))
               })

#   Metadatos
#   c(masa (g), altura (cm), diámetro (cm), [volaje (V)], [corriente (A)])
metadata <- list(c(14.8, 1.6, 1.27),
                 c(21, 2.22, 1.256),
                 c(30.7, 3.21, 1.26),
                 c(40.6, 4.24, 1.26),
                 c(50.2, 5.25, 1.26),
                 c(183.3, 6.332, 2.21, 5, 0.8))

#   Función para graficar una lista de tablas en scatterplot
simple_scatter <- function(df, n, x, y, legend_1, title, xlabel, ylabel) {
  p <- ggplot(data = df) +
    geom_point(aes(x = !!as.name(x), y = !!as.name(y),
                   color = legend_1), data = df, size = 6) +
    scale_color_manual(values = c(legend_1 = "#3b47fa"),
                       labels = c(legend_1),
                       name = "Leyenda") +
    ggtitle(title) +
    scale_x_discrete(name = xlabel) +
    scale_y_discrete(name = ylabel) +
    theme_light() +
    theme(plot.title = element_text(size = 27,
                                    hjust = 0.5, family = "AvantGarde"),
          axis.text = element_text(size = 22, family = "AvantGarde"),
          axis.title = element_text(size = 22, family = "AvantGarde"),
          axis.line.x.bottom = element_line(color = "black", size = 1.1),
          axis.line.y.left = element_line(color = "black", size = 1.1),
          legend.title = element_text(size = 21, family = "AvantGarde"),
          legend.text = element_text(size = 20, family = "AvantGarde"),
          legend.position = c(0.87, 0.1),
          legend.background = element_rect(fill = "white", color = "grey"))

  return(p)
}

#   Graficar temperatura en todos los casos
for (i in seq_along(data)) {
  png(file = paste("thermodynamics\\exp4\\report\\out_", i, ".png", sep = ""),
      width = 1720, height = 1080, res = 100)

  print(simple_scatter(data[[i]], i, "time", "Temp", "Temperatura medida",
                       paste("Temperatura (", metadata[[i]][1], "g)", sep = ""),
                       "t [s]", "T [C]"))

  dev.off()
}

