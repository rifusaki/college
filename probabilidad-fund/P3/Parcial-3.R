
#### PROBABILIDAD Y ESTADÍSTICA FUNDAMENTAL  #####
###################  PARCIAL 3  ###################
#
# Wullfredo Javier Barco Godoy
# Ángela Zoraya Cortés Yepes
# Juan Manuel Garcia Mejia
# Andrés Felipe Patiño Nivia
# Jafeth Paz Cortés
#
###################################################


# 1 - Saturación de gas residual
m1 <- c(23.5, 31.5, 34.0, 46.7, 45.6, 32.5, 41.4, 37.2, 42.5,
        46.9, 51.5, 36.4, 44.5, 35.7, 33.5, 39.3, 22.0, 51.2)

qqnorm(m1, main="QQ plot de una normal"); qqline(m1) # Gráfico de normalidad

s_mu <- sd(m1) # Desv estandar
n <- length(m1) # Cantidad de datos
prom <- mean(m1) # Promedio

t_crit <- round(qt(c(0.025),df = n-1,lower.tail = F),3)
LI_mu <- round(prom - t_crit*s_mu/sqrt(n),3)
LS_mu <- round(prom + t_crit*s_mu/sqrt(n),3)

paste("El intervalo de confianza para mu del 95% es:",LI_mu,LS_mu)

t.test(x = m1, y = NULL,alternative = "two.sided", conf.level = 0.95) # El método que se utilizó en realidad


# 2 - Medios inalambricos
x2 = 1262; n2 = 2253

prop.test(x=1262, n=2253, conf.level=0.95)$conf.int


# 3 - Pasajeros de aerolinea
Pasajeros <- c(163, 165, 094, 137, 123, 095, 170, 096, 117, 129,
               152, 138, 147, 119, 166, 125, 148, 180, 152, 149,
               167, 120, 129, 159, 150, 119, 113, 147, 169, 151,
               116, 150, 110, 110, 143, 090, 134, 145, 156, 165,
               174, 133, 128, 100, 086, 148, 139, 150, 145, 100)

mean(Pasajeros) # utilizamos Z= (X-x)/s ~N(0,1)
t.test(Pasajeros,conf.level = 0.95)


# 4 - Ruptura de circuitos electricamente sobrecargados
datosenunciado<-c(1470, 1510, 1690, 1740, 1900, 2000, 2030, 2100, 2190, 2200,
                  2290, 2380, 2390,  2480, 2500, 2580, 2700)
mean(datosenunciado)
media<-mean(datosenunciado)
z<- 1.96
length(datosenunciado)
n<- length(datosenunciado)
sd(datosenunciado)
desviacion<-(sd(datosenunciado))
errorestandar<- desviacion/sqrt(n)
lim_inf<-media-(z*errorestandar)
lim_sup<-media+(z*errorestandar)
resultado<- data.frame(n, desviacion, errorestandar, lim_inf, lim_sup)


# 5 - Visita de animales domesticos al veterinario en un a�o
media<-3.59
desviacion<-1.045
x_1<-3.49
x_2<-3.69
z<-(x_2-media)/desviacion # el valor que buscamos en la tabla 
  # si a+IC=53.59 entonces 
  b<-46.41 # en consecuencia,
  a<-46.41
porcentajedeintervalodeconfianza<-100-a-b # el porcentaje de este intervalo es 7.18


# 6 - Asbesto y elasticidad pulmonar
m6 <- c(167.9, 180.8, 184.8, 189.8, 194.8, 200.2, 201.9, 206.9,
        207.2, 208.4, 226.3, 227.7, 228.5, 232.4, 239.8, 258.6)

t.test(x = m6, y = NULL,alternative = "two.sided", conf.level = 0.99)

qqnorm(m6, main="QQ plot de una normal")
qqline(m6)


# 7 - Secado de pintura
B = c(2.8,3.3,5.6,3.7,2.8,4.4,4.0,5.2,3.0,4.8,3.4,2.5,4.8,2.9,3.6)

boxplot(B,horizontal = T)
t.test(x =B,conf.level = 0.95)$conf.int


# 8 - Conjetura
# n=(z^2??/2)/4e^2
# Z??/2= Z0.005= 2.575
e <- 0.01
z <- 2.575
n <-(z^2)/(4*(e^2)); n


# 9 - Dureza de Rockwell en cabeza de alfileres
d_rockwell <- c(48.68, 48.70, 47.69, 46.23, 
                50.45, 48.61, 48.16, 49.44,
                47.29, 48.58, 48.92, 46.79)

t.test(x=d_rockwell, conf.level = 0.90)$conf.int


# 10 - Rockwell, parte 2
n <- length(d_rockwell)
s <- sd(d_rockwell)

chi_derecha <- round(qchisq(c(0.021),df = n-1,lower.tail = F),3)
chi_izquierda <- round(qchisq(c(0.021),df = n-1,lower.tail = T),3)

LI_scuad = (n-1)*s^2/chi_derecha
LI_ds = round(sqrt(LI_scuad),4)
LS_scuad = (n-1)*s^2/chi_izquierda
LS_ds = round(sqrt(LS_scuad),4)

paste("El intervalo de confianza para la desviacion est�ndar del 99% es:",LI_ds,LS_ds)

