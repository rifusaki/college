Alumnos <- 
  readXL("G:/Mi unidad/III Semestre/Probabilidad y Estadística Fundamental/Parcial/Alumnos.xlsx",
         rownames=FALSE, header=TRUE, na="", sheet="alumnos%20simulados", 
         stringsAsFactors=TRUE)

view(Alumnos)
attach(Alumnos)
paste("El promedio de las notas de Alumnos es", mean(Alumnos$promedio))
paste("La edad promedio de Alumnos es", mean(Alumnos$edad))
paste("El peso promedio de Alumnos es", mean(Alumnos$peso))
paste("La altura promedio de Alumnos es", mean(Alumnos$altura))
paste("El estrato promedio de Alumnos es", mean(Alumnos$Estrato))

paste("La mediana de las notas de Alumnos es", median(Alumnos$promedio))
paste("La mediana de la edad de Alumnos es", median(Alumnos$edad))
paste("La mediana del peso de Alumnos es", median(Alumnos$peso))
paste("La mediana de la altura de Alumnos es", median(Alumnos$altura))
paste("La mediana del estrato de Alumnos es", median(Alumnos$Estrato))

paste("La moda de la notas de Alumno es", mfv(Alumnos$promedio))
paste("La moda de la edad de Alumno es", mfv(Alumnos$edad))
paste("La moda del peso de Alumno es", mfv(Alumnos$peso))
paste("La moda de la altura de Alumno es", mfv(Alumnos$altura))
paste("La moda del Estrato de Alumno es", mfv(Alumnos$Estrato))
