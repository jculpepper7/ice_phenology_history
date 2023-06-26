# The goal of this script is to 
# Read in ice phenology data
# create a plot to look at the history of ice phenology

#libraries
library(tidyverse)
library(here)
library(janitor)

# 1. Read in data ---------------------------------------------------------

hist <- read_csv(here('data/ice_phenology_literature.csv'))


# 2. Modify variables --------------------------------------------------------

hist2 <- hist %>% 
  mutate(
    country = as.factor(country),
    continent = as.factor(continent),
    focus = as.factor(focus),
    combined_method = as.factor(combined_method)
  )

# 3. Visualize ---------------------------------------------------------------

fig1 <- ggplot(data = hist2)+
  geom_bar(aes(x = year, fill = country))+
  scale_fill_viridis_d()+
  theme_classic()
fig1
