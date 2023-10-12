
### Prueba de Hipotesis e intervalos de confianza 
####      para dos poblaciones 


####Prueba z


#z.test: cuando tenga vectores de datos

# zsum.test: cuando tenga todos losm parametros y cargar BSDA

#Ejemplo 9.1

# Ho: mu1-mu2 = 0 = k, H1: mu1-mu2 dif = 0 = k

k = 0

m = 20

n= 25

xbarra =29.8

ybarra = 34.7

sigma1 = 4

sigma2 = 5

zp = ((xbarra-ybarra)-k)/sqrt((sigma1^2/m)+(sigma2^2/n)); zp


z.critico = qnorm(c(0.005),lower.tail = F)

ifelse(zp < -z.critico | zp > z.critico,"Rechace Ho", " No rechace H0")


# Cargar paquete BSDA

?zsum.test

prueba = zsum.test(mean.x = xbarra, sigma.x = sigma1, n.x = m,
                   mean.y = ybarra, sigma.y = sigma2, n.y = n,
                   mu = 0, conf.level = 0.99)

#Intervalo de confianza

ICI_difmed = (xbarra - ybarra)- z.critico*sqrt((sigma1^2/m)+(sigma2^2/n))

ICS_difmed = (xbarra - ybarra)+ z.critico*sqrt((sigma1^2/m)+(sigma2^2/n))

################
#Ejemplo 9.2


# Ho: mu1-mu2 = 0 = k, H1: mu1-mu2 dif = 0 = k

k = -200

m = 663

n= 413

xbarra = 2258

ybarra = 2637

sigma1 = 1519

sigma2 = 1138

alfa = 0.05

zp = ((xbarra-ybarra)-k)/sqrt((sigma1^2/m)+(sigma2^2/n)); zp


z.critico = qnorm(c(0.05),lower.tail = F);z.critico

ifelse(zp < -z.critico,"Rechace Ho", " No rechace H0")


?zsum.test

prueba = zsum.test(mean.x = xbarra, sigma.x = sigma1, n.x = m,
                   mean.y = ybarra, sigma.y = sigma2, n.y = n,
                   alternative = "less",mu = -200, conf.level = 0.95)

#Intervalo de confianza

ICI_difmed = (xbarra - ybarra)- z.critico*sqrt((sigma1^2/m)+(sigma2^2/n))

ifelse(prueba$p.value<alfa,"Rechazar Ho","No rechazar")

##### Otra manera

ifelse(prueba$statistic< -z.critico,"Rechazar Ho", "No rechace")

################################

### Prueba t

#Instalar nortest para pruebas de normalidad

?tsum.test

?t.test

### Ejemplo 9.6

m = 10

n = 10

xbarra = 51.71

ybarra = 136.14

sx = 0.79

sy = 3.59

tsum.test(mean.x = xbarra,s.x = sx,n.x = m,mean.y = ybarra,
          s.y = sy,n.y = n,conf.level = 0.95)$conf.int


##### Ejemplo 9.7

sinfusion =c(2748, 2700, 2655, 2822, 2511,3149, 3257, 3213,
             3220, 2753)
fusionado = c(3027, 3356, 3359, 3297, 3125, 2910, 2889, 2902)

# Prueba de normalidad (nortest)

ad.test(sinfusion)

ad.test(fusionado)

prueba.norm = lillie.test(sinfusion)

ifelse(prueba.norm$p.value >0.1, "Los datos provienen de una normal", 
       "Los datos no provienen de una norma")

lillie.test(fusionado)


