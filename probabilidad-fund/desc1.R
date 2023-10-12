8*9

log(89,base=3)

sin(pi/4)

exp(2)

2^5/86

#### Graficos datos cualititativos

#Torta y barras

# Torta 

# Barras


# Importar
#library(readxl)
Prueba1 <- read_excel("G:/Mi unidad/III Semestre/Probabilidad y Estad韘tica Fundamental/Prueba1.xlsx")
View(Prueba1)

x = Prueba1

View(x)

names(x)
structure(x)

?table

fabs = table(x) #frecuencia absoluta

fabs
lengths(x)

frel =  fabs/lengths(x) #frecuencia relativa

frel

fabsacum = cumsum(fabs) #frecuencia absoluta acumulada

fabsacum

frelacum = cumsum(frel)#frecuencia relativa acumulada

frelacum

tabla_frec = cbind(fabs,frel,fabsacum, frelacum) # Tabla 'e to' eso

tabla_frec

# Creando vectores

cal = c("A","B", "C","D"); cal

frec = c(35,260,93,12)

?pie

pie(frec, labels = cal, clockwise = TRUE, border = "blue",
    col = c("red",4,5,"green"), main = "Diagrama circular")

library(plotrix)
pie3D(frec, labels = cal, clockwise = TRUE, border = "blue",
    col = c("red",4,5,"green"), main = "Diagrama circular")

# En 3D

library(plotrix)

pie3D(frec,main="Gr谩fico circular ",labels = cal,col = c(3,4,5,6))

# Diagrama de barras

library(readxl)

y <- read_excel("G:/Mi unidad/III Semestre/Probabilidad y Estad韘tica Fundamental/Prueba1.xlsx", 
                sheet = "Ejemplo4")

tabla.1 = table(y)
tabla.1
y

barplot(tabla.1, main = "Gr谩fico de Barras", xlab = "Puntuaci贸n", 
        ylab = "Frecuencia Absoluta", col = "lightblue", border = "darkgreen")

carreras = c("Arquitectura", "Civil", "Sistemas", "TIC", "Gesti贸n")

inscritos <- c(820, 650, 320, 50, 608)

datos <- data.frame(carreras, inscritos)

attach(datos) # Tocar韆, si no, datos$[var]

datos

pie(datos$inscritos,col = c(4,5,6,7,8),main = "Torta1",
    labels=carreras, border = "lightblue")

barplot(height = inscritos, main = "diagrama de barras",
        names.arg = datos$carreras, col =4)

# Datos cuantitativos discretos: torta y barras


#tabla con las frecuencias encontradas

tabla_frec = cbind(fabs,frel,fabsacum, frelacum)

tabla_frec

#Gr?fico de barra de calificacion y la frecuencia absoluta

barplot(fabs, col= c(5,6,7,8),ylab="Frec. absoluta",xlab="Calificacion",main="Calificacion Rectores")

#Gr?fico tipo pastel

pie(frel, col=c("red", "gray", "yellow", "green"),
    labels=c("A(8.75%)","B(65%)","C(23.25%)","D(3%)"),
    main = "Diagrama de torta para las calificaciones")

# Diagrama de torta y barras para datos cuantitativos discretos

cant_gast <- c(147.3, 259.3, 129.2, 79.0, 17.6, 4.3)

categ = c("pers mil", "Oper y mant", "Adquis", "Inv y des", 
          "Cons mil", "Otros")

pie(cant_gast, main = "Torta para gastos mil",col=c("lightblue","red","green",
                                                    "blue","pink", "yellow"),
     labels = categ)

?barplot

barplot(height = cant_gast,ylim = c(0,500),ylab = "Gastos militares", 
        names.arg = categ, col = "lightblue", border = "blue")



##Datos cuantitativos


# Gr谩fica de Lineas

annos <- c("1980","1990","2000","2010","2020")

poblacion <- c(26.90, 33.1, 39.63, 45.22, 50.88)

datos <- data.frame(annos, poblacion)

datos

?plot

plot(x=datos$annos, y=datos$poblacion, type="b", xlab="A帽os", 
     ylab="Poblaci贸n", col="purple")

plot(cars)

plot(sin,-2*pi,2*pi)



################## Histogramas #############

library(fdth)
?fdth

set.seed(14382) # N鷐eros "aletorios"

ciudades <-c("Bogota","Cali","Medellin","Barranquilla","Cartagena","Santa Marta")
 
ciudades <- factor(ciudades)  

entidades <- sample(x = ciudades, size=80, replace = TRUE) # Datos aleatorios

entidades

edades <- sample(x = 18:65, size=80, replace = TRUE)

estaturas <- sample(x = 145:205, size=80, replace = TRUE)

estaturas <- estaturas / 100

estaturas

pesos <- sample(x = 45:110, size=80, replace = TRUE)

pesos

genero <- sample(x = factor(c("Femenino", "Masculino")), size=80, replace = TRUE)

genero

datos <- data.frame(entidades, edades, estaturas, pesos, genero)

datos

# Agrupaci贸n de datos

attach(datos)

frecuencia.edades <- fdt(edades, breaks='Sturges')

frecuencia.edades # TABLA DE FRECUENCIAS

frecuencia.edades <- as.data.frame(frecuencia.edades$table)

frecuencia.estaturas <- fdt(estaturas)

frecuencia.estaturas <- as.data.frame(frecuencia.estaturas$table)

frecuencia.estaturas

frecuencia.pesos <- fdt(pesos)

frecuencia.pesos <- as.data.frame(frecuencia.pesos$table)

frecuencia.pesos

#Histograma

hist(edades, main = "Histograma de edades", ylab = "Frecuencia", 
     col = "lightblue", border = "blue")

plot(density(edades),main = "Grafica de densidad",ylab = "Densidad", col="red")


