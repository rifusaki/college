#Punto 9

d_rockwell <- c(48.68, 48.70, 47.69, 46.23, 
              50.45, 48.61, 48.16, 49.44,
              47.29, 48.58, 48.92, 46.79)

t.test(x=d_rockwell, conf.level = 0.90)$conf.int

#Punto 10

n <- length(d_rockwell)

s <- sd(d_rockwell)

chi_derecha <- round(qchisq(c(0.021),df = n-1,lower.tail = F),3)

chi_izquierda <- round(qchisq(c(0.021),df = n-1,lower.tail = T),3)

LI_scuad = (n-1)*s^2/chi_derecha

LI_ds = round(sqrt(LI_scuad),4)

LS_scuad = (n-1)*s^2/chi_izquierda

LS_ds = round(sqrt(LS_scuad),4)

paste("El intervalo de confianza para la desviación estándar del 99% es:",LI_ds,LS_ds)
