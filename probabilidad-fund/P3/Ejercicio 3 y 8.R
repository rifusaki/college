# Ejercicio 3 
# Los datos siguientes representan el n ??mero de pasajeros por vuelo de una
# muestra aleatoria de 50 vuelos entre
# Amsterdam y Viena en una Comparia  aerea:
#       163 165 094 137 123 095 170 096 117 129
#       152 138 147 119 166 125 148 180 152 149
#       167 120 129 159 150 119 113 147 169 151
#       116 150 110 110 143 090 134 145 156 165
#       174 133 128 100 086 148 139 150 145 100
# Encuentre un intervalo de confianza del 95% para el verdadero promedio de 
# viajeros entre Amsterdam y Viena.

Pasajeros <- c(163, 165, 094, 137, 123, 095, 170, 096, 117, 129,
               152, 138, 147, 119, 166, 125, 148, 180, 152, 149,
               167, 120, 129, 159, 150, 119, 113, 147, 169, 151,
               116, 150, 110, 110, 143, 090, 134, 145, 156, 165,
               174, 133, 128, 100, 086, 148, 139, 150, 145, 100)
# a.) La media de pasaeros en vuelo es 

mean(Pasajeros)

# Intervalo de confianzaal 95% 
# utilizamos Z= (X-x)/s ~N(0,1)

t.test(Pasajeros,conf.level = 0.95)

# Intervalo de confianza al 95% es :  (-1.96 ; 1.96)

# Una conjetura de un catedratico del departamento de microbiologÌa, de una
# prestigiosa universidad aÖrma que un par de tasas diarias de tÈ verde o negro
# proporciona suÖciente á ??or para evitar el deterioro de los dientes. øQuÈ tan
# grande deberÌa ser la muestra para estimar el porcentaje de habitantes de 
# cierta ciudad que est·n a favor de tener agua áuorada, si se desea tener al
# menos un 99% de conÖanza en que el estimado est· dentro del 1% del porcentaje
# verdadero?

# SOLUCION 

#Aplicamos el teorema 9.5 si utilizamos p^ como un estimado de p, podemos tener,
# al menos, un 100(1-??)% de confianza en que el error no excedera a una cantidad
# especifica e cuando el tamaño de la muestra sea 
# n=(z^2??/2)/4e^2
# Z??/2= Z0.005= 2.575

e <- 0.01
z <- 2.575
n <-(z^2)/(4*(e^2))

# Solucion 

n
