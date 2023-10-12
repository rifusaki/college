Cuantiles
quantile(Alumnos$promedio)# cuartiles

quantile(Alumnos$peso,c(0.25,0.75,0.85,0.92))# percentiles
quantile(Alumnos$altura,c(0.25,0.75,0.85,0.92))# percentiles
quantile(Alumnos$edad,c(0.25,0.75,0.85,0.92))# percentiles


median(Alumnos$promedio)
summary(Alumnos$promedio)
boxplot(Alumnos$promedio)
Q1=83.68
Q3=88.42
RI=Q3-Q1# rango intercuartilico
Min=Q1-1.5*RI
Max=Q3+1.5*RI
par(mfrow=c(1,3))
boxplot(Alumnos$edad, main="Edad de los estudiantes", xlab="Estudiantes", 
        ylab="edad", col = "red")
boxplot(Alumnos$peso, main="Peso de los estudiantes", xlab="Estudiantes", 
        ylab="peso", col = "blue")
boxplot(Alumnos$altura, main="Altura de los estudiantes", xlab="Estudiantes", 
        ylab="altura", col = "gray")