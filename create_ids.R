library(tidyverse)

# Read the dataset
dados_empilhados <- read_rds(here::here("dados_empilhados.rds"))

# Filter only obs regarding maternity/paternity
tipo_licenca <- dados_empilhados %>% 
  distinct(afastamento_desc)

# Show how leaves are described (note that it includes abortion)
tipo_licenca %>% filter(str_detect(afastamento_desc,"Gestante"))
tipo_licenca %>% filter(str_detect(afastamento_desc,"Maternidade"))
tipo_licenca %>% filter(str_detect(afastamento_desc,"Paternidade"))

# Obs: let's also include adoption, even though in this case we don't know the gender of the public employee.
# We could get the gender of these observations using the name or the information of the Lattes CV
tipo_licenca %>% filter(str_detect(afastamento_desc,"Ado"))

# Create a dataset related to maternity/paternity/adoption leave
child_leave <- dados_empilhados %>% 
  filter(str_detect(afastamento_desc,"Gestante|Paternidade|Maternidade|Ado")) 

# Create id using name and cpf
child_leave <- child_leave %>% 
  distinct(nome,cpf,orgao_origem) %>% 
  group_by(nome,cpf) %>% 
  mutate(id = cur_group_id())

# Save
write.csv2(child_leave,here::here("id_dataset.csv"))
