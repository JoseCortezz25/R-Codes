est_pacientes

#Conversión a matriz
pac <- as.matrix.data.frame(est_pacientes)

#Revisamos la estructura
str(pac)
class(pac)
pac2 <- pac

library(dplyr)
# conversion de inglés a español 
translator <- function(column){
  return(
    conversionColumn1 <- case_when(
      pac2[,column] == "low" ~ "Bajo",
      pac2[,column] == "mid" ~ "Medio",
      pac2[,column] == "high" ~ "Alto"
    ))
}

pac2[,1] <- translator(1)
pac2[,2] <- translator(2)
pac2[,4] <- translator(4)

translator2 <- function(column){
  return(
    conversionColumn1 <- case_when(
      pac2[,column] == "excellent" ~ "Excelente",
      pac2[,column] == "good" ~ "Bueno"
    ))
}

pac2[,3] <- translator2(3)

translator3 <- function(column){
  return(
    conversionColumn1 <- case_when(
      pac2[,column] == "stable" ~ "Estable",
      pac2[,column] == "mod-stable" ~ "Medio Estable",
      pac2[,column] == "unstable" ~ "Inestable",
    ))
}

pac2[,5] <- translator3(5)
pac2[,6] <- translator3(6)
pac2[,7] <- translator3(7)

pac2

#Cambiar el tipo de dato char a numerico en la columna 8
pac3 <- pac2
#extraer columna 8
class(pac2[,8])
pac2[,8]

column <- as.numeric(pac3[,8])
column
pac3

#Uso de Summary y limpieza de datos NA por la media
summary(column)

mean(column, na.rm=TRUE)

media <- round(mean(column, na.rm=TRUE), 1)

column
column[47] <- media
column[49] <- media
column[71] <- media
datosnume <- column
#Eliminar columna 8 de la matriz original y colocarla al final con los datos ya limpios de NA
pac3

pac3 <- pac3[,-8] 
pac3 <- cbind(pac3, datosnume)

#Convertir la matriz a dataframes se usa as.data.frame, revisar igualmente la estructura con str
class(pac3)
pac3 <- as.data.frame(pac3)
class(pac3)
str(pac3)

#Convertir la ultima columna a dato numérico ya que es un factor

class(pac3[,9])
pac3[,9] <- as.numeric(as.character(pac3[,9]))
class(pac3[,9])
pac3
str(pac3)
pac4[,9] <- as.numeric(as.character(pac4[,9]))

#Colocarle nombres de columnas y filas al dataframe
colnames( pac3 ) <- c("L-CORE", "L-SURF", "L-O2", "L-BP", "SURF-STBL", "CORE-STBL", "BP-STBL",  "ADM-DECS", "COMFORT")
pac3

pac4 <- as.data.frame(pac3) 

i <- 0
while(i < count(pac4)){
  i <-  i + 1
  rownames(pac4)[i] <- paste("Paciente", i) 
}

#GRAFICA 1
colors <- c("green", "yellow")

ggplot(pac3, aes( x = pac3$`L-O2` )) + 
  geom_bar(fill=colors) + 
  labs(title="Pacientes con saturación de O2", x = "Niveles de saturación de O2", y = "Pacientes") +
  theme_dark()

#GRAFICA 2
colors <-  c("blue", "yellow", "green")
ggplot(pac3, aes( x = pac3[,"ADM-DECS"] )) + 
  geom_bar(fill=colors) + 
  labs(title="Estado de Pacientes Pendientes de Salida", x = "Estados", y = "Pacientes") +
  theme_dark()

#GRAFICA 3
colors <-  c("blue")
ggplot(pac3, aes( x = pac3[,"COMFORT"]),  y = pac3[,"ADM-DECS"]) + 
  geom_bar(fill=colors)

colors <-  c("red")
ggplot(pac3, aes( x = pac3[,"ADM-DECS"])) + 
  geom_bar(fill=colors, aes(fill=COMFORT), position = "dodge") +
  labs(title="Evaluación paciente segun la atención", x = "Calificación", y = "Pacientes") 
  

library("ggplot2")


