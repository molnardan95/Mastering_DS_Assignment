source("DataLoad.R")
library(corrplot)
library(ggplot2)
library(data.table)

# Join Datasets -----------------------------------------------------------


data <- life_exp %>% 
  left_join(drinks_final) %>% 
  left_join(countries_final, by = "country")

# Life Expectancy at Birth ------------------------------------------------


data_life_exp_birth <- data %>% 
  filter(metric == "Life expectancy at birth (years)") %>% 
  mutate(life_exp_at_birth = value) %>% 
  select(-metric, -value)

data_life_exp_birth_num <- data_life_exp_birth %>%
  select_if(is.numeric)

life_exp_birth_corr <- cor(data_life_exp_birth_num, use = "complete.obs")
life_exp_birth_corr[, 20]

corrplot(life_exp_birth_corr, method = "circle")
ggsave("corrplot.png")

# Healthy life expectancy -------------------------------------------------


data_healthy_life_exp <- data %>% 
  filter(metric == "Healthy life expectancy (HALE) at birth (years)") %>% 
  mutate(healthy_life_exp = value) %>% 
  select(-metric, -value)

data_healthy_life_exp_num <- data_healthy_life_exp %>%
  select_if(is.numeric)

healthy_life_exp_corr <- cor(data_healthy_life_exp_num, use = "complete.obs")

corrplot(healthy_life_exp_corr, method = "circle")


# Life expectancy at age 60 -----------------------------------------------

data_life_exp_60 <- data %>% 
  filter(metric == "Life expectancy at age 60 (years)") %>% 
  mutate(life_exp_60 = value) %>% 
  select(-metric, -value)

data_life_exp_60_num <- data_life_exp_60 %>%
  select_if(is.numeric)

life_exp_60_corr <- cor(data_life_exp_60_num, use = "complete.obs")

corrplot(life_exp_60_corr, method = "circle")


# Interpretation ----------------------------------------------------------

corr_to_life_exp <- life_exp_birth_corr[, 20]
corr_to_life_exp <- as.data.frame(corr_to_life_exp)
setDT(corr_to_life_exp, keep.rownames = TRUE)[]

names(corr_to_life_exp) <- c("variable", "correlation")

corr_to_life_exp %>% 
  mutate(variable = reorder(variable, correlation)) %>% 
  filter(variable != "life_exp_at_birth") %>% 
  ggplot(aes(variable, correlation)) +
  geom_bar(stat = "identity") +
  coord_flip()
ggsave("Charts/variable_importance.png")


#Life Expectancy and alcohol consumption

exp_alcohol <- data_life_exp_birth %>% 
  group_by(country) %>% 
  dplyr::summarise(mean_life_exp = mean(life_exp_at_birth),
                   alcohol = mean(total_alcohol_litres, na.rm = TRUE)) %>% 
  left_join(data_life_exp_birth %>% select(country, region.x))

exp_alcohol %>% 
  ggplot(aes(alcohol, mean_life_exp, colour = region.x)) +
  geom_point() +
  facet_wrap(~ region.x) +
  xlab("Total Avg Alcohol Consumption (litres)") +
  ylab("Average Life Expectancy")
ggsave("Charts/regional_life_exp_alcohol.png")

exp_alcohol %>% 
  ggplot(aes(alcohol, mean_life_exp)) +
  geom_point() +
  geom_smooth(method = "loess") +
  xlab("Total Avg Alcohol Consumption (litres)") +
  ylab("Average Life Expectancy")
ggsave("Charts/life_exp_vs_alcohol.png")


# Life Expectancy and GDP

data_life_exp_birth %>% 
  group_by(country) %>% 
  dplyr::summarise(mean_life_exp = mean(life_exp_at_birth),
                   gdp_capita = mean(gdp_per_capita, na.rm = TRUE)) %>% 
  ggplot(aes(gdp_capita, mean_life_exp)) +
  geom_point() +
  geom_smooth(method = "loess") +
  xlab("GDP per Capita") +
  ylab("Average Life Expectancy")
ggsave("Charts/life_exp_vs_gdp.png")


# GDP and Alcohol Consumption

data_life_exp_birth %>% 
  group_by(country) %>% 
  dplyr::summarise(alcohol = mean(total_alcohol_litres, na.rm = TRUE),
                   gdp_capita = mean(gdp_per_capita, na.rm = TRUE)) %>% 
  ggplot(aes(gdp_capita, alcohol)) +
  geom_point() +
  geom_smooth(method = "loess") +
  xlab("GDP per Capita") +
  ylab("Total Avg Alcohol Consumption (litres)")
ggsave("Charts/gdp_vs_alcohol.png")
