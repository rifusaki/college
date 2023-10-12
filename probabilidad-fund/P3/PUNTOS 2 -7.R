


2 "Una encuesta de 2253 adultos estadounidenses llevada a cabo por una revista
en el mes de abril del a“o 2019
revel€ que 1262 de los encuestados habÃa utilizado en alg??n momento medios inal∑mbricos para el acceso
en lÃnea. Calcule e interprete un intervalo de confianza del 95% para la proporci€n de todos los adultos
estadounidenses que en el momento de la encuesta habÃan usado medios inal∑mbricos para el acceso en lÃnea."

x=1262

n=2253

prop.test(x=1262, n=2253, conf.level=0.95)$conf.int

apartir del resultado odtenido se puede concluir con un nivel de confianza
del 95%que la proporciÛn P de todos los adultos estadounidenses que en el
moenmento de la encuesta habian usado medios inalambricos para el acceso en
linea se encuentra entre 

0.533380 y 0.5807391




7 "Se registran las siguientes mediciones del tiempo de secado, en horas, de cierta marca de pintura vinÃlica:
  2.8, 3.3, 5.6, 3.7, 2.8, 4.4, 4.0, 5.2, 3.0, 4.8, 3.4, 2.5, 4.8, 2.9, 3.6. Suponga que las mediciones representan una
muestra aleatoria de una poblaci€n normal y con base en esto calcule el intervalo de predicci€n del 95% para
el tiempo de secado de la siguiente prueba de pintura"

B = c(2.8,3.3,5.6,3.7,2.8,4.4,4.0,5.2,3.0,4.8,3.4,2.5,4.8,
      2.9,3.6)

boxplot(B,horizontal = T)

t.test(x =B,conf.level = 0.95)$conf.int
 
