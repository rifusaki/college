#   Librerías
library(ggplot2)
library(stringr)

#   Datos experimentales
data_1 <- read.table("thermodynamics\\exp2-3\\teodiojuan.csv",
                     header = TRUE, sep = ",",
                     colClasses = c("numeric", "numeric", "NULL", "NULL"),
                     skip = -2)
data_1 <- data_1[!is.na(data_1$t1), ]
data_2 <- read.table("thermodynamics\\exp2-3\\teodiojuan.csv",
                     header = TRUE, sep = ",",
                     colClasses = c("NULL", "NULL", "numeric", "numeric"))

#   Calibración del termistor
res_to_temp <- function(df, beta) {
  return(unlist(lapply(df, function(i) beta / log(10000 * i))))
}
beta <- 3950.0  #   Parámetro beta del termistor

#   Equivalente en agua del calorímetro
k_data <- data.frame(M0 = 151.3, T0 = 22,
                     Mc = 139.8, Tc = 90, Te = 52)
k <- (k_data$Mc * (k_data$Tc - k_data$Te)) / (k_data$Te - k_data$T0) - k_data$M0

#   Temperatura, potencia y calor experimental
exp_params <- data.frame(m1_h2o = 158, v1 = 4.9, a1 = 0.4,
                         m2_h2o = 147, v2 = 9.1, a2 = 0.7)

data_1$Te <- res_to_temp(data_1$R1, beta)   #  Temperatura
data_1$W <- with(data_1,                    #  Trabajo eléctrico
                 t1 * exp_params$v1 * exp_params$a1)
data_1$Q <- with(data_1,                    #  Calor
                 (exp_params$m1_h2o + k) * (Te - data_1$Te[1]))

data_2$Te <- res_to_temp(data_2$R2, beta)
data_2$W <- with(data_2,
                 t2 * exp_params$v2 * exp_params$a2)
data_2$Q <- with(data_2,
                 (exp_params$m2_h2o + k) * (Te - data_2$Te[1]))

#   Gráficas temperatura
png(file = "thermodynamics\\exp2-3\\report\\temp_1.png",
    width = 1720, height = 1080, res = 100)
ggplot(data = data_1) +
  geom_point(aes(x = t1, y = Te, color = "Temperatura"), size = 6) +
  scale_color_manual(values = c("Temperatura" = "#3b47fa"),
                     labels = c("Temperatura"),
                     name = "Leyenda") +
  ggtitle("Serie 1: Temperatura") +
  scale_x_continuous(name = "t [s]") +
  scale_y_continuous(name = "T [K]") +
  theme_light() +
  theme(plot.title = element_text(size = 30,
                                  hjust = 0.5, family = "AvantGarde"),
        axis.text = element_text(size = 22, family = "AvantGarde"),
        axis.title = element_text(size = 25, family = "AvantGarde"),
        axis.line.x.bottom = element_line(color = "black", size = 1.1),
        axis.line.y.left = element_line(color = "black", size = 1.1),
        legend.title = element_text(size = 21, family = "AvantGarde"),
        legend.text = element_text(size = 20, family = "AvantGarde"),
        legend.position = c(0.87, 0.1),
        legend.background = element_rect(fill = "white", color = "grey"))
dev.off()

png(file = "thermodynamics\\exp2-3\\report\\temp_2.png",
    width = 1720, height = 1080, res = 100)
data_2_t <- subset(data_2, t2 > 0)
ggplot(data = data_2_t) +
  geom_point(aes(x = t2, y = Te, color = "Temperatura"), size = 6) +
  scale_color_manual(values = c("Temperatura" = "#3b47fa"),
                     labels = c("Temperatura"),
                     name = "Leyenda") +
  ggtitle("Serie 2: Temperatura") +
  scale_x_continuous(name = "t [s]") +
  scale_y_continuous(name = "T [K]") +
  theme_light() +
  theme(plot.title = element_text(size = 30,
                                  hjust = 0.5, family = "AvantGarde"),
        axis.text = element_text(size = 22, family = "AvantGarde"),
        axis.title = element_text(size = 25, family = "AvantGarde"),
        axis.line.x.bottom = element_line(color = "black", size = 1.1),
        axis.line.y.left = element_line(color = "black", size = 1.1),
        legend.title = element_text(size = 21, family = "AvantGarde"),
        legend.text = element_text(size = 20, family = "AvantGarde"),
        legend.position = c(0.87, 0.1),
        legend.background = element_rect(fill = "white", color = "grey"))
dev.off()

#   Equivalente eléctrico
model_1 <- lm(W ~ Q, data = data_1)
cat("  [1] El equivalente es", unlist(model_1$coefficients[[2]]), "J/cal\n")

model_2 <- lm(W ~ Q, data = data_2, subset = (W > 0))
cat("  [2] El equivalente es", unlist(model_2$coefficients[[2]]), "J/cal\n")

#   Gráficas calor y trabajo
png(file = "thermodynamics\\exp2-3\\report\\model_1.png",
    width = 1720, height = 1080, res = 100)
ggplot(data = data_1) +
  geom_line(data = data.frame(W_pred = predict(model_1, data_1),
                              Q = data_1$Q), aes(x = Q, y = W_pred,
                                                 color = "Ajuste"), size = 2) +
  geom_point(aes(x = Q, y = W, color = "Datos experimentales"), size = 6) +
  scale_color_manual(values = c("Datos experimentales" = "#9e57be",
                                "Ajuste" = "#f02d2d"),
                     labels = c(str_glue("W(Q) = ({formatC(unlist(model_1$coefficients[[2]]), digits = 3, format = 'f')})Q + {formatC(unlist(model_1$coefficients[[1]]), digits = 3, format = 'f')}"),
                                "Datos experimentales"),
                     name = "Leyenda") +
  ggtitle("Serie 1: Trabajo y calor") +
  scale_x_continuous(name = "Q [cal]") +
  scale_y_continuous(name = "W [J]") +
  theme_light() +
  theme(plot.title = element_text(size = 30,
                                  hjust = 0.5, family = "AvantGarde"),
        axis.text = element_text(size = 22, family = "AvantGarde"),
        axis.title = element_text(size = 25, family = "AvantGarde"),
        axis.line.x.bottom = element_line(color = "black", size = 1.1),
        axis.line.y.left = element_line(color = "black", size = 1.1),
        legend.title = element_text(size = 21, family = "AvantGarde"),
        legend.text = element_text(size = 20, family = "AvantGarde"),
        legend.position = c(0.87, 0.1),
        legend.background = element_rect(fill = "white", color = "grey"))
dev.off()

png(file = "thermodynamics\\exp2-3\\report\\model_2.png",
    width = 1720, height = 1080, res = 100)
data_2_sub <- subset(data_2, Q > 0)
ggplot(data = data_2_sub) +
  geom_line(data = data.frame(W_pred = predict(model_2, data_2_sub),
                              Q = data_2_sub$Q), aes(x = Q, y = W_pred,
                                                     color = "Ajuste"),
            size = 2) +
  geom_point(aes(x = Q, y = W, color = "Datos experimentales"), size = 6) +
  scale_color_manual(values = c("Datos experimentales" = "#9e57be",
                                "Ajuste" = "#f02d2d"),
                     labels = c(str_glue("W(Q) = ({formatC(unlist(model_2$coefficients[[2]]), digits = 3, format = 'f')})Q - {formatC(abs(unlist(model_2$coefficients[[1]])), digits = 3, format = 'f')}"),
                                "Datos experimentales"),
                     name = "Leyenda") +
  ggtitle("Serie 2: Trabajo y calor") +
  scale_x_continuous(name = "Q [cal]") +
  scale_y_continuous(name = "W [J]") +
  theme_light() +
  theme(plot.title = element_text(size = 30,
                                  hjust = 0.5, family = "AvantGarde"),
        axis.text = element_text(size = 22, family = "AvantGarde"),
        axis.title = element_text(size = 25, family = "AvantGarde"),
        axis.line.x.bottom = element_line(color = "black", size = 1.1),
        axis.line.y.left = element_line(color = "black", size = 1.1),
        legend.title = element_text(size = 21, family = "AvantGarde"),
        legend.text = element_text(size = 20, family = "AvantGarde"),
        legend.position = c(0.87, 0.1),
        legend.background = element_rect(fill = "white", color = "grey"))
dev.off()