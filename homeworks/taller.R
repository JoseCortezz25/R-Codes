#revisando estructura
class(est_pacientes)

#conversion del tipo 
pac <- as.matrix.data.frame(est_pacientes2)
pac2 <- as.matrix.data.frame(est_pacientes2)
pac
pac2

#otra manera
if(pac[,1] == "low"){
  pac[1,1]
}

#otra manera (optima pero mas o menos)
ifelse(pac[,1] == "low", "bajo", pac[,1])

#case when (debo importar la libreria)

library(dplyr)
#pac[,column] == paste("",match_value1) ~ paste("",new_value1),
#pac[,column] == paste("",match_value2) ~ paste("",new_value2),
#pac[,column] == paste("",match_value3) ~ paste("",new_value3),

# -------------- PASO 4---------------------
filtercolumn <- function(matrix, number_options, column, 
                         match_value1, match_value2, match_value3, 
                         new_value1, new_value2, new_value3){
  if(number_options == 3){
    print("opcion 3")
    return (conversionColumn1 <- case_when(
      matrix[,column] == match_value1 ~ new_value1,
      matrix[,column] == match_value2 ~ new_value2,
      matrix[,column] == match_value3 ~ new_value3,  
    ))
  }
  if(number_options == 2){
    print("opcion 2")
    return (conversionColumn1 <- case_when(
      matrix[,column] == match_value1 ~ new_value1,
      matrix[,column] == match_value2 ~ new_value2,
    ))
  }
}

pac3[,1] <- filtercolumn(pac3, 3, 1, "low", "mid", "high", "Bajo", "Medio", "Alto")
pac3[,2] <- filtercolumn(pac3, 3, 2, "low", "mid", "high", "Bajo", "Medio", "Alto")
pac3[,3] <- filtercolumn(pac3, 2, 3, "excellent", "good", "", "Excelente", "Bueno", "")
pac3[,4] <- filtercolumn(pac3, 3, 4, "low", "mid", "high", "Bajo", "Medio", "Alto")
pac3[,5] <- filtercolumn(pac3, 3, 5, "stable", "unstable", "mod-stable", "Estable", "Inestable", "Medio Estable")
pac3[,6] <- filtercolumn(pac3, 3, 6, "stable", "unstable", "mod-stable", "Estable", "Inestable", "Medio Estable")
pac3[,7] <- filtercolumn(pac3, 3, 7, "stable", "unstable", "mod-stable", "Estable", "Inestable", "Medio Estable")
pac3

pac3 <- pac
pac3
# -----------------------------------

# --------------- PASO 5 --------------------
# Paso 5: Cambiar el tipo de dato char a numerico en la columna 8
#pasar a data frame
pac3 <-  as.data.frame(pac3)
pac3

#pasando de character a numerico
pac3_new2 <- as.matrix.data.frame(pac3_new2)
pac3_new2[,8] = as.numeric(pac3_new2[,8])
pac3_new2[,8]

columnx8 = as.numeric(pac3_new2[,8])
columnx8
#quitandole los 5
summary(columnx8)
media <- round(mean(columnx8, na.rm=TRUE), 1)
media
#añadiendo
columnx8[47] <- media
columnx8[49] <- media
columnx8[71] <- media
columnx8

#pac3[,8]
#pac3_new <-  pac3
#pac <- 
mean(pac3[,8])
# ----------------- Paso 7 --------------------
#Paso 7: Eliminar columna 8 de la matriz original y colocarla al final con los datos ya limpios de NA
pac3_new2
pac3_new3 <- pac3_new2
pac3_new3

pac3_new3

pac3_new2 <- pac3_new2[, -8]
pac3_new2
pac3_new2 <- cbind(pac3_new2, columnx8)
datosnume <- columnx8
datosnume
#datosnume
pac3_new2 <- cbind(pac3_new2, datosnume) 
pac3_new2
# ---------------------------------------------

# --------------------- Paso 8 ------------------------
#Paso 8: Convertir la matriz a dataframes se usa as.data.frame, revisar igualmente la estructura con str.

pac3_new2 <- as.data.frame(pac3_new2)
class(pac3_new2)
str(pac3_new2)
pac3_new2
# -----------------------------------------------------


# ------------------------Paso 9  ---------------------
#Paso 9: Convertir la ultima columna a dato numérico ya que es un factor.
class(pac3_new2[,9])
pac3_new2[,9] <- as.numeric(pac3_new2[,9])
pac3_new2[,9]
str(pac3_new2)
# -----------------------------------------------------
# ------------------------ Paso 9 ---------------------
#Paso 9: Convertir la ultima columna a dato numérico ya que es un factor.
pac3_new2[,9] <- as.numeric(as.character(pac3_new2[,9]))
str(pac3_new2)
# -----------------------------------------------------
# ------------------------ Paso 10 -----------------------
#Paso 10: Colocarle nombres de columnas y filas al dataframe.
pac3_new2
matriz_datos <-  pac3_new2
colnames( pac3_new2 ) <- c("L-CORE", "L-SURF", "L-O2", "L-BP", "SURF-STBL", "CORE-STBL", "BP-STBL", "COMFORT", "ADM-DECS")
pac3_new2

i <- 0
while(i < count(pac3_new2)){
  i <-  i + 1
  rownames(pac3_new2)[i] <- paste("Paciente ", i)
}

rownames(pac3_new2)[90] <- "Paciente 90"
addnamesrows(pac3_new2)
pac3_new2

length(matriz_datos)  
paste("parciena", 1)


# -----------------------------------------------------
# ------------------------ Paso 11 -----------------------
#Paso 11: Algunas gráficas de interés.
install.packages("ggplot2")

library("ggplot2")

names <- 
  
Plantas = c(15,16,18,18,12,12,25,10,15,22,14,14,16,4,8,5,7,3,9,12) # Plantas nacidas por m2
Parcela = paste("P", 1:20)
Tratamiento = rep((c("Tratado","Testigo")),c(10,10))
df = data.frame(Tratamiento, Parcela, Plantas)
df
ggplot(data=df, aes(x=Tratamiento, y=Plantas, fill=Parcela)) + 
  geom_bar(stat="identity", position="dodge")


namesrows = paste("Paciente", 1:90)
namesrows


namescolumns <- c("Excelente", "Bueno")
namescolumns
niveles <- rep((c("Excelente", "Bueno")), pac3_new2["L-O2"])
pac3_new2["L-O2"]

variablita <- table(pac3_new2["L-O2"])
variablita
pac3_new2["L-O2"]

resumen <- summary(pac3_new2["L-O2"])

colors <- c("blue", "red")
barplot(variablita, xlab = "Niveles de saturación de O2", ylab = "Pacientes", main="Niveles de saturación de O2", col = colors)


class(as.matrix.data.frame(pac3_new2["L-O2"]))
class(as.data.frame.factor(pac3_new2["L-O2"]))


#GRAFICA 1
colors <- c("blue", "red")
ggplot(pac3_new2, aes( x = pac3_new2$`L-O2` )) + 
  geom_bar(fill=colors) + 
  labs(title="Niveles de saturación de O2", x = "Niveles de saturación de O2", y = "Pacientes") +
  theme_dark()

#GRAFICA 2
colors <-  c("blue", "yellow", "green")
ggplot(pac3_new2, aes( x = pac3_new2[,"COMFORT"] )) + 
  geom_bar(fill=colors) + 
  labs(title="Estado de Pacientes Pendientes de Salida", x = "Estados", y = "Pacientes") +
  theme_dark()

#GRAFICA 3
ggplot(pac3_new2, aes( x =  pac3_new2[,"ADM-DECS"], y = pac3_new2[,"COMFORT"])) + 
  geom_bar(stat = "identidad")

pac3_new2














ggplot(pac3_new2, aes( x=as.matrix.data.frame(pac3_new2["L-O2"]))) + 
  geom_bar(fill=colors) + 
  labs(title="Niveles de saturación de O2", x = "Niveles de saturación de O2", y = "Pacientes") +
  theme_dark()





#SECUENCIA PARA AÑADIRLE NOMBRES A LAS FILAS
seq(1, 90)


# -----------------------------------------------------

pac3 

results <- filtercolumn(pac, 3, 1, "low", "mid", "high", "Bajo", "Medio", "Alto")
results

results2 <- filtercolumn(pac, 2, 3, "excellent", "good", "", "Excelente", "Bueno","")
results2

pac[,1]

conversionColumn1 <- case_when(
  pac[,1] == "low" ~ "Bajo",
  pac[,1] == "mid" ~ "Medio",
  pac[,1] == "high" ~ "Alto".
)

conversionColumn2 <- case_when(
  pac[,1] == "low" ~ "Bajo",
  pac[,1] == "mid" ~ "Medio",
  pac[,1] == "high" ~ "Alto".
)

conversionColumn3 <- case_when(
  pac[,1] == "low" ~ "Bajo",
  pac[,1] == "mid" ~ "Medio",
  pac[,1] == "high" ~ "Alto".
)

#generar vector

#pasarlo a la columna

class(pac[,1])

holaa <- as.factor(pac[,1])
  
sadasd <- ad.data.frame(matrizzzzzzz)