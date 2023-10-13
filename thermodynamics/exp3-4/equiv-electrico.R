#   Librerías
library(ggplot2)
library(RColorBrewer)

#   Datos experimentales
data_1 <- read.table("thermodynamics\\exp3-4\\teodiojuan.csv",
                     header = TRUE, sep = ",",
                     colClasses = c("numeric", "numeric", "NULL", "NULL"),
                     skip = -2)
data_1 <- data_1[!is.na(data_1$t1), ]
data_2 <- read.table("thermodynamics\\exp3-4\\teodiojuan.csv",
                     header = TRUE, sep = ",",
                     colClasses = c("NULL", "NULL", "numeric", "numeric"))

#   Calibración del termistor
res_to_temp <- function(df, beta) {
  return(unlist(lapply(df, function(i) beta / log(1000 * i) - 273.15)))
}
beta <- 3950.0  #   Parámetro beta del termistor

#   Equivalente en agua del calorímetro
k_data <- data.frame(M0 = 151.3, T0 = 22,
                     Mc = 139.8, Tc = 90, Te = 52)
k <- (k_data$Mc * (k_data$Tc - k_data$Te)) / (k_data$Te - k_data$T0) - k_data$M0

#   Temperatura, potencia y calor experimental
exp_params <- data.frame(m1_h2o = 90, v1 = 4.9, a1 = 0.4,
                         m2_h2o = 60, v2 = 9.1, a2 = 0.7)

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

#   Equivalente eléctrico
model_1 <- lm(W ~ Q, data = data_1)
cat("  [1] El equivalente es", unlist(model_1$coefficients[[2]]), "J/cal\n")

model_2 <- lm(W ~ Q, data = data_2)
cat("  [2] El equivalente es", unlist(model_2$coefficients[[2]]), "J/cal\n")

#   Gráficas
png(file = "thermodynamics\\exp3-4\\model_1.png", width = 1720, height = 1080)
ggplot(data = data_1) +
  geom_point(aes(x = Q, y = W), size = 7) +
  geom_line(data = data.frame(W_pred = predict(model_1, data_1),
                              Q = data_1$Q), aes(x = Q, y = W_pred)) +
  # theme(text = element_text(size=20)
  theme(plot.title = element_text(size = 16, face = "bold"),
        axis.text = element_text(size = 25),
        axis.title = element_text(size = 30))
dev.off()
