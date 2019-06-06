
# Load packages -----------------------------------------------------------

library(dplyr)
library(tibble)
library(stringr)
library(readxl)
library(janitor)


# Data Cleaning -----------------------------------------------------------

# Drinks ------------------------------------------------------------------

drinks <- as.tibble(read.csv("Drinks.csv"))

# The serving columns include '?' characters even thugh they should be numbers

drinks <- drinks %>% 
  mutate(beer_servings = na_if(beer_servings, "?"),
         spirit_servings = na_if(spirit_servings, "?"),
         wine_servings = na_if(wine_servings, "?")) %>% 
  mutate_if(is.factor, as.character) %>% 
  mutate_each(as.numeric, c(beer_servings, spirit_servings, wine_servings))

drinks_final <- drinks %>% 
  mutate(beer_alcohol = beer_servings * 12 * 0.5,
         spirit_alcohol = spirit_servings * 5 * 0.12,
         wine_alcohol = wine_servings * 1.5 * 0.40,
         total_alcohol_ounces = beer_alcohol + spirit_alcohol + wine_alcohol,
         total_alcohol_litres = total_alcohol_ounces * 0.0295) %>% 
  select(country, beer_servings, spirit_servings, wine_servings, total_alcohol_litres)


# Life expectancy ---------------------------------------------------------


life_exp_csv <- as.tibble(read.csv("LifeExpectancy.csv"))

life_exp <- life_exp_csv %>% 
  mutate(metric = GhoDisplay,
         year = YearCode,
         country = CountryDisplay,
         region = RegionDisplay,
         income_group = WorldBankIncomeGroupDisplay,
         sex = SexDisplay,
         value = DisplayValue) %>% 
  select(metric, year, country, region, income_group, sex, value) %>% 
  mutate(income_group = str_replace_all(income_group, "_", " ")) %>% 
  mutate_each(as.character, c(metric, country, region, sex))

unique(life_exp$metric)  



# Countries ---------------------------------------------------------------

countries <- read_excel("CountriesOfTheWorld.xls", sheet = "Sheet1", range = "A4:P232")

second_row_col_name_parts <- countries[1, ]
second_row_col_name_parts[is.na(second_row_col_name_parts)] <- " "

names(countries) <- paste(names(countries), second_row_col_name_parts, sep = " ")

countries_final <- countries %>% 
  slice(2:n()) %>% 
  clean_names() 

countires_final <- countries_final %>% 
  mutate_each(as.numeric, c(area_sq_mi, pop_density_per_sq_mi, coastline_coast_area_ratio, infant_mortality_per_1000_births, 
                            gdp_per_capita, literacy_percent, phones_per_1000, arable_percent, crops_percent, other_percent))
