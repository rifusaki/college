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
  return(lapply(df, function(i) beta / log(1000 * i) - 273.15))
}
beta <- 3950.0  #   Parámetro beta del termistor

#   Equivalente en agua del calorímetro
mamaguevodigoglugluglu <- data.frame(M0 = 151.3, T0 = 22,
                                     Mc = 139.8, Tc = 90, Te = 52)
k <- (mamaguevodigoglugluglu$Mc * (mamaguevodigoglugluglu$Tc - mamaguevodigoglugluglu$Te)) / (mamaguevodigoglugluglu$Te - mamaguevodigoglugluglu$T0) - mamaguevodigoglugluglu$M0

#   Temperatura, potencia y calor experimental
m_h2o <- 150.0

data_1$Te <- res_to_temp(data_1$R1, beta)   #  Temperatura
data_1$W <- with(data_1, t * 0.9 * 4.9)     # Trabajo eléctrico
# data_1$Q <- with(data_1, (150.0 + 25.78) * (Te - 64.11))

data_2$R2 <- res_to_temp(data_2$R2, beta)
colnames(data_2) <- c("t", "Te")
data_2$W <- with(data_2, t * 0.9 * 4.9)
