library(BSDA)

Alumnos <- 
  readXL("G:/Mi unidad/III Semestre/Probabilidad y Estadística Fundamental/Parcial/Alumnos.xlsx",
         rownames=FALSE, header=TRUE, na="", sheet="alumnos%20simulados", 
         stringsAsFactors=TRUE)

attach(Alumnos)

max(Alumnos$Estrato)
min(Alumnos$Estrato)
Ran_estr=max(Alumnos$Estrato)-min(Alumnos$Estrato); Ran_estr
Ran_pr=max(Alumnos$promedio)-min(Alumnos$promedio);Ran_pr
Ran_ed=max(Alumnos$edad)-min(Alumnos$edad); Ran_ed
Ran_pes=max(Alumnos$peso)-min(Alumnos$peso); Ran_pes
Ran_alt=max(Alumnos$altura)-min(Alumnos$altura); Ran_alt

Varian_estr = var(Alumnos$Estrato); Varian_estr
Varian_pr = var(Alumnos$promedio); Varian_pr
Varian_ed = var(Alumnos$edad); Varian_ed
Varian_pes = var(Alumnos$peso); Varian_pes
Varian_alt = var(Alumnos$altura); Varian_alt

Desest_estr = sd(Alumnos$Estrato); Desest_estr
Desest_pr = sd(Alumnos$promedio); Desest_pr
Desest_ed = sd(Alumnos$edad); Desest_ed
Desest_pes = sd(Alumnos$peso); Desest_pes
Desest_alt = sd(Alumnos$altura); Desest_alt

CV <- function(x, na.rm = FALSE) {
  sd(x, na.rm=na.rm) / mean(x, na.rm=na.rm)
}

CV(Alumnos$Estrato)
CV(Alumnos$promedio)
CV(Alumnos$edad)
CV(Alumnos$peso)
CV(Alumnos$altura)
