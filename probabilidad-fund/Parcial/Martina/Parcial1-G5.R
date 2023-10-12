# Librerias
library(ggplot2) #Graficas
library(dplyr) #Ordenar datos
library(reshape2) #Ordenar datos
library(tidyverse) #Mas datos
library(RColorBrewer) #Colores personalizados
library(modeest) #Datos
library(EnvStats) #CV
library(scales) #Tortas
library(xtable) #Tablas en LaTeX

# R Commander
library(Rcmdr)


# Importar datos
EAlumnos <- 
  readXL("G:/Mi unidad/III Semestre/Probabilidad y Estadística Fundamental/Parcial/Alumnos.xlsx",
         rownames=FALSE, header=TRUE, na="", sheet="alumnos%20simulados", 
         stringsAsFactors=TRUE)
alumnos <- data.frame(EAlumnos)


# Punto 2: Gráficas género, carrera y estrato
## Barras
p2_alumnos <- alumnos %>% count(carrera,genero,Estrato) %>% group_by(carrera,genero,Estrato) # SE ME

p2_colores = brewer.pal(n = 9, "YlGnBu")[3:9]

ggplot(p2_alumnos, aes(x=carrera, y=n, fill=forcats::fct_rev(factor(Estrato)))) +
  facet_wrap(~ genero, scales = "free_x") +
  scale_fill_manual(values=p2_colores) +
  geom_col(position = position_stack()) +
  xlab("Carreras") + ylab("Cantidad de estudiantes") + 
  labs(title="Cantidad de estudiantes por carrera, género y estrato", fill="Estrato", caption="Grupo 5") +
  theme_light()

## Torta
### Género
p2_colores_2 = brewer.pal(n = 9, "YlGnBu")[4:9]

p2_g <- alumnos %>% 
  group_by(genero) %>%
  summarise(n = n()) %>%
  mutate(prop = n / sum(n) *100) %>%
  mutate(ypos = 37*cumsum(prop)- 5*prop )

ggplot(p2_g, aes(x="", y=n, fill=forcats::fct_rev(factor(genero)))) +
  geom_col(position = position_stack()) +
  scale_fill_manual(values=p2_colores_2) +
  xlab("") + ylab("") +
  labs(title="Proporción de género", fill="Género", caption="Grupo 5") +
  coord_polar("y", start=0) +
  geom_text(aes(x=1.6,y = c(1250,3750), label = n), color = "black", size=4.5) +
  theme_void()

### Estrato
p2_e <- alumnos %>% 
  group_by(Estrato) %>%
  summarise(n = n()) %>%
  mutate(prop = n / sum(n) *100) %>%
  mutate(ypos = 46*cumsum(prop)- 12*prop )

ggplot(p2_e, aes(x="", y=n, fill=forcats::fct_rev(factor(Estrato)))) +
  geom_col(position = position_stack()) +
  scale_fill_manual(values=p2_colores) +
  xlab("") + ylab("") +
  labs(title="Proporción de estrato", fill="Estrato", caption="Grupo 5") +
  coord_polar("y", start=0) +
  geom_text(aes(x=1.6,y = ypos, label = n), color = "black", size=4.2) +
  theme_void()

### Carrera
colourCount = length(unique(alumnos$carrera))
p2_colores_3 = colorRampPalette(brewer.pal(9, "Set1"))

p2_c <- alumnos %>% 
  group_by(carrera) %>%
  summarise(n = n()) %>%
  mutate(prop = n / sum(n) *100) %>%
  mutate(ypos = 50*cumsum(prop)- 20*prop )

ggplot(p2_c, aes(x="", y=n, fill=forcats::fct_rev(factor(carrera)))) +
  geom_col(position = position_stack()) +
  scale_fill_manual(values=p2_colores_3(colourCount)) +
  xlab("") + ylab("") +
  labs(title="Proporción de carrera", fill="Carrera", caption="Grupo 5") +
  coord_polar("y", start=0) +
  geom_text(aes(x=1.6,y = ypos, label = n), color = "black", size=4.2) +
  theme_void()


# Punto 3: Carrera y género
p3_al <- alumnos %>% count(carrera,genero) %>% group_by(carrera,genero)
p3_ta = cbind(p3_al)
p3_la <- as.matrix(p3_ta)
xtable(p3_ta)


# Punto 4: Freq rel carrera y estrato
p4_alumnos <- alumnos %>% group_by(carrera, Estrato) %>% summarise(n = n()) %>%  mutate(freq=n/sum(n))
p4_al <- alumnos %>% group_by(carrera, Estrato) %>% summarise(n = n()) %>%  mutate(freq=n/sum(n)) %>%
  select(carrera,Estrato,freq) %>% pivot_wider(names_from = Estrato, values_from = freq)
p4_ta = cbind(p4_al)
xtable(p4_ta)

## Mejor gráfica?
ggplot(p4_alumnos, aes(x=carrera, y=freq, fill=forcats::fct_rev(factor(Estrato)))) +
  scale_fill_manual(values=p2_colores) +
  geom_col(position = position_stack()) +
  xlab("Carreras") + ylab("Proporción de estratos") + 
  labs(title="Estrato por carrera", fill="Estrato", caption="Grupo 5") +
  theme_light()


# Punto 5: Gráficos edad
## Barras
p5_alumnos <- alumnos %>% group_by(carrera,edad) %>% count(carrera)

p5_colores = brewer.pal(n = 9, "YlGnBu")[1:9]

ggplot(p5_alumnos, aes(x=edad, y=n)) +
  geom_col(position = position_stack(), color="#22ADE6", fill="#22ADE6") +
  xlab("Edades") + ylab("Cantidad de estudiantes") + 
  labs(title="Cantidad de estudiantes por Edad", fill="Edad", caption="Grupo 5") +
  theme_light()

## Torta
p5_e <- alumnos %>% 
  group_by(edad) %>%
  summarise(n = n()) %>%
  mutate(prop = n / sum(n) *100) %>%
  mutate(ypos = 50*cumsum(prop)- 20*prop )

ggplot(p5_e, aes(x="", y=n, fill=forcats::fct_rev(factor(edad)))) +
  geom_col(position = position_stack()) +
  scale_fill_manual(values=p5_colores) +
  xlab("") + ylab("") +
  labs(title="Proporción de edad", fill="Edad", caption="Grupo 5") +
  coord_polar("y", start=0) +
  geom_text(aes(x=1.6, y = ypos, label = c("","",310,1187,1891,1204,339,"","")), color = "black", size=4.2) +
  theme_void()


# Punto 6: Gráficas var. continuas
## Promedio
### Histograma
p6_alumnos <- alumnos %>% select(promedio,peso,altura,genero)

p6_breaks_p <- pretty(range(p6_alumnos$promedio), n=nclass.Sturges((p6_alumnos$promedio)), min.n=1)

ggplot(p6_alumnos, aes(x=promedio)) +
  geom_histogram(breaks=p6_breaks_p, fill="#4DD9EA", color="#1D91C0") +
  xlab("Promedio") + ylab("Cantidad de estudiantes") +
  labs(title="Histograma de promedio", caption="Grupo 5") +
  theme_light()

### Caja
ggplot(p6_alumnos, aes(x="", y=promedio)) +
  geom_boxplot(outlier.colour = "red", fill="#4DD9EA") +
  stat_summary(fun=mean, geom="point", shape=17, size=4) +
  coord_flip() +
  theme_light()

## Peso
### Histograma
p6_breaks_pe <- pretty(range(p6_alumnos$peso), n=nclass.Sturges((p6_alumnos$peso)), min.n=1)
  
ggplot(p6_alumnos, aes(x=peso)) +
  geom_histogram(breaks=p6_breaks_pe, fill="#4DD9EA", color="#1D91C0") +
  xlab("Peso") + ylab("Cantidad de estudiantes") +
  labs(title="Histograma de peso", caption="Grupo 5") +
  theme_light()
  
### Caja
ggplot(p6_alumnos, aes(x=genero, y=peso)) +
  geom_boxplot(outlier.colour = "red", fill="#4DD9EA") +
  stat_summary(fun=mean, geom="point", shape=17, size=4) +
  coord_flip() +
  theme_light()

## Altura
### Histograma
p6_breaks_al <- pretty(range(p6_alumnos$altura), n=nclass.Sturges((p6_alumnos$altura)), min.n=1)

ggplot(p6_alumnos, aes(x=altura)) +
  geom_histogram(breaks=p6_breaks_al, fill="#4DD9EA", color="#1D91C0") +
  xlab("Altura") + ylab("Cantidad de estudiantes") +
  labs(title="Histograma de altura", caption="Grupo 5") +
  theme_light()

### Caja
ggplot(p6_alumnos, aes(x=genero, y=altura)) +
  geom_boxplot(outlier.colour = "red", fill="#4DD9EA") +
  stat_summary(fun=mean, geom="point", shape=17, size=4) +
  coord_flip() +
  theme_light()


# Punto 7: Medidas de tendencia central
p7_mean <- alumnos %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(mean))
p7_median <- alumnos %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(median))
p7_mfv_p = mfv(alumnos$peso)
p7_mfv_p_s = paste(c("M: ", p7_mfv_p[1], "  H: ", p7_mfv_p[2]), collapse = " ")
p7_mfv_a = mfv(alumnos$altura)
p7_mfv_a_s = paste(c("M:", p7_mfv_a[1], "  H:", p7_mfv_a[2]), collapse = " ")

p7_mfv <- alumnos %>% select(promedio, edad, peso, altura) %>% 
  summarise_at(c("promedio", "edad"), funs(mfv)) %>% mutate(peso = p7_mfv_p_s, altura = p7_mfv_a_s)

p7_sum <- data.frame(Variables = c("promedio", "edad", "peso", "altura"), 
                     Promedio = as.vector(t(p7_mean)), Mediana = as.vector(t(p7_median)), 
                     Moda = as.vector(t(p7_mfv)))
p7_ta = cbind(p7_sum)
xtable(p7_ta)


# Punto 8: Medidas de variabilidad
rango <- function(a) {
  res <- range(a)[2]-range(a)[1]
  return(res)
}

p8_ra <- alumnos %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(rango))
p8_var <- alumnos %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(var))
p8_sd <- alumnos %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(sd))
p8_cv <- alumnos %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(cv))

p8_sum <- data.frame(Variables = c("promedio", "edad", "peso", "altura"), 
                     Rango = as.vector(t(p8_ra)), Desviación = as.vector(t(p8_sd)), Varianza = as.vector(t(p8_var)), 
                     CVariacion = as.vector(t(p8_cv)))
p8_ta = cbind(p8_sum)
xtable(p8_ta)


# Punto 9: Posición relativa
qts = c(0.25,0.75,0.85,0.92)
p9_pr <- quantile(alumnos$promedio,qts)
p9_ed <- quantile(alumnos$edad,qts)
p9_pe <- quantile(alumnos$peso,qts)
p9_al <- quantile(alumnos$altura,qts)

p9_cb = cbind(p9_pr, p9_ed, p9_pe, p9_al)

p9_sum <- data.frame(Variables = c("promedio", "edad", "peso", "altura"), 
                     ".25" = as.vector(t(p9_cb[1,])), 
                     ".75" = as.vector(t(p9_cb[2,])), 
                     ".85" = as.vector(t(p9_cb[3,])), ".92" = as.vector(t(p9_cb[4,])))
p9_ta = cbind(p9_sum)
xtable(p9_ta)


# Punto 10-11: Asimetría y apuntamiento
p10_asi_m <- alumnos %>% filter(genero=="M") %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(skewness))
p10_asi_f <- alumnos %>% filter(genero=="F") %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(skewness))
p10_apu_m <- alumnos %>% filter(genero=="M") %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(kurtosis))
p10_apu_f <- alumnos %>% filter(genero=="F") %>% select(promedio, edad, peso, altura) %>% summarise_all(funs(kurtosis))

p10_sum <- data.frame(Variables = c("promedio", "edad", "peso", "altura"), 
                      "Asimetria (M)" = as.vector(t(p10_asi_m)),
                      "Asimetria (F)" = as.vector(t(p10_asi_f)),
                      "Apuntamiento (M)" = as.vector(t(p10_apu_m)),
                      "Apuntamiento (F)" = as.vector(t(p10_apu_f)))

p10_ta = cbind(p10_sum)
xtable(p10_ta)
