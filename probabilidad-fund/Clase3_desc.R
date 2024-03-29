###########################
#library(stats)
#library(moments)
#library(dplyr)
#Medidas de tendencia central

# Media aritm�tica
# Mediana
# Moda

#Media ,promedio, moda

View(Encuesta)
# Suma(de los datos)/ # de datos El s�mbolo es xbarra

attach(Encuesta)

ej1 = c(19,22,20,20,19,19)

mean(ej1)

median(ej1)

mfv(ej1)#  cargar el paquete modeest y la librer�a es mfv

m.d = c(3.5,4,4.2,4.8,4.8,3.5,4)

median(m.d)

mfv(m.d)

# Mdidas de variabilidad

#* Rango
#* 
#* Varianza
#* 
#* Desviacio�n est�ndar
#* 
#* Coeficiente de variaci�n
#* 
####################
#*Rango

max(Edad)# dato mayor

min(Edad)# dato menor

rang_edad = max(Edad)-min(Edad); rang_edad

xbarra_edad = mean(Edad);xbarra_edad

paste("el promedio de edad en Encuesta es", round(xbarra_edad,3))


#* Varianza medida de la variabilidad de los datos respecto a su media

varian_edad = var(Edad);varian_edad

paste("la varianza de la edad es", round(varian_edad,3))

ds_edad = sqrt(varian_edad);ds_edad 

round(sd(Edad),3)

paste("la desviacion estandar deEdad es", round(ds_edad,3))

xbarra_edad+2*ds_edad

xbarra_edad-2*ds_edad

#*Coeficiente de variaci�n

CV_edad = (ds_edad)/(xbarra_edad)*100

paste("el coeficiente de variacion es", round(CV_edad,3),"%")

#Tarea.

#Hacer esto mismon pero con las otras variables cuantitativas de Encuesta