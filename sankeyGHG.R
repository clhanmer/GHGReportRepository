library(dplyr)
library(networkD3)
library(readr)

links<-data.frame(
  source=c("group_A","group_A", "group_B", "group_C", "group_C", "group_E"), 
  target=c("group_C","group_D", "group_E", "group_F", "group_G", "group_H"), 
  value=c(2,3, 2, 3, 1, 3)
)

trial<-data.frame(
  source=c("All data","All data",  "Plausible", "Plausible"), 
  target=c("No gas or HTC not plausible or R2<0.1","Plausible",  "0.1<R2<0.6", "R2>0.6"), 
  value=c(20, 80, 15,65)
)

nodes<-data.frame(
  name=c(as.character(trial$source), 
         as.character(trial$target)) 
  %>% unique()
)

trial$IDsource <- match(trial$source, nodes$name)-1 
trial$IDtarget <- match(trial$target, nodes$name)-1

p <- sankeyNetwork(Links = trial, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", 
                   sinksRight=FALSE, fontSize = 20)
p



trial<-data.frame(
  source=c("All data","All data", "Filtered out", "Plausible", " ", " "), 
  target=c("Filtered out","Plausible", "No gas or HTC not plausible or R2<0.1", " ", "0.1<R2<0.6", "R2>0.6"), 
  value=c(20, 80, 20,80, 15,65)
)

nodes<-data.frame(
  name=c(as.character(trial$source), 
         as.character(trial$target)) 
  %>% unique()
)

trial$IDsource <- match(trial$source, nodes$name)-1 
trial$IDtarget <- match(trial$target, nodes$name)-1

p <- sankeyNetwork(Links = trial, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", 
                   sinksRight=FALSE, fontSize = 20)
p

trial<-data.frame(
  source=c("PTG before results","PTG before results","",""," "," "), 
  target=c("","no gas data"," ", "HTC not plausible or R2<0.1 ","0.1<R2<0.6", "R2>0.6" ), 
  value=c(1824,362,1474,350,390 ,1084)
)

nodes<-data.frame(
  name=c(as.character(trial$source), 
         as.character(trial$target)) 
  %>% unique()
)

trial$IDsource <- match(trial$source, nodes$name)-1 
trial$IDtarget <- match(trial$target, nodes$name)-1

p2 <- sankeyNetwork(Links = trial, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", 
                   sinksRight=FALSE, fontSize = 20)
p2

png(filename="N:/GHG SMETER/Snkeyexample.png", width=600, height=400)
p2
dev.off()

saveNetwork(p2, "N:/GHG SMETER/Snkeyexample.html", selfcontained = TRUE)
