---
title: "Propuesta de Proyecto Final"
author: "Katia Villalobos y Mariano Diaz"
date: "09/02/2022"
output:
 rmdformats::readthedown:
 code_folding: show
 self_contained: true
 thumbnails: false
 lightbox: true
 pkgdown:
 as_is: true
---

```{r}
names(data)
attach(data)
```

#VD: NÚMERO DE PROFESORES QUE SE ENCUENTRA EN UNA ESCALA MAGISTERIAL ALTA

```{r}
Escala_magisterial = data$P1_8
Número_Estudiantes_Compañia = data$P1_6
Condicion_laboral = data$P1_7
Riesgo_Covid = data$P1_5
Apoyo_psicologico = data$P1_13
Ocupacion_Adicional = data$P1_16
Deudas = data$P1_18
Estimulos = data$P1_23
```

```{r}
str(P1_6) #numero de estudiantes a los que se les brinda acompañamiento
str(P1_7) #Condición laboral en el IE
str(P1_5) #vive con alguien de riesgo Covid
str(P1_13) #Apoyo psicológico
str(P1_16)  #ocupacion adicional
str(P1_18) #Tiene Deudas o no
```

#Indice de confianza en las isntituciones educativas

```{r}
IndAditivo = (P1_22_A+P1_22_B+P1_22_C+P1_22_D+P1_22_E+P1_22_F)
summary(IndAditivo)
data$resta = IndAditivo-6
summary(data$resta)
data$division = data$resta/18
summary(data$division)
Indice = data$division*100
summary(Indice)
```

#str(P1_23) #estimulos para los docentes
#table(P1_23)

#FACTORES QUE AYUDARÍAN PARA MEJORAR LA PEDAGOGIA
str(P1_25_A)
na.omit(P1_25_A)
na.omit(P1_25_B)
na.omit(P1_25_C)
na.omit(P1_25_D)

```{r}
IndAditivo1 = (P1_25_A+P1_25_B+P1_25_C+P1_25_D)
summary(IndAditivo1)
data$resta1 = IndAditivo1-0
summary(data$resta1)
data$division1 = data$resta1/4
summary(data$division1)
Indice1 = data$division1*100
summary(Indice1)
```


```{r}
Reconocimiento = data$P1_29
```


```{r}
datos = data.frame(Escala_magisterial, Número_Estudiantes_Compañia, Condicion_laboral,Riesgo_Covid, Apoyo_psicologico, Ocupacion_Adicional, Deudas, Indice, Estimulos, Indice1, Reconocimiento)
datos = na.omit(datos)
```

#DICCIONARIO DE DATOS
```{r}
library(kableExtra)
library(tidyverse)
text_tbl1 <- data.frame(
  Variables = c("P1_8", "P1_6", "P1_7","P1_5", "P1_13", "P1_16", "P1_18", "Indice", "P1_23", "P1_29", "Indice1" ),
  Pregunta = c(
    "¿En qué escala magisterial se ubica actualmente?",
    "¿A cuántos estudiantes le brinda acompañamiento como docente de aula en esta IE? ", 
    "¿Cuál es su condición laboral actual en esta IE? ",
    "En su hogar ¿Vive con personas que están en el grupo de riesgo ante COVID-19 por enfermedades preexistentes?",
    "¿Usted ha recibido apoyo psicológico y/o emocional?", 
    "¿Tiene alguna ocupación adicional que le genere ingresos económicos?",
    "¿En este momento se encuentra pagando algún préstamo o crédito?", 
    "Indice de confianza en las instituciones educativas", 
    "¿Qué estímulos deberían recibir los docentes para promover las innovaciones o buenas prácticas pedagóficas?",
    "¿Has recibido algún reconocimiento por implementar buena práctica o innovación?",
    "Índice de factores que ayudarían para mejorar la pedagogía"))

kable(text_tbl1, format = "html", digits = 2, caption = "Diccionario de variables") %>%
kable_styling(bootstrap_options = "striped", full_width = F, font_size = 14)  %>% 
                row_spec(0,bold = T, color = "white", background = "mediumturquoise")

```

#TABLA DE DATOS
```{r}
kable(datos, format = "html", digits = 2, caption = "Tabla de base de datos") %>%
  kable_styling(bootstrap_options = "striped", full_width = F, font_size = 14)  %>% 
  row_spec(0,bold = T, color = "white", background = "orangered")
```

#DESCRIPTIVOS DE LA V.DEPENDIENTE
```{r}
library("psych")
datos$Escala_magisterial = as.numeric(datos$Escala_magisterial)
describe.by(datos$Escala_magisterial)
hist(datos$Escala_magisterial, main = "¿En qué escala magisterial se ubica actualmente?", col = "salmon")
```

