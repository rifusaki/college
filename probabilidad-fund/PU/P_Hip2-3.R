
### Prueba de Hipotesis e intervalos de confianza 
####      para dos poblaciones 


####Prueba z


#z.test: cuando tenga vectores de datos

# zsum.test: cuando tenga todos los parametros y cargar BSDA

#Ejemplo 9.1

# Ho: mu1-mu2 = 0 = k, H1: mu1-mu2 dif = 0 = k

k = 0

m = 20

n= 25

xbarra =29.8

ybarra = 34.7

sigma1 = 4

sigma2 = 5

zp = round(((xbarra-ybarra)-k)/sqrt((sigma1^2/m)+(sigma2^2/n)),2); zp


z.critico = qnorm(c(0.005),lower.tail = F)

ifelse(zp < -z.critico | zp > z.critico,"Rechace Ho", " No rechace H0")


# Cargar paquete BSDA

?zsum.test

prueba = zsum.test(mean.x = xbarra, sigma.x = sigma1, n.x = m,
                   mean.y = ybarra, sigma.y = sigma2, n.y = n,
                   mu = 0, conf.level = 0.99)$conf.int

prueba

#Intervalo de confianza

ICI_difmed = (xbarra - ybarra)- z.critico*sqrt((sigma1^2/m)+(sigma2^2/n))

ICS_difmed = (xbarra - ybarra)+ z.critico*sqrt((sigma1^2/m)+(sigma2^2/n))

################

#Ejemplo 9.4

# Ho: mu1-mu2  = 200, H1: mu1-mu2 < -200

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
                   alternative = "less",mu = k, conf.level = 0.9)

prueba$conf.int

#Intervalo de confianza

ICI_difmed = (xbarra - ybarra)- z.critico*sqrt((sigma1^2/m)+(sigma2^2/n))

ifelse(prueba$p.value<alfa,"Rechazar Ho","No rechazar")

##### Otra manera

ifelse(prueba$statistic< -z.critico,"Rechazar Ho", "No rechace")

################################

### Prueba t
## Cargar paquete BSDA
## poblaciones normales y varianzas poblacionales 
# desconocidas y diferentes

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

prueba.t =tsum.test(mean.x = xbarra,s.x = sx,n.x = m,mean.y = ybarra,
          s.y = sy,n.y = n,conf.level = 0.95)

round(prueba.t$conf.int,2)

##### Ejemplo 9.7

#H0:mu1-mu2 = 0; H1: mu2>mu1= mu1-mu2 <0 

sinfusion =c(2748, 2700, 2655, 2822, 2511,3149, 3257, 3213,
             3220, 2753)
fusionado = c(3027, 3356, 3359, 3297, 3125, 2910, 2889, 2902)

qqnorm(fusionado)#grafica para evaluar normalidad de muestra

qqline(fusionado)

qqnorm(sinfusion)#grafica para evaluar normalidad de muestra

qqline(sinfusion)# Prueba de normalidad (nortest)

?nortest

ad.test(sinfusion)

ad.test(fusionado)

prueba.norm_1 = lillie.test(sinfusion);prueba.norm_1$p.value 

prueba.norm_2 = lillie.test(fusionado);prueba.norm_2$p.value

# la conclusion con la prueba lillie es que las  dos muestras
# provienen de normales

ifelse(prueba.norm_1$p.value >0.1, "Los datos de la muestra 1 provienen de una normal", 
       "Los datos no provienen de una normal")

ifelse(prueba.norm_2$p.value >0.1, "Los datos de la muestra 2 provienen de una normal", 
       "Los datos no provienen de una norma")

# El estadistico a utilizar es t. Hay que usar t.test o tsum.test

?tsum.test

?t.test

prueba.t = t.test(x = sinfusion,y = fusionado, alternative ="less", var.equal= F,conf.level = 0.95 )

prueba.t$p.value

prueba.t$conf.int

prueba.t = tsum.test(mean.x = mean(sinfusion),s.x = sd(sinfusion),n.x =length(sinfusion),
                     mean.y = mean(fusionado),s.y = sd(fusionado),
                     n.y = length(fusionado),alternative = "less",var.equal = F,
                     conf.level =0.9 )
prueba.t$p.value 

prueba.t$conf.level

##### poblaciones normales y varianzas poblacionales 
#desconocidas e iguales

###ejercicio 10.34 Walpole

# H0: mu1-mu2 = 8, H1: mu1 -mu2 < 8

k = 8

m = 11

n = 17

xbarra = 85

ybarra = 79

sx = 4.7

sy = 6.1


prueba.t = tsum.test(mean.x = xbarra,s.x = sx,n.x = m, mean.y = ybarra,
          s.y = sy,n.y = n,alternative = "less",
          mu = 8,var.equal = TRUE,conf.level = 0.95)

prueba.t$p.value

pt(q(-0.92245),df=26, lower.tail = T)

paste("Como valor-p > 10%, no se rechaza Ho")

###Prueba de hip para datos pareados

#Ejemplo 9.9

s.a = c(81, 87, 86, 82, 90, 86, 96, 73,74, 75, 72,
        80, 66, 72, 56,82)

s.d = c(78, 91, 78, 78, 84, 67, 92,70,58, 62, 70,
        58, 66, 60, 65,73)

#Aplicar prueba t para datos pareados

d = s.a -s.d;d

#H0: los datos provienen de una normal
#H1: los datos  no provienen de una normal

lillie.test(s.a)

lillie.test(s.d)

lillie.test(d)

qqnorm(d)

qqline(d)

# las diferencias se suponen normales
#H0: mu_d = 0, H1: mu_d dif 0

ej9.9 = t.test(x=s.a,y=s.d,alternative = "two.sided", mu = 0,
       paired = TRUE, conf.level = 0.95)

ej9.9$p.value

ifelse(ej9.9$p.value<0.01,"Rechace Ho","Analizar")

round(ej9.9$conf.int,2)

round(ej9.9$conf.int,2)

#Ejemplo 9.10

diap = c(30, 35, 40, 25, 20, 30, 35, 62, 40, 51, 25, 42, 33)

dig = c(25, 16, 15, 15, 10, 20, 7, 16, 15, 13, 11, 19, 19)

d = diap -dig;d

p_norm =lillie.test(d)

p_norm$p.value

paste("Como valor-p >> 10%, las diferencias proviene de una normal")

# las diferencias proviene de una normal

ej9.10 = t.test(diap,dig,alternative = "two.sided",paired = T)

round(ej9.10$conf.int,2)

######### Prueba de hipo para la diferencia de proporciones

#H0: p1-p2 = k, H1:p1-p2 <, >, dif k

#Ej 9.11

x = 81

m = 549

y = 141

n = 730

p1gorro = x/m

p2gorro = y/n  

pgorro = (x+y)/(m+n);pgorro

#H0: p1-p2 = 0, H1: p1-p2 < 0

z = (p1gorro-p2gorro)/sqrt(pgorro*(1-pgorro)*(1/m+1/n))

z

z.critico = qnorm(c(0.05),lower.tail = T)

z.critico

ifelse(z<z.critico, "Rechace H0", "No rechace H0")

###########De otra manera utilizando prop.test

dif_prop = prop.test(x =c(81,141),n =c(549,730),alternative = "less")

dif_prop$p.value

ifelse(dif_prop$p.value<0.05,"Rechace H0", "No rechace")

dif_prop$conf.int


paste("El intervalo de confianza del 95% es", dif_prop$conf.int[1],round(dif_prop$conf.int[2],4))

####prueba para igualdad de varianzas

qf(c(0.98),15,12,lower.tail = T)

#Ejercicio 9.14

#H0: sigma1^2 = sigma2^2, H1: sigma1^2 < sigma2^2

?var.test()

m = 28

n = 26

s1 = 52.6

s2 = 84.2

f = s1^2/s2^2 # estadistico de prueba

f

f.critico = qf(c(0.01),df1 = m-1,df2 = n-1,lower.tail = T)

ifelse(f < f.critico,"Rechace H0","No rechacde H0")

################ FIN ##################