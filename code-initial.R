numero <- 5
print(numero)

numero <- 60
print(numero)

class(numero)

!2 > 3

mi_funcion <- function ( x, y ){
  result <- x+y
  if(result >= 10){
    print("El numero es mayor a 10")
  }else{
    print("Menor a diez :(")
  }
}

mi_funcion(5, 8)

y <- 1 ? 2*3 : 4


result2 = 2? 2*5 : 4

#pueden ser numero
vec <- c(1,3,5,6,1)
vec

#ver estructura de la variable
str(vec)

vector = c("hola", 3)
vector2 = c(4, "hola")

vector
vector2


vectornumero = c(2,4,1,4.6)
vectornumero



#para crear un vector rapido creamos frecuencias
 vector3 = c(1:50)
 vector3

vector3 = seq(32,45, by=0.25)
vector3

#media
mediadatos = mean(vector3)
mediadatos

#mediana
medianadatos = median(vector3)
medianadatos

#moda
#sort = organizar datos de mayor  a menor
modadatos = (sort(table(vector3),decreasing = TRUE))
modadatos


summary(vector3)

porcentajes = quantile(vector3)
porcentajes

porc = quantile(vector3, c(.18, .36, .72))
porc


barplot(porcentajes)

#matrices
#valor de la matriz, numero de columnas, numero de filas
matrix(0, 3 ,4)

matrix(1:9, 3, 3)

#ingrensando datos de manera horizontal
matrix(1:20, 5,4, byrow = T)

#datos aleatorios
vector5 = sample(1:20, 20, replace=T)
vector5

matrix(vector5, 5,4, byrow = T)
