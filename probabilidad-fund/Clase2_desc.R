# Gráficas para datos cualitativos

#Torta y barras

table(Estciv)

pie(table(Estciv),col = c("blue","green","pink","beige"), main = "Diagrama de torta para Estado civil")

barplot(table(Estciv), col = "beige", main = "Diagrama de barras para Estado Civil")

#Gráfico para variables cuantitativas discretas

# Torta 

# Barras

attach(Encuesta)

x = c("Pers milr", "Ope y mant", "Adquisiones", "Invest y des", 
      "Cons_mil", "Otra")# x: categoría militar

y = c(127.5, 188.1, 82.3, 65.7, 5.3, 5.5)# y: cantidad en miles de millones

?barplot
  
#Construir diagrama de barras


par(mfrow=c(1,2))# dividir pantalla de graficos

barplot(y,names.arg=x, ylim=c(0,200),
        xlab="Categoría",ylab="Gasto militar",col = 5, main = "Gráfico para gasto militar")## Gráfico de barra, Elaborarlo mejor

# Diagrama de torta

?pie

pie(y,labels = names(x), edges=200,radius= 1, col = c(8,5,4,7,0), main = "gráfico pastel")# mejorar
?pie


#################################

##Gráficas para datos cuantitativos continuos

#distribución de frecuencias

#Histogramas

#diagrama de cajas

#ejemplo

#Fórmula sturges

dim(Encuesta)

1+log(39,base=2)

1+3.32*log10(39)

max(Edad)

library(fdth)# Cargar este paquete para elaborar distribuciones de frecuencia

?fdt

? fdt

dist_f = fdt(Edad,breaks="Sturges") # calcula la distribución de frecuencias utilizando la regla Sturge

hist(Edad, ylab= "Frecuencia", ylim = c(0,20), main="Histograma de edad")

min(Edad)

hist(gastbeb)

max(Edad)

(max(Edad)-min(Edad))/7

?hist

length(Edad)
8/39

#Donde
#f= frecuencia absoluta
#rf= frecuencia relativa: f/n = 8/39
#rf(%) frecuencia relativa porcentual
#cf= frecuencia acumulada
#cf(%)=frecuencia acumulada porcentual

par(mfrow=c(3,2)) # particiona mi ventana grafica en 3x2.


hist(Edad, breaks = "Sturges", main="histograma de frtecuencias") #histograma utilizando el numero de clases según Sturge

plot(dist_f, type="cfh", col = 4)   #histograma de frecuencias acumulada

plot(dist_f, type="cfp")   #ojiva

plot(dist_f, type="d")# 


Encuesta


plot(dist_f, type="fp")#Polígono de frecuencias

plot(dist_f, type="d")# densidad

plot(dist_f, type="cfpp",main = "Ojiva", col=4)

plot(dist_f, type="fh") # histograma de frecuencias absolutas

#explore los otros argumentos graficos,
#"fh", "fp", "rfh", "rfp", "rfph", "rfpp", "d", "cdh", 
#"cdp", "cfp", "cfph", 

#Loblolly

#View(Loblolly)

#nuevdat = as.data.frame(Loblolly)

#nuevdat = rename(altura = height, edad = age,
 #                semilla= Seed,.data = nuevdat)

######################################
#Diagrama de cajas
###########

boxplot(Edad, main = "Diagrama de cajas", col = "blue")
