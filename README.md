Data OPTA
================

## OPTA

Este archivo lee los datos obtenidos desde OPTA para diversos torneos
sudamericanos

Cargamos la data:

``` r
load("data/modelo_de_datos.RData")

print(torneos)
```

    ##  [1] "Copa Chile 2017"                                                
    ##  [2] "Copa Chile 2018"                                                
    ##  [3] "Copa Chile 2019"                                                
    ##  [4] "Libertadores 2017"                                              
    ##  [5] "Libertadores 2018"                                              
    ##  [6] "Libertadores 2019"                                              
    ##  [7] "Mundial U17 Brasil 2019"                                        
    ##  [8] "Mundial U17 India 2017"                                         
    ##  [9] "Mundial U20 Korea 2017"                                         
    ## [10] "Mundial U20 Polonia 2019"                                       
    ## [11] "Pinatar Cup 2020 Fem"                                           
    ## [12] "Play off Ascenso 2018"                                          
    ## [13] "Primera B 2017"                                                 
    ## [14] "Primera B 2018"                                                 
    ## [15] "Primera B 2019"                                                 
    ## [16] "Primera Division 2018"                                          
    ## [17] "Primera Division 2019"                                          
    ## [18] "Primera Division 2020"                                          
    ## [19] "Primera División 2020"                                          
    ## [20] "Sudamericana 2017"                                              
    ## [21] "Sudamericana 2018"                                              
    ## [22] "Sudamericana 2019"                                              
    ## [23] "Sudamericano Chile 2019"                                        
    ## [24] "Sudamericano Ecuador 2017"                                      
    ## [25] "Tournoi de France 2020 Fem"                                     
    ## [26] "U20 Womens World Cup Francia 2018"                              
    ## [27] "Womens WC Qualification Intercontinental Play-offs Francia 2019"
    ## [28] "Womens World Cup Francia 2019"

Se cargan 12 dataframes con parametros de los torneos, desde equipos,
jugadores o eventos

``` r
df_jugadores |> head()
```

    ##   position                  playerId        firstName           lastName
    ## 1        0 b3gzwpdhc43oz9u4ihkqgug2d         Joe Axel     Abrigo Navarro
    ## 2        0 4ry41imxbur7epfo5igydybpx   Osvaldo Javier       Bosso Torres
    ## 3        0 8i2jufhd0hz8i0n88p82sk0r9    Matías Daniel        Campos Toro
    ## 4        0 al3ls8yq5tgr0ss8vdea84ogl       Bryan Paul    Carrasco Santos
    ## 5        0 arj6wz36r6wr961xynqg4m4lx Fernando Nicolás    Cornejo Miranda
    ## 6        0 9j5hkfilerc8upy6zl1gpucph  Nicolás Ignacio Crovetto Aqueveque
    ##     matchName shirtNumber         equipo                id_partido positionSide
    ## 1   J. Abrigo          10 Audax Italiano 17riuo6i84s0c2hqtpr4hismi            0
    ## 2    O. Bosso           4 Audax Italiano 17riuo6i84s0c2hqtpr4hismi            0
    ## 3   M. Campos           6 Audax Italiano 17riuo6i84s0c2hqtpr4hismi            0
    ## 4 B. Carrasco           7 Audax Italiano 17riuo6i84s0c2hqtpr4hismi            0
    ## 5  F. Cornejo           8 Audax Italiano 17riuo6i84s0c2hqtpr4hismi            0
    ## 6 N. Crovetto          15 Audax Italiano 17riuo6i84s0c2hqtpr4hismi            0
    ##   subPosition formationPlace captain
    ## 1           0              0       0
    ## 2           0              0       0
    ## 3           0              0       0
    ## 4           0              0       0
    ## 5           0              0       0
    ## 6           0              0       0

``` r
df_equipos |> head()
```

    ##                           id                  name   shortName
    ## 1  59d4d2m78t2lqabd1m7o90std        Audax Italiano       Audax
    ## 2  3suhaq9lof0lwpkqikqqcro2f             Barnechea   Barnechea
    ## 4  cdj7tqbsake4a0ks5pwm23t23  Universidad de Chile U. de Chile
    ## 11 c13hhw4wpbq45nnafm0up66k4              Cobreloa    Cobreloa
    ## 21 1f72vqlndphmzn45x0nhdqk3e Deportivo Antofagasta Antofagasta
    ## 12 eizgmllil1zrzpk6zbue0hl7m              Cobresal    Cobresal
    ##                            officialName code                country.id
    ## 1        Audax Italiano La Florida SADP  AUD 32tb8d7824xg4i0ybxzssczu0
    ## 2  Club Social y Deportivo Lo Barnechea  BAR 32tb8d7824xg4i0ybxzssczu0
    ## 4              CFP Universidad de Chile  UCH 32tb8d7824xg4i0ybxzssczu0
    ## 11                          CD Cobreloa  COB 32tb8d7824xg4i0ybxzssczu0
    ## 21                       CD Antofagasta  ANT 32tb8d7824xg4i0ybxzssczu0
    ## 12                          CD Cobresal  CBR 32tb8d7824xg4i0ybxzssczu0
    ##    country.name
    ## 1         Chile
    ## 2         Chile
    ## 4         Chile
    ## 11        Chile
    ## 21        Chile
    ## 12        Chile

``` r
df_managers |> head()
```

    ##                          id             firstName           lastName    type
    ## 1 5u2guimjmaj88o4z1ly8ynw7p Hugo Alejandro Héctor  Vilches Manuguian manager
    ## 2 7rmmi13dp1kjlgstir0pfeqjt         Arturo Andrés Norambuena Ardiles manager
    ## 3 5u2guimjmaj88o4z1ly8ynw7p Hugo Alejandro Héctor  Vilches Manuguian manager
    ## 4 7rmmi13dp1kjlgstir0pfeqjt         Arturo Andrés Norambuena Ardiles manager
    ## 5 ar44c1xbcg35i4dlkehx8mew9                Hernán               Peña manager
    ## 6 54kbubgaxkl7wke1bmyvn8clx       Ángel Guillermo    Hoyos Marchisio manager
    ##                  id_partido               equipo
    ## 1 17riuo6i84s0c2hqtpr4hismi       Audax Italiano
    ## 2 17riuo6i84s0c2hqtpr4hismi            Barnechea
    ## 3 17riuo6i84s0c2hqtpr4hismi       Audax Italiano
    ## 4 17riuo6i84s0c2hqtpr4hismi            Barnechea
    ## 5 3vw1tlodzfjx6awi7tgfq64iy       Audax Italiano
    ## 6 3vw1tlodzfjx6awi7tgfq64iy Universidad de Chile

``` r
df_torneos |> head()
```

    ##                          id                  name competitionCode
    ## 1 eu2g5j36zzxiazpd729osx0wm            Copa Chile             COC
    ## 2 59tpnfrwnvhnhzmnvfyug68hj CONMEBOL Libertadores             COL
    ## 3 5c0q11ygqq0ipg3bl5tnkq0uz         U17 World Cup             UWC
    ## 4 6thk4rltubz0yjy35ru5dlo4x         U20 World Cup             UWC
    ## 5 16mfkt95bh7o8gmvtnzs526i2           Pinatar Cup             PIN
    ## 6 bly7ema5au6j40i0grhl0pnub             Primera B             PRB
    ##   competitionFormat                country.id  country.name
    ## 1      Domestic cup 32tb8d7824xg4i0ybxzssczu0         Chile
    ## 2 International cup 7ygvdgl31hirp07yeye1tvsut South America
    ## 3 International cup 7yasa43laq1nb2e6f8bfuvxed         World
    ## 4 International cup 7yasa43laq1nb2e6f8bfuvxed         World
    ## 5 International cup 7yasa43laq1nb2e6f8bfuvxed         World
    ## 6   Domestic league 32tb8d7824xg4i0ybxzssczu0         Chile

``` r
df_arbitros |> head()
```

    ##                          id type firstName        lastName
    ## 1 7n4iga1jrporu7l0wu25fvsgl Main   Claudio Aranda González
    ## 2 76lss0m7dxpawjnyz808h03x1 Main  Patricio  Polic Orellana
    ## 3 5dcsk7n09yaxv10boyf5ikovd Main    Felipe            Jara
    ## 4  za51q6ddigxbui5zrqyrcatx Main Francisco        Gilabert
    ## 5 cu7ci03zhoqbkksx3teze4z4l Main Christian    Rojas Concha
    ## 6 76lss0m7dxpawjnyz808h03x1 Main  Patricio  Polic Orellana
    ##                  id_partido
    ## 1 17riuo6i84s0c2hqtpr4hismi
    ## 2 3vw1tlodzfjx6awi7tgfq64iy
    ## 3 57pisahu2fq4mbn0zfytg5p4a
    ## 4 5811c3iqxwxk0tlf8q5x6nnu2
    ## 5 576xf3o725z61jngq5ae32l4a
    ## 6 3xfj0mozoalw0u7fyej87lkkq

``` r
df_partidos |> head()
```

    ##            torneo                        id
    ## 1 Copa Chile 2017 17riuo6i84s0c2hqtpr4hismi
    ## 2 Copa Chile 2017 3vw1tlodzfjx6awi7tgfq64iy
    ## 3 Copa Chile 2017 57pisahu2fq4mbn0zfytg5p4a
    ## 4 Copa Chile 2017 5811c3iqxwxk0tlf8q5x6nnu2
    ## 5 Copa Chile 2017 576xf3o725z61jngq5ae32l4a
    ## 6 Copa Chile 2017 3xfj0mozoalw0u7fyej87lkkq
    ##                              description        date      time      ronda grupo
    ## 1            Audax Italiano vs Barnechea 2017-07-23Z 00:00:00Z  1st Round     0
    ## 2 Audax Italiano vs Universidad de Chile 2017-08-30Z 21:00:00Z 8th Finals     0
    ## 3            Barnechea vs Audax Italiano 2017-07-14Z 23:00:00Z  1st Round     0
    ## 4      Cobreloa vs Deportivo Antofagasta 2017-07-16Z 20:00:00Z  1st Round     0
    ## 5         Cobresal vs Santiago Wanderers 2017-07-15Z 19:30:00Z  1st Round     0
    ## 6                    Colo Colo vs Iberia 2017-09-03Z 20:00:00Z 8th Finals     0
    ##   cobertura                                      estadio local visita categoria
    ## 1         8 Estadio Bicentenario Municipal de La Florida   AUD    BAR       Men
    ## 2        13 Estadio Bicentenario Municipal de La Florida   AUD    UCH       Men
    ## 3         8            Estadio Municipal de Lo Barnechea   BAR    AUD       Men
    ## 4         8                  Estadio Zorros del Desierto   COB    ANT       Men
    ## 5         8                             Estadio El Cobre   CBR    WAN       Men
    ## 6        13            Estadio Monumental David Arellano   COL    IBE       Men
    ##   duracion vencedor publico
    ## 1       98     home       0
    ## 2       93     away       0
    ## 3       95     away       0
    ## 4       98     away       0
    ## 5       95     home       0
    ## 6       95     away       0

``` r
df_tiempos |> head()
```

    ##                          torneo        equipo               id_partido
    ## 1 Womens World Cup Francia 2019      Thailand vvhuqpgur6nur451dj9rfzvu
    ## 2 Womens World Cup Francia 2019      Thailand vvhuqpgur6nur451dj9rfzvu
    ## 3 Womens World Cup Francia 2019      Thailand vvhuqpgur6nur451dj9rfzvu
    ## 4 Womens World Cup Francia 2019 United States vvhuqpgur6nur451dj9rfzvu
    ## 5 Womens World Cup Francia 2019 United States vvhuqpgur6nur451dj9rfzvu
    ## 6 Womens World Cup Francia 2019 United States vvhuqpgur6nur451dj9rfzvu
    ##                     partido fasepartido local tiempo accuratePass wonTackle
    ## 1 United States vs Thailand Group Stage FALSE     fh           62         8
    ## 2 United States vs Thailand Group Stage FALSE     sh           72         6
    ## 3 United States vs Thailand Group Stage FALSE  value          134        14
    ## 4 United States vs Thailand Group Stage  TRUE     fh          270         4
    ## 5 United States vs Thailand Group Stage  TRUE     sh          275         2
    ## 6 United States vs Thailand Group Stage  TRUE  value          545         6
    ##   lostCorners goalsConceded saves ontargetScoringAtt totalScoringAtt subsMade
    ## 1           6             3     3                  1               1        1
    ## 2           4            10     4                  1               1        2
    ## 3          10            13     7                  2               2        3
    ## 4           0             0     1                  6              16        0
    ## 5           0             0     1                 14              24        3
    ## 6           0             0     2                 20              40        3
    ##   totalThrows totalYellowCard goalKicks totalPass fkFoulWon totalTackle
    ## 1          14               0         8       130         3          15
    ## 2          11               1         6       126         1           8
    ## 3          25               1        14       256         4          23
    ## 4          17               0         0       325         2           4
    ## 5          15               0         0       324         2           2
    ## 6          32               0         0       649         4           6
    ##   fkFoulLost possessionPercentage totalClearance formationUsed
    ## 1          3                 27.7             33             0
    ## 2          2                 27.4             19             0
    ## 3          5                 27.5             52          4411
    ## 4          3                 72.3              1             0
    ## 5          2                 72.6              2             0
    ## 6          5                 72.5              3           433
    ##   blockedScoringAtt goalAssist goals totalOffside shotOffTarget wonCorners
    ## 1                 0          0     0            0             0          0
    ## 2                 0          0     0            0             0          0
    ## 3                 0          0     0            0             0          0
    ## 4                 5          3     3            3             5          6
    ## 5                 4          7    10            0             6          4
    ## 6                 9         10    13            3            11         10
    ##   cornerTaken penaltyConceded penaltyFaced penGoalsConceded penaltyWon ownGoals
    ## 1           0               0            0                0          0        0
    ## 2           0               0            0                0          0        0
    ## 3           0               0            0                0          0        0
    ## 4           6               0            0                0          0        0
    ## 5           4               0            0                0          0        0
    ## 6          10               0            0                0          0        0
    ##   penaltySave secondYellow totalRedCard rescindedRedCard
    ## 1           0            0            0                0
    ## 2           0            0            0                0
    ## 3           0            0            0                0
    ## 4           0            0            0                0
    ## 5           0            0            0                0
    ## 6           0            0            0                0

``` r
df_goles |> head()
```

    ##                contestantId periodId timeMin          lastUpdated type
    ## 1 59d4d2m78t2lqabd1m7o90std        1      23 2019-09-12T19:52:04Z    G
    ## 2 59d4d2m78t2lqabd1m7o90std        1      48 2019-09-16T13:40:02Z    G
    ## 3 3suhaq9lof0lwpkqikqqcro2f        2      69 2017-07-23T01:32:13Z    G
    ## 4 59d4d2m78t2lqabd1m7o90std        2      78 2019-09-16T13:40:02Z    G
    ## 5 59d4d2m78t2lqabd1m7o90std        2      94 2019-09-16T13:40:02Z    G
    ## 6 cdj7tqbsake4a0ks5pwm23t23        1      33 2019-09-16T13:37:33Z    G
    ##                    scorerId  scorerName optaEventId homeScore awayScore
    ## 1 al3ls8yq5tgr0ss8vdea84ogl B. Carrasco   462806029         1         0
    ## 2 bn04vhl78qfknkl5fk84rkuz9    J. Leiva   775634937         2         0
    ## 3 bmzdl8iv5jju9drdj7ro074yd   M. Rivera   587321213         2         1
    ## 4 bn04vhl78qfknkl5fk84rkuz9    J. Leiva  1805128642         3         1
    ## 5 bn04vhl78qfknkl5fk84rkuz9    J. Leiva  2004355563         4         1
    ## 6 clsskbmcp1npmlf4obp7aje8l     I. Díaz  1756477817         0         1
    ##                  id_partido assistPlayerId assistPlayerName timeMinSec
    ## 1 17riuo6i84s0c2hqtpr4hismi              0                0          0
    ## 2 17riuo6i84s0c2hqtpr4hismi              0                0          0
    ## 3 17riuo6i84s0c2hqtpr4hismi              0                0          0
    ## 4 17riuo6i84s0c2hqtpr4hismi              0                0          0
    ## 5 17riuo6i84s0c2hqtpr4hismi              0                0          0
    ## 6 3vw1tlodzfjx6awi7tgfq64iy              0                0          0
    ##   timestamp secondAssistPlayerId ocSecondAssistPlayerId opSecondAssistPlayerId
    ## 1         0                    0                      0                      0
    ## 2         0                    0                      0                      0
    ## 3         0                    0                      0                      0
    ## 4         0                    0                      0                      0
    ## 5         0                    0                      0                      0
    ## 6         0                    0                      0                      0
    ##   secondAssistPlayerName varReviewed originalDecision unconfirmed
    ## 1                      0           0                0           0
    ## 2                      0           0                0           0
    ## 3                      0           0                0           0
    ## 4                      0           0                0           0
    ## 5                      0           0                0           0
    ## 6                      0           0                0           0

``` r
df_penales |> head()
```

    ##                contestantId timeMin          lastUpdated outcome
    ## 1 bd1veyn5g4r8zbaquf8b8pksp      91 2017-10-08T21:01:41Z  missed
    ## 2 1f72vqlndphmzn45x0nhdqk3e      93 2017-10-08T21:03:10Z  scored
    ## 3 bd1veyn5g4r8zbaquf8b8pksp      93 2017-10-08T21:03:55Z  scored
    ## 4 1f72vqlndphmzn45x0nhdqk3e      94 2020-02-07T11:29:10Z  scored
    ## 5 bd1veyn5g4r8zbaquf8b8pksp      95 2017-10-08T21:05:50Z  missed
    ## 6 1f72vqlndphmzn45x0nhdqk3e      95 2020-01-28T16:35:22Z  scored
    ##                    playerId      scorerName teamPenaltyNumber optaEventId
    ## 1 ewnk9grfbuepigjhj4k7n0z4l    N. Rebolledo                 1  1233286175
    ## 2 d7p3bgpg3i5pzrs4fpz4w6p5h   L. Valenzuela                 1  1096449837
    ## 3 2opc2i7z9haptgq0qrpskxsyd     D. Alvarado                 2  2111613661
    ## 4  a43eych22nuzkv3xk9k4cn9x F. Ciampichetti                 2  1820907056
    ## 5 9qzfichl4hqzv5vwyp3bo8vdh        N. Gauna                 3  1182364697
    ## 6 27d86mint34dydvzdjpxict79         B. Romo                 3  1712357091
    ##                  id_partido timeMinSec timestamp
    ## 1 cwgjlmklgz3auxhyu1whsqfsa          0         0
    ## 2 cwgjlmklgz3auxhyu1whsqfsa          0         0
    ## 3 cwgjlmklgz3auxhyu1whsqfsa          0         0
    ## 4 cwgjlmklgz3auxhyu1whsqfsa          0         0
    ## 5 cwgjlmklgz3auxhyu1whsqfsa          0         0
    ## 6 cwgjlmklgz3auxhyu1whsqfsa          0         0

``` r
df_tarjetas |> head()
```

    ##                contestantId periodId timeMin          lastUpdated type
    ## 1 59d4d2m78t2lqabd1m7o90std        1      38 2019-09-16T13:34:42Z   YC
    ## 2 3suhaq9lof0lwpkqikqqcro2f        2      49 2020-02-06T16:32:06Z   YC
    ## 3 59d4d2m78t2lqabd1m7o90std        1      19 2017-08-30T21:23:09Z   YC
    ## 4 cdj7tqbsake4a0ks5pwm23t23        1      19 2017-08-30T21:22:18Z   YC
    ## 5 59d4d2m78t2lqabd1m7o90std        1      32 2017-08-30T21:34:47Z  Y2C
    ## 6 59d4d2m78t2lqabd1m7o90std        1      42 2017-08-30T21:44:54Z   YC
    ##                    playerId   playerName optaEventId cardReason
    ## 1 cv2m0fe5o4urquub6b5gm4t4a N. Fernández   178548853       Foul
    ## 2 289j6352e5kqzak6au656l4np      G. Soto  1216923756       Foul
    ## 3 be2mkt8tl6bgnm4nyzb5l02c5 M. Fernández  1413847101       Foul
    ## 4 4zoh16h4bim3680g90nmnfb2t   M. Pinilla  1226029785       Foul
    ## 5 be2mkt8tl6bgnm4nyzb5l02c5 M. Fernández  1785142953       Foul
    ## 6 bee7alctox3ztjap9aoap83it     N. Peric  1673800378       Foul
    ##                  id_partido timeMinSec timestamp
    ## 1 17riuo6i84s0c2hqtpr4hismi          0         0
    ## 2 17riuo6i84s0c2hqtpr4hismi          0         0
    ## 3 3vw1tlodzfjx6awi7tgfq64iy          0         0
    ## 4 3vw1tlodzfjx6awi7tgfq64iy          0         0
    ## 5 3vw1tlodzfjx6awi7tgfq64iy          0         0
    ## 6 3vw1tlodzfjx6awi7tgfq64iy          0         0

``` r
df_var |> head()
```

    ##                contestantId periodId timeMin timeMinSec          lastUpdated
    ## 1 7gkwmrw0cjz0m168ouw00z4gy        2      68      67:10 2020-01-18T22:27:41Z
    ## 2 ehsvy9m92bp6ktgoy6pwv8rdm        2      92      91:25 2020-03-04T14:49:04Z
    ## 3 ehsvy9m92bp6ktgoy6pwv8rdm        1      40      39:39 2020-01-22T22:07:51Z
    ## 4 5h3amvo8ykt01u4h3upw3c5qf        2      92      92:00 2019-07-25T02:20:28Z
    ## 5 2sciofe2reang4qdncm1bihgr        1      16      15:20 2019-07-31T22:31:26Z
    ## 6 8cwds1t3cfvn3x0jswsti8mq4        2      87      86:11 2020-02-04T15:18:21Z
    ##              timestamp                type  decision    outcome
    ## 1 2020-01-18T22:27:27Z Penalty not awarded Cancelled    Penalty
    ## 2 2020-01-18T22:51:42Z Penalty not awarded Cancelled    Penalty
    ## 3 2020-01-22T22:07:40Z     Penalty awarded Cancelled No penalty
    ## 4 2019-07-25T02:20:21Z Penalty not awarded Cancelled    Penalty
    ## 5 2019-07-31T22:30:45Z Penalty not awarded Cancelled    Penalty
    ## 6 2019-07-25T02:14:44Z Penalty not awarded Confirmed No penalty
    ##                    playerId   playerName optaEventId                id_partido
    ## 1 7qinj1hp24xlzrp40lji1r3rp  F. Zampedri  2177316787 cipft78b95sywlvysi1vo9wtm
    ## 2 2ir7ctowdenj07bq50l20wq8l J. Parraguez  2177317835 cipft78b95sywlvysi1vo9wtm
    ## 3 3loc50uo96004zxczuihbzrh1     G. Costa  2178053723 5f0z5z5eg34wbtqhmproe0mzu
    ## 4 5x3etliqhho3bvrrxn7juhsk5         Rony  1112216615 bwt3q6vh6tfmfkuohy87n7wbu
    ## 5 5nhdurx0ylw827dww8tfeyndh   H. Fértoli  1820965752 5gy0ubmcoyfpo0yadv70qcoru
    ## 6 ew15n1tgyp9phnohfcagddtqt   R. Caicedo  1592865366 8cfe8znzym89wsjvcp9wcm2ju
    ##   optaEventUnderReviewId
    ## 1                      0
    ## 2                      0
    ## 3                      0
    ## 4                      0
    ## 5                      0
    ## 6                      0

``` r
df_cambios |> head()
```

    ##                contestantId periodId timeMin          lastUpdated
    ## 1 3suhaq9lof0lwpkqikqqcro2f        2      46 2017-07-24T09:35:28Z
    ## 2 3suhaq9lof0lwpkqikqqcro2f        2      52 2019-10-09T19:34:49Z
    ## 3 59d4d2m78t2lqabd1m7o90std        2      58 2017-07-24T09:35:28Z
    ## 4 59d4d2m78t2lqabd1m7o90std        2      70 2017-07-24T09:35:28Z
    ## 5 3suhaq9lof0lwpkqikqqcro2f        2      81 2017-11-23T18:16:38Z
    ## 6 59d4d2m78t2lqabd1m7o90std        2      87 2017-07-24T09:35:28Z
    ##                  playerOnId  playerOnName               playerOffId
    ## 1 eioe497mjdie9o8lzy231qaj9       J. Moya ac79559es4rtmoeifxrae96uh
    ## 2  dcwh4wtli8nm8jzmmbe8q9xx     B. Oyarzo 1ytr6j28n0nt1ezctb4gxxk2d
    ## 3 edzgrsne5h4lt5m2aex9s59t5 Sergio Santos b3gzwpdhc43oz9u4ihkqgug2d
    ## 4 4yrdgfx2ywrejye3jt3s3udw5  J. Henríquez arj6wz36r6wr961xynqg4m4lx
    ## 5 e9tcpqbzwwr52sp4fwnmecz1m   F. Menéndez bmzdl8iv5jju9drdj7ro074yd
    ## 6 4yvk7o42utehkf7nki39zafo5    I. Vásquez 4ry41imxbur7epfo5igydybpx
    ##   playerOffName subReason                id_partido timeMinSec timestamp
    ## 1       S. Arce  Tactical 17riuo6i84s0c2hqtpr4hismi          0         0
    ## 2     A. Urbina  Tactical 17riuo6i84s0c2hqtpr4hismi          0         0
    ## 3     J. Abrigo  Tactical 17riuo6i84s0c2hqtpr4hismi          0         0
    ## 4    F. Cornejo  Tactical 17riuo6i84s0c2hqtpr4hismi          0         0
    ## 5     M. Rivera  Tactical 17riuo6i84s0c2hqtpr4hismi          0         0
    ## 6      O. Bosso  Tactical 17riuo6i84s0c2hqtpr4hismi          0         0
