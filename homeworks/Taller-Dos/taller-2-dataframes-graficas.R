wimbledon_women_2013

#Paso 2: Convertir a DataFrame
wimbledon_women <- as.data.frame(wimbledon_women_2013)
class(wimbledon_women)
wimbledon_women

#Paso 3: Buscar las jugadoras1 con porcentaje >=78 en el primer servicio y que 
#pertenezcan a la primera ronda del torneo.

library(dplyr)
player1_top_78 <- as.data.frame(wimbledon_women %>% select(Player1, FSP.1) %>% filter(FSP.1 >= 78))


#Paso 4: Graficar la búsqueda anterior.
#GRAFICA 1 
library(ggplot2)

chart <- ggplot(data=player1_top_78, aes(x=Player1, fill=as.factor(FSP.1))) + 
  geom_bar(position = "dodge") + scale_color_manual(values=c("#e74c3c", "#2ecc71",  "#3498db", "#9b59b6", "#f1c40f")) +
  labs(title="Mejores Servicios Primera Ronda", x = "Jugadoras Ronda Uno", y = "Valores Porcentuales", fill="Porcentaje 1 Servicio") + 
  theme_gray(base_size = 14)
chart

#Paso 5: Buscar las jugadoras2 con porcentaje >=78 en el primer servicio 
#y que pertenezcan a la primera ronda del torneo.
player2_top_78 <- as.data.frame(wimbledon_women %>% select(Player2, FSP.2) %>% filter(FSP.2 >= 78))
player2_top_78


chart2 <- ggplot(data=player2_top_78, aes(x=Player2, fill=as.factor(FSP.2))) + 
  geom_bar(position = "dodge") + scale_color_manual(values=c("#e74c3c", "#2ecc71",  "#3498db", "#9b59b6", "#f1c40f")) +
  labs(title="Mejores Servicios Primera Ronda", x = "Jugadoras Ronda Dos", y = "Valores Porcentuales", fill="Porcentaje 1 Servicio") + 
  theme_gray(base_size = 12)
chart2

#Paso 7: Del paso 3 tomar solo el top 3 de jugadoras
top3_player1 <- as.data.frame(player1_top_78 %>% arrange(desc(FSP.1)) %>% slice(1:3))
mean(top3_player1$FSP.1)

#Paso 8: Sacar la media del resultado del paso 5 y 7
top3_player2 <- as.data.frame(player2_top_78 %>% arrange(desc(FSP.2)) %>% slice(1:3))
mean(top3_player2$FSP.2)

players <- c("Players1", "Players2")
mean <- c(mean(top3_player1$FSP.1), mean(top3_player2$FSP.2))
mean_general <- data.frame(players, mean)


#Paso 9: Graficar en barras y pie con los datos del punto 8.
#GRAFICA 2
chart3 <- ggplot(mean_general,aes(x="",y=mean, fill=players))+
  geom_bar(stat = "identity",color="white")+
  labs(y = "Promedios",fill="Jugadores") 
chart3 

#GRAFICA 3
chart4 <- ggplot(mean_general,aes(x="",y=mean, fill=players))+
  geom_bar(stat = "identity",color="white")+
  coord_polar(theta="y") + labs(y = "Promedios",fill="Jugadores") 
chart4

