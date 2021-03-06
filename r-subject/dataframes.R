# ------------------------ DATA FRAME ------------------------ 
#Creacion de data frame
nombres <- c("Mario", "Alfonso", "Adri", "Mateo", "Jose")
edad <-  c(22, 20, 25, 19, 24)
genero <- factor(c("H","H", "M", "H","H"))
nota_final <- c(4.2, 4.3, 4.5, 4.4, 4.8)

mining_course <- data.frame(nombres, edad, genero, nota_final)
mining_course
summary(mining_course)
str(mining_course)

#Casteo o coercion pasar de factor a caracter
mining_course$nombres <- as.character(mining_course$nombres)
str(mining_course)
summary(mining_course)

#Siempre hay que llevar las cosas a caracter para pasarlo a otro dato. EJ: numero a boleano o factor
row.names(mining_course) <- c("F1", "F2", "F3", "F4", "F5")
mining_course

#---- llamar los datos del data frame ---- 

#traernos los datos de la columna 1
mining_course[,1]
#traernos los datos de la fila 1: trae los encabezados y los datos
mining_course[1,]
#coordenadas concretas
mining_course[3,1]
#traernos por rangos: traernos desde la 2 a la 4
mining_course[2:4,]
# con el nombre de las columnas
mining_course[, "edad"]
# traernos la fila por el nombre
mining_course["F1",]
#trae el vector completo de la edad: el doble corchetes abrevia la coma y trae toda la columna
mining_course[["edad"]]

#agregar columnas al data frame
mining_course <- cbind(mining_course, semestre=c(7, 8 ,5 ,4 ,1))
mining_course

#agregar filas es lo mismo pero en vez de cbind es con rbind
mining_course <- rbind(mining_course, F6=c("Sofia", 19 ,"M" ,2.4 ,6))
mining_course


# --- coerciones por el tema de añadir filas y columnas
str(mining_course$edad)
mining_course$edad <- as.numeric(mining_course$edad)
str(mining_course$edad)

str(mining_course$semestre)
mining_course$semestre <- as.numeric(mining_course$semestre)
str(mining_course$semestre)

str(mining_course)

#estadistica
mean(mining_course[,"semestre"])
mean(mining_course$semestre)
mean(mining_course[,5])
mean(mining_course[["semestre"]])

class(mining_course[,"semestre"])


mean(mining_course[,"semestre"])

##### --- sacar pequeños grupos de informacion o subsets
hombres <- subset(mining_course, genero=="H")
hombres

mujeres <- subset(mining_course, genero=="M")
mujeres

mean(mujeres$nota_final)

mayores_de_edad <-  subset(mining_course, genero=="H" & edad < 20)
mayores_de_edad

#############--------- --------- --------- --------- ----#############
#  --------- libreria que hace lo mismo pero mas easyy :) --------- 
library(dplyr)

#crear repeticiones: consiste en repetir el dato, similar a las secuencias
class <- c(rep("A", 4), rep("B", 4), rep("C", 4))
class
type <- c( rep("UNO", 6), rep("DOS", 6))
type

value <- c(20:31)

data <- data.frame(class, type, value)
data


# ------ filter -----

#signo de concatenacion en dplyr
data %>% filter(class=="C" & value > 30)

# ------ SELECT -----
data %>% select(class, value)


# ------- SELECT y FILTER -----
data %>% select(class, value) %>% filter(value > 23)

# ------ slice -----
#saca una porcion 
data %>% slice(2:5)  #primero cuatro datos


# ----------- SACAR DATOS ALEATORIOS -----------
#replace significa si repetir datos o no
data %>% sample_n(5, replace=F)

# ----------- AGRUPAR DATOS POR LA CLASE -----------
# summarise: operaciones matematicas, es decir, podemos realizar operaciones, esto
#añadira una columna, recibe el nombre de ella y el resultado de una operacion
data %>% group_by(class) %>% summarise(media= mean(value))


# ----------- ORGANIZAR LA INFORMACION  -----------
#los organiza de menor a mayor (manera ascendente)
data %>% arrange(value)

#los organiza de mayor a menor (manera descendente)
data %>% arrange(desc(value))

# ----------- AGREGAR FILAS  -----------
data %>% add_row(class="D", type="TRES", value=100)



# ----------- VALIDAR DATOS Y CAMBIAR ESTRUCTURA DE TABLE/DATA FRAME  -----------
#el if normal evalua la condicion normal
#if(){} evalua solamente un dato independiente, no toda la tabla

#el ifelse nos da la opcion de validar toda la columna. Evalua todos los datos
ifelse(a>b, "true", "false :(")

#mutar la estructura
#%in%: evalua si los datos estan en cierto rango
# mutate nos ayuda agregar una nueva columna y realizar validaciones
data %>% mutate(categoria=ifelse(value %in% 0:22, "Datos 20", 
                                 ifelse(value %in% 23:25, "Datos 25", 
                                        ifelse(value %in% 26:100, "Dato 100", "NO"))))


##data %>% mutate(categoria=ifelse(valor %in% 0:30, "Datos 20",
#                                ifelse(valor %in% 31:60, "Datos 25",
#                                        ifelse(valor %in% 60:100, "Datos cien"))))


# --- cambiar el nombre de la columna
data %>% rename(valores = value)



















