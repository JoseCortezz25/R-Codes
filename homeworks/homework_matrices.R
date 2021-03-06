est_pacientes
pac <- as.matrix(est_pacientes)
pac
class(pac)
str(pac)
install.packages("dplyr")
library("dplyr")



column1 <- as.matrix(pac[,1])
pac
filtercolumn <- function(values){
  i <- 0
  for(value in values){
    i <-  i + 1
    if(values[i] == "low"){
      values[i] <- "bajo"
    }
    if(values[i] == "mid"){
      values[i] <- "medio"
    }
    if(values[i] == "high"){
      values[i] <- "alto"
    }
    print(values)
  }
  return (values)
} 

columns <-  filtercolumn(column1)
columns
pac2[, -1] <- columns
pac2 <- pac
pac2

pac2
pac2<- pac2[, -1]  

str(pac)

#column1[1] <- "1"
#column1[1]
#A <-  matrix(1:9, 3, 3)
#A
#A <- A[, -2]
#A
