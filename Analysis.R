source("DataLoad.R")
library(corrplot)

# Join Datasets -----------------------------------------------------------


data <- life_exp %>% 
  left_join(drinks_final) %>% 
  left_join(countries_final, by = "country")

# Life Expectancy at Birth ------------------------------------------------


data_life_exp_birth <- data %>% 
  filter(metric == "Life expectancy at birth (years)") %>% 
  mutate(life_exp_at_birth = value) %>% 
  select(-metric, -value)

data_life_exp_birth <- data_life_exp_birth %>%
  select_if(is.numeric)

life_exp_birth_corr <- cor(data_life_exp_birth, use = "complete.obs")


corrplot(life_exp_birth_corr, method = "circle")

# Healthy life expectancy -------------------------------------------------


data_healthy_life_exp <- data %>% 
  filter(metric == "Healthy life expectancy (HALE) at birth (years)") %>% 
  mutate(healthy_life_exp = value) %>% 
  select(-metric, -value)

data_healthy_life_exp <- data_healthy_life_exp %>%
  select_if(is.numeric)

healthy_life_exp_corr <- cor(data_healthy_life_exp, use = "complete.obs")

corrplot(healthy_life_exp_corr, method = "circle")


# Life expectancy at age 60 -----------------------------------------------

data_life_exp_60 <- data %>% 
  filter(metric == "Life expectancy at age 60 (years)") %>% 
  mutate(life_exp_60 = value) %>% 
  select(-metric, -value)

data_life_exp_60 <- data_life_exp_60 %>%
  select_if(is.numeric)

life_exp_60_corr <- cor(data_life_exp_60, use = "complete.obs")

corrplot(life_exp_60_corr, method = "circle")

