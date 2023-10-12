
########### Intervalos de Confianza  #############

round(qnorm(c(0.005),mean=0,sd =1,lower.tail = F),3)

#Ejemplo 7.3

sigma_mu <- 0.1 # sigma_mu es la desv estandar poblacional

n <- 40

xbarra <- 5.426

z_crit <- round(qnorm(c(0.05),0,1,F),3);z_crit

LI_mu <- round(xbarra - z_crit*sigma_mu/sqrt(n),3);LI_mu

LS_mu <- round(xbarra + z_crit*sigma_mu/sqrt(n),3);LS_mu

paste("El intervalo de confianza para mu del 90% es:",LI_mu,LS_mu)

#### Ejemplo 7.6

millas <- c(2948, 2996, 7197, 8338, 8500, 8759, 12710, 12925,
            15767, 20000, 23247, 24863, 26000, 26210, 30552,
            30600,35700, 36466, 40316, 40596, 41021, 41234,
            43000, 44607,45000, 45027, 45442, 46963, 47978,
            49518, 52000, 53334,54208, 56062, 57000, 57365,
            60020, 60265, 60803, 62851,64404, 72140, 74594,
            79308, 79500, 80000, 80000, 84000, 113000,118634)


sigma_mu <- sd(millas) #muestra grande (S)

n <- length(millas)

xbarra <- mean(millas)

z_crit <- round(qnorm(c(0.025),0,1,F),3);z_crit

LI_mu <- round(xbarra - z_crit*sigma_mu/sqrt(n),3);LI_mu

LS_mu <- round(xbarra + z_crit*sigma_mu/sqrt(n),3);LS_mu

paste("El intervalo de confianza del 95% para mu con muestra grande es:",LI_mu,LS_mu)

##########Intervalo de confianza para la proporcion#####

n <- 48

x <- 16

pgorro <- x/n

z_crit <- round(qnorm(c(0.025),0,1,F),3);z_crit

LI_p <- round(pgorro - z_crit*sqrt(pgorro*(1-pgorro)/n),3);LI_p

LS_p <- round(pgorro + z_crit*sqrt(pgorro*(1-pgorro)/n),3);LS_p

paste("El intervalo de confianza para P del 95% es:",LI_p,LS_p)

#prop.test(x, n, p=NULL,
          #alternative= "two.sided",
          #conf.level=0.95, correct=TRUE)#


#########Intervalo de confianza para mu, con población normal ###

?pt

qt(c(0.01),df=21,lower.tail = F)

#ICmu = xbarra +-talfa/medios*s/raiz de n

s_mu <- sd() # Desv estándar para t

n <- length()

xbarra <- mean()

t_crit <- round(qt(c(),0,1,F),3);t_crit

#Ejemplo 7.11

ruptura <- c(6807.99, 7637.06, 6663.28, 6165.03, 6991.41,
             6992.23, 6981.46, 7569.75, 7437.88, 6872.39,
             7663.18, 6032.28, 6906.04, 6617.17, 6984.12,
             7093.71, 7659.50, 7378.61, 7295.54, 6702.76,
             7440.17, 8053.26, 8284.75, 7347.95, 7422.69,
             7886.87, 6316.67, 7713.65, 7503.33, 7674.99)
length(ruptura)

qqnorm(ruptura, main="QQ plot de una normal")
qqline(ruptura)  # Para agregar la linea de referencia

s_mu <- sd(ruptura) # Desv estándar para t

n <- length(ruptura)

xbarra <- mean(ruptura)

t_crit <- round(qt(c(0.025),df = n-1,lower.tail = F),3);t_crit

LI_mu <- round(xbarra - t_crit*s_mu/sqrt(n),3);LI_mu

LS_mu <- round(xbarra + t_crit*s_mu/sqrt(n),3);LS_mu

paste("El intervalo de confianza para mu del 95% es:",LI_mu,LS_mu)

#Grafico de normalidad

qqnorm(ruptura, main="QQ plot de una normal")

qqline(ruptura)  # Para agregar la linea de referencia

?qqnorm

#=0tra forma

t.test(x = ruptura, y = NULL,alternative = "two.sided", conf.level = 0.95)


####Intervalo de confianza para la varianza

#Chi cuadrada

?pchisq

#Ejemplo  7.15

vol_rup <- c(1470, 1510, 1690, 1740, 1900, 2000, 2030,
             2100, 2190,2200, 2290, 2380, 2390, 2480,
             2500, 2580, 2700)

n <- length(vol_rup)

s <- sd(vol_rup);s^2

chicrit_der <- round(qchisq(c(0.025),df = n-1,lower.tail = F),3)

chicrit_izq <- round(qchisq(c(0.025),df = n-1,lower.tail = T),3)


LI_scuad = round((n-1)*s^2/chicrit_der,3)

LS_scuad = round((n-1)*s^2/chicrit_izq,3)

paste("El intervalo de confianza para la varianza del 95% es:",LI_scuad,LS_scuad)
  
