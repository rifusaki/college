#Prueba de hipótesis####

#Ejempolo 8.6

#Caso I 

# Poblacion normal y varianza conocida

n <- 9

xbarra <- 131.08

sigma_mu <- 1.5

alfa <- 0.01

mu_0 <- 130

valor_c <- qnorm(c(alfa/2),mean = 0, sd = 1, lower.tail = F);valor_c

#H0: mu = 130 = mu_0

#H1: mu (dif) 130

# z = (xbarra -mu_0)/(sigma_mu / raiz(n))

z <- (xbarra - mu_0)/((sigma_mu)/sqrt(n));z

ifelse(z > valor_c|z < -valor_c,"Rechace H0", "No rechace H0")

# paquete BSDA

?z.test

?rnorm

# Otro ejemplo

#H0: mu = 130.6

#H1: mu (dif) 130.6

round(rnorm(9,mean = 130, sd =1.5),2)

x <- c(129.33, 131.84, 130.54, 130.60, 130.17, 129.17,
       132.68, 130.75, 127.05)  

sigma_x <- sd(x)

z.test(x,y = NULL,alternative = "two.sided", mu = 130.0, sigma.x = sigma_x,
       sigma.y = NULL,conf.level=0.95)

z <- (mean(x) - mu_0)/((sigma_x)/sqrt(n));z

# Caso II

# Tamanio de muestra grande

# Z = (xbarra-mu_0)/ (S/raiz(n))

x <- c(14.1, 14.5, 15.5, 16.0, 16.0, 16.7, 16.9, 17.1,
       17.5, 17.8, 17.8, 18.1, 18.2, 18.3, 18.3, 19.0,
       19.2, 19.4, 20.0, 20.0, 20.8, 20.8, 21.0, 21.5,
       23.5, 27.5, 27.5, 28.0, 28.3, 30.0, 30.0, 31.6,
       31.7, 31.7, 32.5, 33.5, 33.9, 35.0, 35.0, 35.0,
       36.7, 40.0, 40.0, 41.3, 41.7, 47.5, 50.0, 51.0,
       51.8, 54.4, 55.0, 57.0)
length(x)

n <- length(x)

xbarra <- round(mean(x),2)

ds_mu <- round(sd(x),2)

mu_0 <- 30

#H0: mu = 30

#H1: mu < 30

valor_c <- qnorm(c(0.05),mean = 0,sd = 1, lower.tail = T)

z <- (xbarra - mu_0)/((ds_mu)/sqrt(n));z

ifelse(z < valor_c,"Rechace que mu es igual a 30","Rechace que mu < 30")

#otra forma

z.test(x,alternative = "less", mu = mu_0,sigma.x = ds_mu)

ifelse(z < valor_c,"Rechace H0","No rechace H0")

# Caso III Población normal y varianza desconocida

# T = (Xbarra-mu_0)/(S/raiz(n))

#Ejemplo 8.9

#H0: mu = 4

#H1: mu dif 4 # prueba de dos colas

x <- c(2.67, 4.62, 4.14, 3.81, 3.83)

mu_0 <- 4

n <- length(x)

xbarra <- round(mean(x),3)

ds_n <- round(sd(x),3)

valor_c <- round(qt(c(0.025),df = n-1,lower.tail = F),3)

t <- (xbarra - mu_0)/(ds_n/sqrt(n));t

ifelse(t > valor_c | t < -valor_c,"Rechace H0", "No rechace H0")

?t.test

t.test(x,alternative = "two.sided", mu = 4)

#Ejemplo 8.11

#H0: p = 0.15

#H0: p > 0.15

p_0 = 0.15

n = 91

x = 16

pgorro = x/n

# alfa = 0.1

# Z = (pgorro-p_0)/raiz(p_0*(1-p_0)/n)

z = round((pgorro-p_0)/sqrt(p_0*(1-p_0)/n),3)

valor_c = round(qnorm(c(0.1),mean = 0, sd = 1, lower.tail =F),3)

ifelse(z > valor_c,"Rechazar H0", "No rechazar H0")

pnorm(c(0.69),lower.tail = F)

#Valor-p

#Ej 8.14

#H0: mu = 2

#H1: mu > 2

# z = (xbarra-mu_0)/(s/raiz(n))

mu_0 = 2

n = 51

xbarra = 2.06

ds_n = 0.141

z = round((xbarra-mu_0)/(ds_n/sqrt(n)),2)

round(pnorm(z,lower.tail = F),4)

round(qnorm(c(0.01),lower.tail = F),3)

## Valor-p

#Ejemplo 8.17

# H0: mu = 245

# H1: mu  dif 245

mu_0 = 245

n = 50

xbarra = 246.18

ds_n = 3.60

z = round((xbarra-mu_0)/(ds_n/sqrt(n)),2)

valor_p = round(2*pnorm(z,lower.tail = F),4)

valor_c = round(qnorm(c(0.025),mean = 0, sd = 1, lower.tail =F),3)

valor_c = round(qnorm(c(0.005),mean = 0, sd = 1, lower.tail =F),3)
