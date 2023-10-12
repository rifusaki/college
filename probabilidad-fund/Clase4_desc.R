############################

## Medidas de posición  en la librería moments ########

#########################

#Cuantiles

library(moments)

View(Encuesta)

attach((Encuesta))

?quantile

ej2 = c(18,19,20,20,21,21,22,23,24,24,24)

length(ej2)

quantile(ej2,0.75,type = 6) # Tipo 6 es el del profe

Q1 = quantile(gastbeb,0.25,type = 6) #Seg. arg.: est� sobre qu� porc.

paste("El primer cuartil de gastbeb es",Q1)

Q3 = quantile(gastbeb,0.75,type = 6)

paste("El tercer cuartil de gastbeb es",Q3)

Q2 = quantile(gastbeb,0.5,type = 6)

paste("La mediana de gastbeb es",Q2)

median(gastbeb)

length(gastbeb)

# posición qk = k*(n+1)/100

75*(39+1)/100 # posici?n del dato

gastbeb

sort(gastbeb)[30] # ordena y encuentra el dato en la posici?n 30

quantile(gastbeb,0.85,type = 6)

#Posicion del percentil 85

85*(39+1)/100

quantile(gastbeb,0.5,type = 6)

sort((gastbeb))[34]

median(gastbeb)

quantile(gastmen,0.75)

quantile(gastbeb)

sort(gastbeb,F)

median(gastbeb)

gastbeb

mediana_gastmen

quantile(gastbeb,0.75, type = 6)

quantile(gastbeb,0.25,type = 6)

quantile(gastbeb,0.84, type = 6) 

summary(gastbeb)

?boxplot

#Cinco números: Q1,Q2,Q3, RI, Q1-1.5*RI, Q3+1.5*RI

boxplot(gastbeb, id=list(method="y"),col= "lightblue",horizontal = TRUE, main="Diagrama de caja")
Boxplot( ~ gastbeb, data=Dataset1, id=list(method="y"), 
         main="Diagrama de caja")

 (39+1)*0.75

median(gastbeb)

sort(gastbeb,F)[30]

quantile(gastbeb)

quantile(gastbeb, type = 6)

0.84*40

sort(gastbeb,F)[33]

sort(gastbeb,F)[34]

157820 + 0.6*(170769-157820) # Posici�n cuartil

#Curtosis, aplastamiento/apunt

?kurtosis

library(moments)

require(e1071)

kurtosis(gastbeb)

k_gastbeb = kurtosis(gastbeb); k_gastbeb

k_gastmen = kurtosis(gastmen); k_gastmen

boxplot(gastbeb)

hist(gastbeb, ylim =c(0,25))

plot(gastbeb)

###Asimetria

?skewness

#(sum(gastbeb-mean(gastbeb))^4)/(var(gastbeb)^2)-3

skewness(gastbeb)

kurtosis(gastbeb)

hist(gastbeb)

plot(density(gastbeb))

As_gastbeb = skewness(gastbeb);As_gastbeb

skewness(gastbeb)

moda_gastbeb=mfv(gastbeb);moda_gastbeb

library(fdth)

(mean(gastbeb)-mfv(gastbeb))/sd(gastbeb) #Una fómula para asimetría

3*(mean(gastbeb)-median(gastbeb))/sd(gastbeb) #otra f?rmula  pars coef de asim

#Por ?ltimo la funci?n summary muestra un resumen descriptivo de los datos 

summary(gastbeb)

summary(Encuesta)

##########################

library(Rcmdr)
Rcmdr
