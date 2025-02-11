library(ggplot2)
library(ggthemes)
library(ggrepel)
library(hrbrthemes)
library(readxl)
library(plotly)
library(tidyverse)
library(ggrepel)

options(scipen = 999)

passat <- readxl::read_excel("sti/til/data")

vwpas <- passat

ggplot(vwpas, aes(x = km_per_liter, y = price, size = motor_size)) +
  geom_point()

unique(vwpas$dealer_type)

cols <- c("Privat" = "blue", "Forhandler" = "orange")

ggplot(vwpas, aes(x = km_per_liter, y = price, size = motor_size, colour = dealer_type)) +
  geom_point(alpha = 0.3) +
  scale_color_manual(values = cols) +
  labs(x = "Kilometer på literen",
       y = "Pris",
       title = "Det er billigere hos private end forhandler",
       subtitle = "Men det vidste vi godt",
       caption = "Data er hapset fra bilbasen.dk") +
  theme_minimal() +
  theme(panel.grid = element_blank()) +
  geom_text_repel(aes(label = ifelse(motor_size>1.5 & year>2014, as.character(car),'')),
                  hjust = 0, vjust = 0,
                  size = 3,
                  colour = "black")
  

