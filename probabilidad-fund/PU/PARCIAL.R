#
#################################  PARCIAL 4  #################################
### Juan Manuel García Mejía
#

library(BSDA)

# 1 - Lentes - RESPUESTA PARCIAL . -3.12
# https://quizizz.com/admin/quiz/5c4b26d8a7acbc001a5a6ffa/prueba-de-hipotesis-uninter
n <- 50
prom <- 4.15
sdev <- 0.58
alfa <- 0.05
mu0 <- 4.25

valor_c <- qnorm(c(alfa/2),mean = 0, sd = 1, lower.tail = F);valor_c
valor_p = round(pnorm(z,lower.tail = F),4); valor_p

z <- (prom - mu0)/((sdev)/sqrt(n));z
ifelse(z > valor_c|z < -valor_c,"Rechace H0", "No rechace H0")



# 2 - Alambre - RESPUESTA PARCIAL
n = 25
prom = 2155
sdev = 45
alfa = 0.05
mu0 = 2150

valor_c <- qnorm(c(alfa),mean = 0, sd = 1, lower.tail = F);valor_c
z <- (prom - mu0)/((sdev)/sqrt(n));z
ifelse(z > valor_c,"Rechace H0", "No rechace H0")


# 3 - Llamas - RESPUESTA PARCIAL (8.6-2)
x = c(9.90, 9.93, 9.85, 9.87, 9.97, 9.87, 9.77, 9.94, 9.85, 9.75, 9.95, 9.92,
      9.84, 9.99, 9.98, 9.95, 9.95, 9.94, 9.92, 9.79)
n = length(x)
prom = mean(x)
sdev = sd(x)
mu0 = 9.75

valor_c <- qnorm(c(0.05),mean = 0, sd = 1, lower.tail = F);valor_c
z <- (prom - mu0)/((sdev)/sqrt(n));z
ifelse(z > valor_c|z < -valor_c,"Rechace H0", "No rechace H0")


# 4 - Mecánico (8.11) FALTA TODO - COPIADO
p0 = 0.75
n = 82
x = 52
pg = x/n
alfa = 0.1

z = round((pg-p0)/sqrt(p0*(1-p0)/n),3);z

valor_c = round(qnorm(c(0.1),mean = 0, sd = 1, lower.tail = F),4); valor_c
valor_p = round(pnorm(z,lower.tail = F),4); valor_p

ifelse(z > valor_c,"Rechazar H0", "No rechazar H0")


# 5 - Licuefacción - 9.1 COMPLETO
x = c(111.1, 111.1, 109.6, 98.1, 99.5, 99.78, 105.3, 108.9, 110.1, 107.1, 110.0,
      98.4, 105.1, 104.5, 105.7, 103.3, 100.3, 102.6, 101.7, 105.4, 99.6, 103.3,
      102.1, 104.3)
y = c(108.1, 106.0, 99.0, 97.9, 103.3, 108.6, 104.1, 98.2, 99.9, 105.2, 97.9)

k = ???
n = length(x)
m = length(y)
xprom = mean(x)
yprom = mean(y)
xsdev = sd(x)
ysdev = sd(y)

prueba.t = t.test(x = x,y = y, alternative ="two.sided", 
                  var.equal= F,conf.level = 0.95 );prueba.t



# 6 - Carga de ruptura - ANALIZAR
x = c(37.4, 58.1, 51.5, 48.7, 53.2, 49.9, 35.9, 49.8)
y = c(38.5, 30.4, 46.5, 44.5, 26.5, 32.5, 36.5, 46.5)

mu0 = 0
alfa = 0.05

pair = t.test(x=x,y=y,alternative = "greater", mu = mu0,
               paired = TRUE, conf.level = 0.95);pair

ifelse(pair$p.value>0.01,"Rechace Ho","Analizar")


# 7 - Velocidad - ANALIZAR
nx = 250
fx = 67
pgx = fx/nx
ny = 200
fy = 85
pgy = fy/ny
alfa = 0.05
pg = (fx+fy)/(nx+ny);pg # atenta

z = (pgx-pgy)/sqrt(pg*(1-pg)*(1/ny+1/nx));z
z.critico = qnorm(c(0.05),lower.tail = T);z.critico

ifelse(z<z.critico, "Rechace H0", "No rechace H0")


# 8 - Concreto - NADA
xed = 7
nx = 78
xprom = 28.59
xsdev = 3.49

yed = 28
ny = 88
yprom = 38.63
ysdev = 4.79


# 9 - Cobre - COMPLETO
s1 = 21.5
m = 38
s2 = 19.45
n = 35

f = s1^2/s2^2;f

f.critico = qf(c(0.1),df1 = m-1,df2 = n-1,lower.tail = T)

ifelse(f < f.critico,"Rechace H0","No rechacde H0")


# Ratones 
x = c(3.1,6.3,2.4,5.6,1.9)
m = 5
y = 