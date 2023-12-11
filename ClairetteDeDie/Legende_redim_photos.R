library(tidyverse)
library(extrafont)
library(readr)
library(magick)
library(here)
loadfonts()

 
setwd(here("Résistants Rhodaniens - General","MULTIMILLESIME Clairette Die","ResDie 2023 photos","Placette 2023"))
path <- here()
dir.create(paste0(path,"/Résistants Rhodaniens - General/MULTIMILLESIME Clairette Die/ResDie 2023 photos/Placette 2023/ANNOTATE-REDIM"))

index <- list.files(path = here("Résistants Rhodaniens - General","MULTIMILLESIME Clairette Die","ResDie 2023 photos","Placette 2023"))
index <- index[index != "ANNOTATE-REDIM"]

  for (i in 1:length(index)){
    nom <- index[[i]]
    nommoy<- str_sub(index[[i]], 1 , -5) # sans l'extension .jpg
    nomcourt <- str_sub(index[[i]], 1 , -9)# et sans le numéro entre parenthèse
    photoRR <- image_read(here("Résistants Rhodaniens - General","MULTIMILLESIME Clairette Die","ResDie 2023 photos","Placette 2023",paste0(nom)))
    photoRR_redim <- image_scale(photoRR, "800") #800 c'est le nombre de pixel, ça fait une photo qui pèse entre 400 et 500ko
    photoRR_annotate_redim <- image_annotate(photoRR_redim, paste0(nomcourt, " (2023)"),  size = 50, color = "red", boxcolor = "white", # là il faut vérifier si on veut nommoy ou nomcourt
                                             location = "+5+5", #location = +5 +5 si l'image est en paysage ou +15 +520 si c'est une portrait
                                             #degrees = -90 #pour faire pivoter le texte si c'est en portrait
    )  
    
    image_write(photoRR_annotate_redim, 
                here("Résistants Rhodaniens - General","MULTIMILLESIME Clairette Die","ResDie 2023 photos","Placette 2023", "ANNOTATE-REDIM", paste0(nomcourt, ".png")))
  }
  
  
                      