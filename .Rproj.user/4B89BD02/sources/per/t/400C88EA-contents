pacman::p_load(jsonlite, data.table, plyr, tidyverse)

## me ubico en la carpeta "Data"
setwd("C:/Users/italo/Dropbox/soccer analytics/data")

torneos <- gsub("data/","",list.dirs("data",recursive = FALSE)) 

df_torneos   <- NULL
df_equipos   <- NULL
df_partidos  <- NULL
df_tiempos   <- NULL
df_jugadores <- NULL
df_goles     <- NULL
df_tarjetas  <- NULL
df_cambios   <- NULL
df_arbitros  <- NULL
df_penales   <- NULL
df_var       <- NULL
df_managers  <- NULL

for(torneo in torneos){ #recorro los torneos
  partidos <- list.files(paste0("./",torneo,"/Partidos"),".json")
  npartidos <- length(partidos)
  
  for (i in 1:npartidos){  #recorro los partidos del torneo
    partidoi <- read_json(paste0(getwd(),"/",torneo,"/Partidos/",partidos[i])) ## leo el partido i
    
    ## extrae datos del partido
    matchinfo <- partidoi$matchInfo
    livedata <- partidoi$liveData
    
    ##### extraigo estadisticas de livedata que estan por equipo     ##### 
    for(team in 1:2){
      ###  var stat, que no viene para todos los torneos
      if(!is.null(livedata$lineUp[[team]]$stat)){
        statsteam_h            <- ldply(livedata$lineUp[[team]]$stat, data.frame) %>% t() %>% data.frame()
        colnames(statsteam_h)  <- statsteam_h["type",]
        statsteam_h            <- statsteam_h[-which(rownames(statsteam_h)=="type"),]
        statsteam_h$tiempo     <- row.names(statsteam_h)
        row.names(statsteam_h) <- NULL
        statsteam_h$cleanSheet <- NULL
        
        statsteam_h <-  statsteam_h %>%                 #### paso filas a columnas, luego creo columnas, reordeno y elimino NAs
          mutate( torneo = torneo,
                  equipo = matchinfo$contestant[[team]]$name,
                  id_partido = matchinfo$id,
                  local = (team == 1),
                  partido = matchinfo$description,
                  fasepartido = matchinfo$stage$name) %>% 
          relocate(c(torneo,equipo,id_partido,partido,fasepartido,local,tiempo)) %>%
          replace(is.na(.), 0)
        
        df_tiempos <- rbind.fill(statsteam_h, df_tiempos)  
      
        for(jug in 1:length(livedata$lineUp[[team]]$player)){
          player <- livedata$lineUp[[team]]$player[[jug]]
          
          stat              <- player$stat
          player$stat       <- NULL
          jugador           <- as.data.frame(player)
          jugador$equipo     <- matchinfo$contestant[[team]]$name
          jugador$id_partido <- matchinfo$id
          
          df_jugadores <- rbind.fill(df_jugadores, jugador)    
        }
      }
      dtecnico <- as.data.frame(livedata$lineUp[[team]]$teamOfficial)
      if(nrow(dtecnico)>0){
        dtecnico$id_partido <- matchinfo$id
        dtecnico$equipo <- matchinfo$contestant[[team]]$name
        df_managers <- rbind.fill(df_managers, dtecnico)
      }
    }
    
    ##### extraigo info de matchinfo #####
    partido <- data.frame(torneo = torneo,
                          id = matchinfo$id, 
                          description = matchinfo$description,
                          date = matchinfo$date,
                          time = matchinfo$time,
                          ronda = matchinfo$stage$name,
                          grupo = ifelse(is.null(matchinfo$series), 0, matchinfo$series$name),
                          cobertura = as.numeric(ifelse(is.null(matchinfo$coverageLevel), 0, matchinfo$coverageLevel)),
                          estadio = matchinfo$venue$longName,
                          local = matchinfo$contestant[[1]]$code,
                          visita = matchinfo$contestant[[2]]$code,
                          categoria = matchinfo$ruleset$name,
                          duracion =  ifelse(is.null(livedata$matchDetails$matchLengthMin), 0, livedata$matchDetails$matchLengthMin),
                          vencedor = livedata$matchDetails$winner,
                          publico = ifelse(is.null(livedata$matchDetailsExtra$attendance),0, livedata$matchDetailsExtra$attendance))
    
    df_partidos <- rbind(df_partidos, partido)
    
    goals <- ldply(livedata$goal, data.frame)
    if(nrow(goals)>0){
      goals$id_partido <- matchinfo$id
      df_goles <- rbind.fill(df_goles, goals)
    }
    
    tarjetas <- ldply(livedata$card, data.frame)
    if(nrow(tarjetas)>0){
      tarjetas$id_partido <- matchinfo$id
      df_tarjetas <- rbind.fill(df_tarjetas, tarjetas)
    }
    
    cambios <- ldply(livedata$substitute, data.frame)
    if(nrow(cambios)>0){
      cambios$id_partido <- matchinfo$id
      df_cambios <- rbind.fill(df_cambios, cambios)
    }
    
    arbitros <- ldply(livedata$matchDetailsExtra$matchOfficial, data.frame)
    if(nrow(arbitros)>0){
      arbitros$id_partido <- matchinfo$id
      df_arbitros <- rbind.fill(df_arbitros, arbitros)
    }
    
    penales <- ldply(livedata$penaltyShot, data.frame)
    if(nrow(penales)>0){
      penales$id_partido <- matchinfo$id
      df_penales <- rbind.fill(df_penales, penales)
    }
    
    VAR <- ldply(livedata$VAR, data.frame)
    if(nrow(VAR)>0){
      VAR$id_partido <- matchinfo$id
      df_var <- rbind.fill(df_var, VAR)
    }
    
    df_equipos <-  unique(rbind(df_equipos,
                                ldply(matchinfo$contestant, data.frame) %>% mutate(position = NULL)))
    
    df_torneos <- unique(rbind(df_torneos,as.data.frame(matchinfo$competition)))
  }
  print(which(torneos==torneo))
}



## reemplazo los nas por 0 (rbind.fill genera NAs cuando hay variables en el Json que no todos tienen)
df_torneos   <- df_torneos %>% replace(is.na(.), 0)
df_equipos   <- df_equipos %>% replace(is.na(.), 0)
df_partidos  <- df_partidos %>% replace(is.na(.), 0)
df_tiempos   <- df_tiempos %>% replace(is.na(.), 0)
df_jugadores <- df_jugadores %>% replace(is.na(.), 0)
df_goles     <- df_goles %>% replace(is.na(.), 0)
df_tarjetas  <- df_tarjetas %>% replace(is.na(.), 0)
df_cambios   <- df_cambios %>% replace(is.na(.), 0)
df_arbitros  <- df_arbitros %>% replace(is.na(.), 0)
df_penales   <- df_penales %>% replace(is.na(.), 0)
df_var       <- df_var %>% replace(is.na(.), 0)
df_managers  <- df_managers %>% replace(is.na(.), 0)

## elimino variables auxiliares
rm(arbitros, cambios, dtecnico, goals, jugador, livedata, matchinfo, partido, penales, player, stat, statsteam_h, tarjetas, VAR)
rm(i, jug, npartidos, team, torneo, partidos)

## cambio variables a numericas
df_jugadores <-  df_jugadores %>% relocate(position)
df_jugadores[,9:ncol(df_jugadores)] <- sapply(df_jugadores[,9:ncol(df_jugadores)],as.numeric)  

df_tiempos[,8:ncol(df_tiempos)] <- sapply(df_tiempos[,8:ncol(df_tiempos)],as.numeric)




## guardo datos procesados
save.image("modelo_de_datos.RData")

