# Developed by Alfonso Jose Chavarro Cortes

est_pacientes

#Paso 2: Conversión a Matriz
pac <- as.matrix.data.frame(est_pacientes)

#Paso 3: Revisar la estructura de la Matriz
str(pac)

#Paso 4: Pasar los datos a Español
#funcion que pasa datos de inglés a español, recibe 9 parametros
#PARAMS: 1: matriz a modificar, 2: numero de datos a cambiar, 3: columna a modificar
#        4-6: datos a modificar en ingles, 7-9: datos en español
library(dplyr)
interpreterColumns <- function(matrix, number_options, column, 
                         match_value1, match_value2, match_value3, 
                         new_value1, new_value2, new_value3){
  if(number_options == 3){
    return (conversionColumn1 <- case_when(
      matrix[,column] == match_value1 ~ new_value1,
      matrix[,column] == match_value2 ~ new_value2,
      matrix[,column] == match_value3 ~ new_value3,  
    ))
  }
  if(number_options == 2){
    return (conversionColumn1 <- case_when(
      matrix[,column] == match_value1 ~ new_value1,
      matrix[,column] == match_value2 ~ new_value2,
    ))
  }
}


pac[,1] <- interpreterColumns(pac, 3, 1, "low", "mid", "high", "Bajo", "Medio", "Alto")
pac[,2] <- interpreterColumns(pac, 3, 2, "low", "mid", "high", "Bajo", "Medio", "Alto")
pac[,3] <- interpreterColumns(pac, 2, 3, "excellent", "good", "", "Excelente", "Bueno", "")
pac[,4] <- interpreterColumns(pac, 3, 4, "low", "mid", "high", "Bajo", "Medio", "Alto")
pac[,5] <- interpreterColumns(pac, 3, 5, "stable", "unstable", "mod-stable", "Estable", "Inestable", "Medio Estable")
pac[,6] <- interpreterColumns(pac, 3, 6, "stable", "unstable", "mod-stable", "Estable", "Inestable", "Medio Estable")
pac[,7] <- interpreterColumns(pac, 3, 7, "stable", "unstable", "mod-stable", "Estable", "Inestable", "Medio Estable")
pac

#Paso 5: Cambiar el tipo de dato char a numerico en la columna 8
#Extraer columna 8
datosnume <- as.numeric(pac[,8])
datosnume

#Paso 6: Uso de Summary y limpieza de datos NA por la media
summary(datosnume)

#sacando LA media sin tener en cuenta los datos NA y redondeando el resultado
media <- round(mean(datosnume, na.rm=TRUE), 1)
media
#reemplazando los datos NA
datosnume[47] <- media
datosnume[49] <- media
datosnume[71] <- media
datosnume

#Paso 7: Eliminar columna 8 de la matriz original y colocarla al final con los datos ya limpios de NA
pac
pac <- pac[,-8] 
pac <- cbind(pac, datosnume)

#Paso 8: Convertir la matriz a dataframes se usa as.data.frame, revisar igualmente la estructura con str.
class(pac)
pac <- as.data.frame(pac)
class(pac)
pac
str(pac)

#Paso 9: Convertir la ultima columna a dato numérico ya que es un factor.
class(pac[,9])
pac[,9] <- as.numeric(as.character(pac[,9]))
class(pac[,9])
str(pac)


#Paso 10: Colocarle nombres de columnas y filas al dataframe.
colnames(pac) <- c("L-CORE", "L-SURF", "L-O2", "L-BP", "SURF-STBL", "CORE-STBL", "BP-STBL",  "ADM-DECS", "COMFORT")
pac

i <- 0
while(i < count(pac)){
  i <-  i + 1
  rownames(pac)[i] <- paste("Paciente", i) 
}

#Paso 11: Algunas gráficas de interés.

#GRAFICA 1
colors <- c("#2ecc71",  "#3498db")
chart1 <- ggplot(pac, aes( x = pac$`L-O2` )) + geom_bar(fill=colors) + 
  labs(title="Pacientes Con saturación de O2", x = "Niveles de Saturación de O2", y = "Pacientes") +
  theme_gray(base_size = 22)
chart1

#GRAFICA 2
colors2 <-  c("#e74c3c", "#2ecc71",  "#3498db")
chart2 <- ggplot(pac, aes( x = pac$`ADM-DECS` )) + geom_bar(fill=colors2) + 
  labs(title="Estado de Pacientes Pendientes de Salida", x = "Estados", y = "Pacientes") +
  theme_gray(base_size = 22)
chart2

#GRAFICA 3
chart3 <- ggplot(pac, aes(x=pac$COMFORT, fill=pac$`ADM-DECS`)) + 
  geom_bar(position = "fill") + scale_fill_manual(values=c("#e74c3c", "#2ecc71",  "#3498db")) +
  labs(title="Evaluación Paciente Según la Atención", x = "Calificación", y = "Pacientes", fill="Estados Pacientes") + 
  theme_gray(base_size = 22)
chart3



