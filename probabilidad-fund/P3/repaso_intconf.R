
###########################


url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo'
datos <- read.table(file=url, header=T)
hombres <- datos[datos$sexo=="Hombre", ]

par(mfrow=c(1, 2))
require(car)  # Debe instalar antes el paquete car
qqPlot(hombres$altura, pch=19,
       main='QQplot para la altura de hombres',
       xlab='Cuantiles teóricos',
       ylab='Cuantiles muestrales')

hist(hombres$altura, freq=TRUE,
     main='Histograma para la altura de hombres',
     xlab='Altura (cm)',
     ylab='Frecuencia')

t.test(x=hombres$altura, conf.level=0.95)$conf.int

###########################

###Repaso

# 1. Intervalo de confianza para mu, cuando se conoce sigma

# InC_mu = xbarra +/- zalfa/2*sigma/raiz(n)

#Ej 4

zalfa_med_t =round(qnorm(c(0.05,0.025,0.005),0,1,lower.tail = F),2)

sigma_mu = 3.0

n = 25

xbarra = 58.3

zalfa_med = qnorm(c(0.025),0,1,lower.tail = F)

li = xbarra-zalfa_med*sigma_mu/sqrt(n);li

ls = xbarra+zalfa_med*sigma_mu/sqrt(n);ls

###Tamanio de muestra

# tamanio de muestra para el 99% de confianza

w = 1 # longitud del intervalo

zalfa_med = qnorm(c(0.005),0,1,lower.tail = F)

tam_mue = round((2*zalfa_med*sigma_mu/w)^2,2);tam_mue

#Intervalo de confianza para la proporcion
#

#El gerente de una estación de televisión debe determinar 
#en la ciudad qué porcentaje de casas tienen más de un televisor.
#Una muestra aleatoria de 500 casas revela que 275 tienen 
#dos o más televisores.
#¿Cuál es el intervalo de confianza del 90% para estimar 
#la proporción de todas las casas que tienen dos o más televisores?

n =500

x = 275

pgorro = x/n

zalfa_med = qnorm(c(0.05),0,1,lower.tail = F)

li = pgorro-zalfa_med*sqrt(pgorro*(1-pgorro)/n);li

prop.test(x=275, n=500, conf.level=0.90)$conf.int

ls = pgorro+zalfa_med*sqrt(pgorro*(1-pgorro)/n);ls



##Ejercicio 14

n =169

xbarra = 89.1

s = 3.73

A= Ejercicio14

mean(A$x)

sd(A$x)


z.test(x=A,alternative = "two.sided",mu =0,sigma.x = 2.73, conf.level=0.95)$conf.int

xbarra = mean(A$x)

s_muestra = sd(A$x)# desv est de la muestra

zalfa_med = qnorm(c(0.025),0,1,lower.tail = F)

li = xbarra-zalfa_med*s_muestra/sqrt(n);li

ls = xbarra+zalfa_med*s_muestra/sqrt(n);ls

######Intervalo de confianza para mu con poblacion normal
## y varianza desconocida

t.test(x = A,conf.level = 0.95)$conf.int

##Ejercio

B = c(418,421,421,422, 425,427,431,434,437,439,446,447,448,
      453,454,463,465)

boxplot(B,horizontal = T)



t.test(x =B,conf.level = 0.95)$conf.int

####

if (!require('devtools')) install.packages('devtools')
devtools::install_github('fhernanb/stests', force=TRUE)

library(stests)

library(EnvStats)

?varTest

C = c(1470,1510,1690,1740,1900,2000,2030,2100,2190,
      2200,2290,2380,2390,2480,2500,2580,2700)

sqrt(varTest(x=C,conf.level = 0.95)$conf.int)

n = length(C)

s_muestra = sd(C)

chi_inf = qchisq(c(0.025),df = n-1,lower.tail = F)

chi_sup = qchisq(c(0.025),df = n-1,lower.tail = T)

li = (n-1)*s_muestra^2/chi_inf;li

ls = (n-1)*s_muestra^2/chi_sup;ls


