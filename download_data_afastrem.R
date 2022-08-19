library(tidyverse)

dir.create(here::here("data"))

# Download 2000 to 2017
download.file(url = paste0("http://repositorio.dados.gov.br/segrt/AFASTREM_2000a2017.zip"),
              destfile = here::here("data","afastrem_2000a2017.zip"),
              mode = "wb")  

# Download 2018

year <- 2018

for(month in c(1:12)){
    if (month < 7){
      download.file(url = paste0("http://repositorio.dados.gov.br/segrt/AFASTREM_0",month,year,"_2.CSV"),
                    destfile = here::here("data",paste0("afastrem_0",month,year,".csv")),
                    mode = "wb")  
    }
    if (month >= 7 & month <10) {
      download.file(url = paste0("http://repositorio.dados.gov.br/segrt/AFASTREM_0",month,year,".CSV"),
                    destfile = here::here("data",paste0("afastrem_0",month,year,".csv")),
                    mode = "wb")
    }
    
  if(month == 10){
      download.file(url = paste0("http://repositorio.dados.gov.br/segrt/AFASTREM_",month,year,".CSV"),
                    destfile = here::here("data",paste0("afastrem_",month,year,".csv")),
                    mode = "wb")
  }
  if(month > 10){
    download.file(url = paste0("http://repositorio.dados.gov.br/segrt/AFASTREM_",month,year,".csv"),
                  destfile = here::here("data",paste0("afastrem_",month,year,".csv")),
                  mode = "wb")
  }
}  
      
# For years > 2018
for (year in c(2022:2022)){
  for(month in c(1:5)){
    if (month < 10){
    download.file(url = paste0("http://repositorio.dados.gov.br/segrt/AFASTREM_0",month,year,".csv"),
                  destfile = here::here("data",paste0("afastrem_0",month,year,".csv")),
                  mode = "wb")
    } else {
      download.file(url = paste0("http://repositorio.dados.gov.br/segrt/AFASTREM_",month,year,".csv"),
                    destfile = here::here("data",paste0("afastrem_",month,year,".csv")),
                    mode = "wb")
    }
  }
}
  