#diagrama de torta para g�nero
Alumnos$genero

as.data.frame(table(Alumnos$genero))

fsexo=c(2436,2564)
names (fsexo)=c("Femenino","Masculino")
psexo=round(fsexo/sum(fsexo)*100,digits = 1)
pie(fsexo) 
etiqueta=paste(psexo,"%", sep="" )
etiqueta=paste(names(fsexo),etiqueta)
pie(fsexo,label=etiqueta,main="G�nero de los estudiantes")
