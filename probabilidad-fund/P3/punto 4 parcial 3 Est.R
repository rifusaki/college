mean(datos_punto_4$datos)
media<-mean(datos_punto_4$datos)
z<- 1.96
length(datos_punto_4$datos)
n<- length(datos_punto_4$datos)
sd(datos_punto_4$datos)
desviación<-(sd(datos_punto_4$datos))
errorestandar<- desviación/sqrt(n)
lim_inf<-media-(z*errorestandar)
lim_sup<-media+(z*errorestandar)
intervalodeconfianza<- data.frame(n, desviación, errorestandar, lim_inf, lim_sup)

