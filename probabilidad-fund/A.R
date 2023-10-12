cal = c("test","jajas","trans")
frec = c(1232,2341,2312)

pie(frec, labels=cal, clockwise = T, col=c(1,2,3), density=100, angle=0)

?data

data(mtcars)
View(mtcars)
?mtcars

attach(mtcars) #Se asigna a la variable. Cualquier set de datos

