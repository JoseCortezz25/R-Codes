#suma
4 + 8

#resta
20 - 8

#potencia
4^2

oficina = 7
estudio = 1
transporte = 1.5
tiempo_al_dia = oficina + estudio + transporte
tiempo_al_dia + <-
  
  notac1 <- 0.4
notac2 <- 0.4
notac3 <- 0.2

nota1 <- 4.5
nota2 <- 5.4
nota3 <- 5.6

notafinal1 <- nota1 * notac1

notafinal2 <- nota2 * notac2

notafinal3 <- nota3 * notac3

promedio <- notafinal1 + notafinal2 + notafinal3

promedio

orangeec <- read.table("https://raw.githubusercontent.com/sap0408/Orange-Economy/master/orangeec.csv", header =  TRUE, sep = ",")
mtcars <- read.csv("https://raw.githubusercontent.com/sap0408/mtcars/master/mtcars.csv", sep = ',')

str(mtcars)
str(orangeec)
class(mtcars$am)

summary(mtcars)


wt <- (mtcars$wt*1000)/2
mtcars$wt <- (mtcars$wt*1000)/2

mtcars.new <- transform(mtcars, wt=wt*100/2)


str(mtcars)
summary(mtcars)


#matriz
tiempo_matrix = matrix(c(tiempo_platzi, tiempo_lecturas), nrow= 2,byrow=TRUE)

dias = c('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes')
tiempo= c("tiempo platzi", "tiempo lecturas")
colnames(tiempo_matrix) = dias
rownames(tiempo_matrix) = tiempo

tiempo_matrix