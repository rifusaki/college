#diagrama de torta para carrera
Alumnos$carrera

as.data.frame(table(Alumnos$carrera))

fcarrera=c(390,421,374,378,407,403,379,354,336,345,415,397,401)
names (fcarrera)=c("ADMINISTRACIÓN","ARQUITECTURA","BIOQUIMICA","CIVIL","ELECTRICA","ELECTRONICA","INDUSTRIAL","INFORMATICA","MECANICA","MECATRONICA","QUIMICA","SISTEMAS","TIC")
pcarrera=round(fcarrera/sum(fsexo)*100,digits = 1)
pie(fcarrera) 
etiqueta=paste(pcarrera,"%", sep="" )
etiqueta=paste(names(fcarrera),etiqueta)
pie(fcarrera,label=etiqueta,main="Carrera que cursan los estudiantes")
