dataNFP<-read.csv("C:/Users/Mohamadou Aminou/Desktop/Module_R/2012_07_24_data.csv",header=TRUE, sep=";", dec=",")
dataNF<-read.csv("C:/Users/Mohamadou Aminou/Desktop/Module_R/2012_07_18_NFP_1.csv",header=TRUE, sep=";", dec=",")
dataNFP <- as.data.frame(subset(x=dataNFP, select=c(ID..sub.block, Location, Cylinder.number, Plant.number, 
                                                    Type, Water.height..theoretical., Speed,
                                                    Water.height..true., Inst_Water_height, Max_water_height, Flooded.days, 
                                                    Control, ID..repetition., 
                                                    ID..date., Dry_Matter, ID.NMK)), drop=FALSE)
dataNFP_carac$Leaves <- NA
dataNFP_carac$Stem <- NA
dataNFP_carac$DM <- NA
dataNFP_carac$Root <- NA
dataNFP_carac$ID..sub.block. <- NA
dataNFP_carac$Cylinder.number <- NA
dataNFP_carac$Plant.number <- NA
#dataNFP_carac$Type <- NA
dataNFP_carac$Water.height..theoretical. <- NA
dataNFP_carac$Water.height..true. <- NA
dataNFP_carac$Inst_Water_height <- NA
dataNFP_carac$Speed <- NA
dataNFP_carac$Max_water_height <- NA
dataNFP_carac$Flooded.days <- NA
dataNFP_carac$Control<- NA
#dataNFP_carac$ID..repetition. <- NA
dataNFP_carac$ID..date. <- NA
dataNFP_carac$ID.NMK <- NA
dataNFP$Cylinder.number <- as.character(dataNFP$Cylinder.number)
dataNFP_carac$Location <- as.character(dataNFP_carac$Location)
dataNFP$Cylinder.number <- as.character(dataNFP$Cylinder.number)
dataNFP_carac$Location <- as.character(dataNFP_carac$Location)
                  dataNFP$Plant.number <- as.character(dataNFP$Plant.number)
                  dataNFP_carac$Plant.repeat <- as.character(dataNFP_carac$Plant.repeat)
                  dataNFP_carac$Root <- as.numeric(dataNFP_carac$Root)
                  dataNFP_carac$Leaves <- as.numeric(dataNFP_carac$Leaves)
                  dataNFP_carac$Stem <- as.numeric(dataNFP_carac$Stem)
                  dataNFP_carac$DM <- as.numeric(dataNFP_carac$DM)
                  dataNFP$Type <- as.character(dataNFP$Type)
                  dataNFP_carac$ID.NMK <- as.numeric(dataNFP_carac$ID.NMK)
                  dataNFP_carac$Control <- as.character(dataNFP_carac$Control)
                  dataNFP$Control <- as.character(dataNFP$Control)
                  
                  for (i in 1:nrow(dataNFP)) {
                  for ( j in 1:nrow(dataNFP_carac)){
                  if (dataNFP$Cylinder.number[i]==dataNFP_carac$Location[j]) {
                  if (dataNFP$Plant.number[i]==dataNFP_carac$Plant.repeat[j]) {
                  if (dataNFP$ID..date.[i]==dataNFP_carac$Date[j]) {
                  if (dataNFP$Type[i]=="leaves")  dataNFP_carac$Leaves[j] <- dataNFP$Dry_Matter[i]
                  if (dataNFP$Type[i]=="dry_matter")  dataNFP_carac$DM[j] <- dataNFP$Dry_Matter[i]
                  if (dataNFP$Type[i]=="stems")  dataNFP_carac$Stem[j] <- dataNFP$Dry_Matter[i]
                  if (dataNFP$Type[i]=="roots")  dataNFP_carac$Root[j] <- dataNFP$Dry_Matter[i]
                  dataNFP_carac$ID..sub.block.[j] <- dataNFP$ID..sub.block.[i]
                  dataNFP_carac$Cylinder.number[j]<- dataNFP$Cylinder.number[i]
                  dataNFP_carac$Plant.number[j] <- dataNFP$Plant.number[i]
                  #dataNFP_carac$Type[j]<- dataNFP$Type[i]
                  dataNFP_carac$Water.height..theoretical.[j] <- dataNFP$Water.height..theoretical.[i]
                  dataNFP_carac$Water.height..true.[j]<- dataNFP$Water.height..true.[i]
                  dataNFP_carac$Max_water_height[j]<- dataNFP$Max_water_height[i]
                  dataNFP_carac$Inst_Water_height[j]<- dataNFP$Inst_Water_height[i]
                  dataNFP_carac$Speed[j]<- dataNFP$Speed[i]
                  dataNFP_carac$Flooded.days[j] <- dataNFP$Flooded.days[i]
                  dataNFP_carac$Control[j]<- dataNFP$Control[i]
                  #dataNFP_carac$ID..repetition.[j]<- dataNFP$ID..repetition.[i]
                  dataNFP_carac$ID..date.[j]<- dataNFP$ID..date.[i]
                  dataNFP_carac$ID.NMK[j]<- dataNFP$ID.NMK[i]
                  }
                  }
                  }
                  }
                  }
                  rm(i) ; rm(j)
fout_initial <- write.table(dataNFP_carac, file = "dataNFP_carac", append = FALSE, quote = TRUE, sep = ",")
fout_initial <- write.table (dataNFP_carac, file = "dataNFP_carac", append = FALSE, quote = TRUE, sep = ",",
            eol = "\r", na = "NA", dec = ".", row.names = TRUE,
            col.names = TRUE)
