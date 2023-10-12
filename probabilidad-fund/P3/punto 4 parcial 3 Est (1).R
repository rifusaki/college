datosenunciado<-c(1470, 1510, 1690, 1740, 1900, 2000, 2030, 2100, 2190, 2200, 2290, 2380, 2390,  2480, 2500, 2580, 2700)
mean(datosenunciado)
media<-mean(datosenunciado)
z<- 1.96
length(datosenunciado)
n<- length(datosenunciado)
sd(datosenunciado)
desviación<-(sd(datosenunciado))
errorestandar<- desviación/sqrt(n)
lim_inf<-media-(z*errorestandar)
lim_sup<-media+(z*errorestandar)
resultado<- data.frame(n, desviación, errorestandar, lim_inf, lim_sup)

