library(tidyverse)

# unzip
unzip(here::here("data","afastrem_2000a2017.zip"),
      exdir = here::here("data"))


# Read 2000 to 2017
df_2000_2004 <- read_csv2(here::here("data","AFASTREM_2000-2004.csv"),
                          locale = locale(encoding = "latin1"), 
                          col_names = c("nome","cpf","emprego_desc","orgao_origem","uf_upag","cidade_residencia",
                                        "escolaridade","ano_mes_afast",
                                        "ano_mes_ref","rendimento_liq",
                                        "afastamento_desc",
                                        "erro"),
                          skip = 2) %>% 
  select(-erro)

df_2005_2009 <- read_csv2(here::here("data","AFASTREM_2005-2009.csv"),
                          locale = locale(encoding = "latin1"), 
                          col_names = c("nome","cpf","emprego_desc","orgao_origem","uf_upag","cidade_residencia",
                                        "escolaridade","ano_mes_afast",
                                        "ano_mes_ref","rendimento_liq",
                                        "afastamento_desc",
                                        "erro"),
                          skip = 2) %>% 
  select(-erro)

df_2010_2014 <- read_csv2(here::here("data","AFASTREM_2010-2014.csv"),
                          locale = locale(encoding = "latin1"), 
                          col_names = c("nome","cpf","emprego_desc","orgao_origem","uf_upag","cidade_residencia",
                                        "escolaridade","ano_mes_afast",
                                        "ano_mes_ref","rendimento_liq",
                                        "afastamento_desc",
                                        "erro"),
                          skip = 2) %>% 
  select(-erro)

df_2015_2017 <- read_csv2(here::here("data","AFASTREM_2015-2017.csv"),
                          locale = locale(encoding = "latin1"), 
                          col_names = c("nome","cpf","emprego_desc","orgao_origem","uf_upag","cidade_residencia",
                                        "escolaridade","ano_mes_afast",
                                        "ano_mes_ref","rendimento_liq",
                                        "afastamento_desc",
                                        "erro"),
                          skip = 2) %>% 
  select(-erro)

afastrem_18 <- map_df(list.files(here::here("data"),pattern = "2018.csv", full.names = T),
                     read_csv2, locale = locale(encoding = "latin1"), 
                     col_names = c("nome","cpf","emprego_desc","orgao_origem","uf_upag","cidade_residencia",
                                   "escolaridade","ano_mes_afast",
                                   "ano_mes_ref","rendimento_liq",
                                   "afastamento_desc",
                                   "erro"),
                     skip = 1) %>% 
  select(-erro)

afastrem_19 <- map_df(list.files(here::here("data"),pattern = "2019.csv", full.names = T),
                      read_csv2, locale = locale(encoding = "latin1"), 
                      col_names = c("nome","cpf","emprego_desc","orgao_origem","uf_upag","cidade_residencia",
                                    "escolaridade","ano_mes_afast",
                                    "ano_mes_ref","rendimento_liq",
                                    "afastamento_desc",
                                    "erro"),
                      skip = 1) %>% 
  select(-erro)

afastrem_20 <- map_df(list.files(here::here("data"),pattern = "2020.csv", full.names = T),
                      read_csv2, locale = locale(encoding = "latin1"), 
                      col_names = c("nome","cpf","emprego_desc","orgao_origem","uf_upag","cidade_residencia",
                                    "escolaridade","ano_mes_afast",
                                    "ano_mes_ref","rendimento_liq",
                                    "afastamento_desc",
                                    "erro"),
                      skip = 1) %>% 
  select(-erro)

afastrem_21 <- map_df(list.files(here::here("data"),pattern = "2021.csv", full.names = T),
                      read_csv2, locale = locale(encoding = "latin1"), 
                      col_names = c("nome","cpf","emprego_desc","orgao_origem","uf_upag","cidade_residencia",
                                    "escolaridade","ano_mes_afast",
                                    "ano_mes_ref","rendimento_liq",
                                    "afastamento_desc",
                                    "erro"),
                      skip = 1) %>% 
  select(-erro)

df <- bind_rows(df_2000_2004,df_2005_2009,df_2010_2014,df_2015_2017,
                afastrem_18,afastrem_19,afastrem_20,afastrem_21)

#save
write_rds(df,here::here("dados_empilhados.rds"))
