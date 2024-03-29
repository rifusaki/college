#       To-do
# - Simplificar los for loops
# - Parte 2

#   Librerías
library(ggplot2)
library(readxl)
library(Rmpfr)
library(broom)
library(dplyr)

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
simple_scatter <- function(df, n, x, y, labels, title, xlabel, ylabel) {
  p <- ggplot(data = df) +
    geom_point(aes(x = !!as.name(x), y = !!as.name(y),
                   color = names(labels)[[1]]), size = 6) +
    scale_color_manual(values = labels,
                       labels = waiver(),
                       name = "Leyenda") +
    ggtitle(title) +
    scale_x_continuous(name = xlabel) +
    scale_y_continuous(name = ylabel) +
    theme_light() +
    theme(plot.title = element_text(size = 27,
                                    hjust = 0.5, family = "AvantGarde"),
          axis.text = element_text(size = 22, family = "AvantGarde"),
          axis.title = element_text(size = 22, family = "AvantGarde"),
          axis.line.x.bottom = element_line(color = "black", size = 1.1),
          axis.line.y.left = element_line(color = "black", size = 1.1),
          legend.title = element_text(size = 21, family = "AvantGarde"),
          legend.text = element_text(size = 20, family = "AvantGarde"),
          legend.position = c(0.87, 0.5),
          legend.background = element_rect(fill = "white", color = "grey"))

  return(p)
}


#   Temperaturas iniciales y finales en cada caso
params <- c()
for (i in seq_along(data)[-6]) {
  params[[i]] <- c(data[[i]]$Temp[1], tail(data[[i]]$Temp, n = 1))
}


#   Regresión no lineal
# Primero utilicé una self-starting function para estimar el parámetro de
# inicio de k. Luego utilicé nls normal con los parámetros ti y tf conocidos
nls_models <- c()
for (i in seq_along(data)[-6]) {
  nls_models[[i]] <- nls(Temp ~ SSasymp(time, tf, ti, log_k), data = data[[i]])
  ti <- params[[i]][1]
  tf <- params[[i]][2]
  nls_models[[i]] <- nls(Temp ~ tf + (ti - tf) * exp(-k * time),
                         data = data[[i]],
                         start = list(k = exp(coef(nls_models[[i]])[3])))
}

#   Graficar temperatura y regresión
labs <- c("Temperatura medida" = "#3b47fa", "Ajuste" = "#ff9100")

for (i in seq_along(data)[-6]) {
  ti <- params[[i]][1]
  tf <- params[[i]][2]
  k <- coef(nls_models[[i]])

  p <- simple_scatter(data[[i]], i, "time", "Temp", labs,
                      paste("Temperatura (", metadata[[i]][1], "g)", sep = ""),
                      "t [s]", "T [C]")
  p + geom_function(fun = function(time) tf + (ti - tf) * exp(-k * time),
                    aes(x = time, y = 0,
                        color = names(labs)[[2]]), size = 2)

  ggsave(paste("thermodynamics\\exp4\\report\\media\\Tvt_",
               i, ".png", sep = ""),
         width = 40, height = 30, units = "cm")
}


#   Obtener constante de enfriamiento tau
# Sabiendo que tau = 1/k
tau_exp <- c()
for (i in seq_along(data)[-6]) {
  tau_exp[[i]] <- as.numeric(mpfr(1 / (coef(nls_models[[i]])), 20))
}

#   Tau vs masa y area superficial
# Crear dataframe con todos los datos
part1 <- as.data.frame(do.call(rbind, metadata[1:5]))
colnames(part1) <- c("mass", "height", "diameter")
part1 <- part1 %>%
  mutate(
    area = 2 * pi * (diameter / 2) * (height + (diameter / 2))
  )
part1$tau <- unlist(tau_exp)

# tau vs masa
nlabs <- c("Medidas" = "#3b47fa", "Ajuste" = "#ff9100")
p <- simple_scatter(part1, 0, "mass", "tau", nlabs,
                    paste("Tau v. masas de cilindros (g)", sep = ""),
                    "m [g]", "tau [s]")
ggsave(paste("thermodynamics\\exp4\\report\\media\\TauvM.png", sep = ""),
       width = 25, height = 20, units = "cm")

# tau vs area superficial
p <- simple_scatter(part1, 0, "area", "tau", nlabs,
                    paste("Tau v. masas de cilindros (g)", sep = ""),
                    "Asup [cm^2]", "tau [s]")
ggsave(paste("thermodynamics\\exp4\\report\\media\\TauvAsup.png", sep = ""),
       width = 25, height = 20, units = "cm")


#   Para el cilindro calentándose con resistencia
part2 <- as.data.frame(data[[6]])
View(part2)

p <- simple_scatter(data[[6]], 0, "time", "Temp", labs,
                    paste("Temperatura v. tiempo. Bloque con resistencia",
                          sep = ""), "t [s]", "T [C]")

ggsave(paste("thermodynamics\\exp4\\report\\media\\Tvt_res.png", sep = ""),
       width = 40, height = 30, units = "cm")
