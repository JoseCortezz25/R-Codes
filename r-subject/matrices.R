### primeros pasos con vectores ###

##Creando un vector
##se usa c para concatenar todos los datos
#Los vectores inician en UNO
nombre_variable <- c("Jose", "Chavarro", "Benilde", "Adri")

#otra forma de crearlo, crea secuencia desde el 1 al 20
vector2 <-  c(1:20)

#con decimales
#seq de secuencia
#by es un salto entre datos
vector3 <-  seq(0, 50, by=0.5)

#indigar la estructura o de que esta compuesto
str(nombre_variable)
#indagar el tipo de dato
class(nombre_variable)

# podemos poder operar vectores como cualquier otro dato (solo de tipo numerico)
vector2*2.6

#errores comunes
#cuando hay un caracter, convierte todos los elementos en caracter, ya que es prioridad
#el caracter predomina siempre
vector4 <- c("Jose", 20, 2.4, TRUE)

vector5 <-  c(TRUE, FALSE, FALSE, "TRUE")
#los numeros estan por encima de los boleanos
vector6 <-  c(TRUE, FALSE, FALSE, 1)

#los decimales estan encima y convierte los false o true en 1 y 0 ademas de pasarlos a decimal
vector6 <-  c(TRUE, FALSE, FALSE, 2.3)


## ----------- MATRICES ------------- ##

#CREANDO UNA MATRIZ
#los datos pueden ingresar horizontal o verticalmente
matrix(0, 3, 3)


#PASANDOLE UNA SECUENCIA (ingresando por columnas)
#los datos deben ser multiplos de las filas por columnas
#es decir 3 filas x 3 columnas es igual a 9, por lo cual, deben ser 9 datos
matrix(1:9, 3, 3)

##INGRESAR DATOS POR FILAS
matrix(1:9, 3, 3, byrow = TRUE)

#MATRICES DE TEXTO
#tambien podemos crear el vector por fuera y llamarlo, o crearlo desde dentro de la matriz
matrix( c("hi", "i", "have", "angry"), 2,2 )
vector_text <-  c("hi", "i", "have", "angry")
matrix( vector_text, 2,2 )

#MATRICES DE DATOS BOLEAMOS es igual, lo mismo con los decimales
matrix( vector3, 5,5 )

#otra forma de crearlo
matrix(vector3, nrow = 3, ncol = 3, byrow = T)


#DATOS ALEATORIOS#
#PARAMS: rango de numeros, cuando numeros que quiero que salga, Replace indica si los datos se
#repite o no, true = si se repite y false = no se repite
vec_aleatorio <-  sample(1:20, 20, replace = T)
vec_aleatorio

#NO SE REPITE
vec_aleatorio_no_repetidos <-  sample(1:20, 20, replace = F)
vec_aleatorio_no_repetidos

#guardando valor
mat <-  matrix(vec_aleatorio_no_repetidos, 4,5, byrow = T)
mat

#ingresando a los datos
#columna fila 2, columna 1
mat[2,1]

#ingresar solamente a los datos de una fila
mat[1,]

#ingresando solamente la columna
mat[,2]

#traernos los datos. Arranca desde la primera columna
#traernos rango de datos por columna
#al pedir que traiga mas de los datos que existen, R lanza NA, es decir un outliers (incosistencias en los datos)
#es decir, dato que no exista, que sea erroneo, donde haya una fecha o un numero solo
mat[1:3]

#hay que tener preocupacion, ya que si hay un dato NA, necesitamos reemplazarlo por otra cosa
#debemos revisar los datos
#lo que se puede hacer es quitarlo, ¿como? se suma y se divide por la length y el promedio lo sustituye por NA
# o solamente realizar las operaciones antes del NA
datos <- mat[1:21]
mean(datos)

#identificar datos NA o otros datos
#any es cualquiera, entonces valida si los datos son NA, retorna un true o false
any( is.na(datos) )

#INDENTIFICAR LA MEDIA Y DATOS NA
#otra manera de mirarlo, nos lanza la cantidad de NA
summary(datos)

#REEMPLAZO DEL DATO POR LA MEDIA
#reemplazarlo, pero como le pasamos decimal, reconfigura todo a decimal
datos[21] <-  10.50
datos

#INVERTIR LA MATRIZ ( LA TRANSPUESTA DE LA MATRIZ )
#pasa de ser columna a fila y de fila a columna, gira la matriz
tmat <- t(mat)
tmat

#hacer cualquier operacion
mat*2
mat+2
mat * mat

#summary es netamente informativo
summary(tmat)

#calcular los datos por toda la matriz (no filas, no columnas)
#medidas de tendencia central
mean(mat)
median(mat)
min(mat)
max(mat)

# --------- ESTADISTICA POR COLUMNAS --------

#MEDIA

#de cada columna saca el promedio en forma de vector
colMeans(mat)

#sacar por filas
rowMeans(mat)

#agregar columnas
#PARAMS: matriz y los datos de la nueva columna en forma de vector (debe tener la misma cantidad de elementos)
#si son 5 filas, son 5 elementos en el vector
cbind(mat, c(10, 25, 24, 53))

#reemplazar sobre la misma matriz
#sobreescribir
mat <-  cbind(mat, c(10, 25, 24, 53))

#crear copia
mat2 <-  cbind(mat, c(10, 25, 24, 53))

# ---------- CAMBIAR LOS INDICES POR NOMBRES (SE HACE DE ULTIMO) ---------- 
#PRIMERO se CARGAN LOS DATOS, al final SE COLOCAN LOS NOMBRES, o sino, los datos se pasa a string

# -- asignadole nombre a las columnas
#PARAMS: matriz y se le asigna un vector donde estara los nombres de las columnas
colnames( mat ) <- c("N1", "N2", "N3", "N4", "N5")
mat
summary(mat)

# -- asignadole nombre a las filas
#trae los nombres de las filas por si ya estan
row.names()

#poner el nombre
#cuando me falta un dato me arroja error
rownames(mat) <- c ("Jose", "Carlos", "Benilde", "Adri")
mat

# -------- FUNCION APPLY --------  
#funcion de base de R que nos permite hacer operaciones con matrices
#Nos sirve para empezar operaciones sobre la matriz

#apply(array, margin, ...)

#toma los datos y saca por filas toda su media
#recibe la matriz, 1 es igual a filas, la operacion estadistica
apply(mat, 1, mean)

#Ahora con columnas
apply(mat, 2, mean)

#AGREGAR RESULTADOS A LA MATRIZ
#sobreescribir una columna nueva, y esta columna debe saber en que matriz debe estar, con apply
#toma todos los resultados de la fila y lo pondrá de forma de columna
mat3 <- cbind(mat, apply(mat, 1, mean))
mat3

#añadiendole el nombre a la nueva columna 
# --- namera 1: sin necesidad de poner todos los nombres, entre corchetes la posicion
colnames(mat3)[6] <- "PROM"
mat3


#PRIMERO REVISAR SI ES UN DATASET
class(students)

#mostrar las 4 primeras columnas
head(students)

# si da ] "spec_tbl_df" "tbl_df"      "tbl"         "data.frame" ES UN ERROR
#CONVERSION
students2 <- as.data.frame(students)
class(students2)
head(students2)

#acceder a la informacion pro columna mediante el signo peso

students2$school
