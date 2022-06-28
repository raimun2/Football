library(jsonlite)
library(plyr)

setwd("C:/Users/Casa/Dropbox/soccer analytics/data/Mundial U20 Polonia 2019/Partidos")
load("data_procesada.RData")

### output partidos
#id partido es fecha y contrincantes

partidos = unique(data_partidos[,c("fecha","id_partido","equipo","local")])
data_partidos$outcome = "Tie"

for(i in 1:240){
  id_part = unique(partidos$id_partido)[i]
  data_i = data_partidos[data_partidos$id_partido == id_part,]
  data_i$goals = as.numeric(data_i$goals)
  
  if(sum(data_i$goals, na.rm=T)>0){
    
    resultado = aggregate(goals~equipo,data_i,sum)
    
    if(nrow(resultado)<2){
      resultado = merge(data.frame("equipo" = unique(data_i$equipo)),
                        resultado, 
                        by="equipo", all.x = T)
      
      resultado$goals = ifelse(is.na(resultado$goals), 0, resultado$goals)
    }
    
    if(resultado$goals[1] > resultado$goals[2]){
      data_partidos$outcome[data_partidos$equipo == resultado$equipo[1] & 
                              data_partidos$id_partido == id_part] <- "Victory"
      
      data_partidos$outcome[data_partidos$equipo == resultado$equipo[2] & 
                              data_partidos$id_partido == id_part] <- "Loss"
      
    } else if(resultado$goals[1] < resultado$goals[2]){
      data_partidos$outcome[data_partidos$equipo == resultado$equipo[1] & 
                              data_partidos$id_partido == id_part] <- "Loss"
      
      data_partidos$outcome[data_partidos$equipo == resultado$equipo[2] & 
                              data_partidos$id_partido == id_part] <- "Victory"
    } 
    
    
    
    
  }
}



#unique(data_partidos$position)
### falta decidir que hacer con el Wing Back

data_partidos$position[data_partidos$position== "Wing Back"] <- "Defender"

posiciones = c("Defender","Defensive Midfielder","Midfielder","Attacking Midfielder","Striker")
data_tabla1 = data_partidos[data_partidos$position %in% posiciones,]

variables = c("goalAssist", 
              "totalScoringAtt", 
              "ontargetScoringAtt", 
              "totalPass",
              "accuratePass",
              "totalThrows",
              "wasFouled" ,
              "totalOffside",
              "wonTackle" ,
              "totalClearance",
              "blockedScoringAtt",
              "fouls",
              "yellowCard",
              "goals",
              "totalTackle" ,
              "goalsConceded",
              "saves",
              "wonCorners"   ,
              "lostCorners",
              "minsPlayed")


# Assist : "goalAssist"
# Shot : "totalScoringAtt"
# Shot on target : "ontargetScoringAtt" 
# Passes :  "totalPass"
# Pass Accuracy (%) : "accuratePass" /  "totalPass"
# Through ball : "totalThrows"
# Foul drawn : "wasFouled"  
# Offside :  "totalOffside"
# Tackle :  "wonTackle" 
# Clearance : "totalClearance"
# Shot block : "blockedScoringAtt"
# Foul committed : "fouls"
# Yellow card :  "yellowCard"
# "goals"
# "totalTackle" 
# "goalsConceded"
# "saves"
#  "wonCorners"           
# "lostCorners"       


data_tabla1 = data_tabla1[,c("id_partido","equipo","position","idjugador","fecha","outcome",variables)]

#data_tabla1[50,]

data_tabla1[,7:26] = lapply(data_tabla1[,7:26],function(x) as.numeric(as.character(x)))

data_tabla1[is.na(data_tabla1)] <- 0


## output campeonato
# top3 vs bottom 3 vs row

campeonato = unique(data_partidos[,c("equipo","id_partido","outcome")])

campeonato$puntos = ifelse(campeonato$outcome == "Victory",3, 
                           ifelse(campeonato$outcome == "Loss", 0, 1))

posiciones_campeonto = aggregate(puntos ~ equipo, campeonato, sum)
posiciones_campeonto = posiciones_campeonto[order(-posiciones_campeonto$puntos),]

top3 = posiciones_campeonto$equipo[1:3]

nequipos = nrow(posiciones_campeonto)

bottom3 = c("San Luis","Deportes Temuco","Deportes Iquique")
bottom3 = posiciones_campeonto$equipo[(nequipos-2):nequipos]


data_tabla1$Output = "medio"
data_tabla1$Output[data_tabla1$equipo %in% top3] = "Top3"
data_tabla1$Output[data_tabla1$equipo %in% bottom3] = "Bottom3"


#### AHORA agregamos



means = aggregate(cbind(goalAssist, 
                        totalScoringAtt, 
                        ontargetScoringAtt, 
                        totalPass,
                        accuratePass,
                        totalThrows,
                        wasFouled ,
                        totalOffside,
                        wonTackle ,
                        totalClearance,
                        blockedScoringAtt,
                        fouls,
                        yellowCard,
                        goals,
                        totalTackle ,
                        goalsConceded,
                        wonCorners   ,
                        lostCorners)~Output+position, data= data_tabla1, 
                  mean)

sd = aggregate(cbind(goalAssist, 
                     totalScoringAtt, 
                     ontargetScoringAtt, 
                     totalPass,
                     accuratePass,
                     totalThrows,
                     wasFouled ,
                     totalOffside,
                     wonTackle ,
                     totalClearance,
                     blockedScoringAtt,
                     fouls,
                     yellowCard,
                     goals,
                     totalTackle ,
                     goalsConceded,
                     wonCorners   ,
                     lostCorners)~Output+position, data= data_tabla1, 
               sd)

colnames(means)[3:20] <- paste("mean", colnames(means)[3:20])
colnames(sd)[3:20] <- paste("sd", colnames(sd)[3:20])


tabla1 = cbind(means,sd[,-(1:2)])
write.table(tabla1, "tabla1.csv", sep=";", dec=",",row.names = F)
table(data_tabla1$position)

##### RADAR CHART 

devtools::install_github("ricardo-bion/ggradar", dependencies=TRUE)

library(ggradar)
suppressPackageStartupMessages(library(dplyr))
library(scales)
library(tibble)
library(ggplot2)
library(gridExtra)


means = aggregate(cbind(goalAssist, 
                        totalScoringAtt, 
                        ontargetScoringAtt, 
                        totalPass,
                        accuratePass,
                        totalThrows,
                        wasFouled ,
                        totalOffside,
                        wonTackle ,
                        totalClearance,
                        blockedScoringAtt,
                        fouls,
                        yellowCard,
                        goals,
                        totalTackle ,
                        goalsConceded,
                        wonCorners   ,
                        lostCorners)~Output+position, data= data_tabla1, 
                  mean)


data_radar = cbind(means[,1:2],as.data.frame(lapply(means[,-(1:2)], function(x) rescale(x))))


data_radar1 = data_radar[data_radar$position == "Attacking Midfielder", -2]
data_radar2 = data_radar[data_radar$position == "Defender", -2]
data_radar3 = data_radar[data_radar$position == "Defensive Midfielder", -2]
data_radar4 = data_radar[data_radar$position == "Midfielder", -2]
data_radar5 = data_radar[data_radar$position == "Striker", -2]



r1 = ggradar(data_radar1) + ggtitle("Attacking Midfielder")
r2 = ggradar(data_radar2) + ggtitle("Defender")
r3 = ggradar(data_radar3) + ggtitle("Defensive Midfielder")
r4 = ggradar(data_radar4) + ggtitle("Midfielder")
r5 = ggradar(data_radar5) + ggtitle("Striker")

dev.copy(png,"radarplot.png", width=1200, height=1400)
grid_arrange_shared_legend(r1, r2, r3, r4, r5, ncol = 2)
dev.off()

# library(ggplot2)
# library(gridExtra)
# library(grid)
# 
# 
# grid_arrange_shared_legend <- function(...) {
#   plots <- list(...)
#   g <- ggplotGrob(plots[[1]] + theme(legend.position="bottom"))$grobs
#   legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
#   lheight <- sum(legend$height)
#   grid.arrange(
#     do.call(arrangeGrob, lapply(plots, function(x)
#       x + theme(legend.position="none"))),
#     legend,
#     ncol = 1,
#     heights = unit.c(unit(1, "npc") - lheight, lheight))
# }
# 
# 

