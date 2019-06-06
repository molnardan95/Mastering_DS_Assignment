
# Load packages -----------------------------------------------------------

library(dplyr)
library(tibble)
library(stringr)
library(readxl)


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


life_exp <- as.tibble(read.csv("LifeExpectancy.csv"))

life_exp <- life_exp %>% 
  mutate(metric = GhoDisplay,
         year = YearCode,
         region = RegionDisplay,
         income_group = WorldBankIncomeGroupDisplay,
         sex = SexDisplay,
         value = DisplayValue)
