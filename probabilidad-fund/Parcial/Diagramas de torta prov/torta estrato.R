#diagrama de torta para estrato
Alumnos$Estrato

as.data.frame(table(Alumnos$Estrato))

festrato=c(784,808,860,865,850,833)
names (festrato)=c("estrato 1","estrato 2","estrato 3","estrato 4","estrato 5","estrato 6")
pestrato=round(festrato/sum(festrato)*100,digits = 1)
pie(festrato) 
etiqueta=paste(pestrato,"%", sep="" )
etiqueta=paste(names(festrato),etiqueta)
pie(festrato,label=etiqueta,main="Estrato de los estudiantes")
