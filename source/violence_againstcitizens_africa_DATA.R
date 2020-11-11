### Show the patterns of electoral violence for the last 20 years in Zimbabwe, Zambia, Tanzania, Angola, Mozambique, Uganda, 
### the DRC and zimiopia using the tza data sets available from humdata exchange website. Data sets updated 11 Nov 2020

library(readr)
library(tidyverse)

### Read in data

tza <- read_csv("data/conflict_data_tza.csv")
tza <- tza[-1,]

ago <- read_csv("data/conflict_data_ago.csv")
ago <- ago[-1,]

cod <- read_csv("data/conflict_data_cod.csv")
cod <- cod[-1,]

zim <- read_csv("data/conflict_data_zim.csv")
zim <- zim[-1,]

moz <- read_csv("data/conflict_data_moz.csv")
moz <- moz[-1,]

uga <- read_csv("data/conflict_data_uga.csv")
uga <- uga[-1,]

zim <- read_csv("data/conflict_data_zmb.csv")
zim <- zim[-1,]

### recode the datasets

## Tanzania

tza$event_date <- lubridate::ymd(tza$event_date)

tza$year <- as.integer(tza$year)

tza$event_type_dummy <- NA

tza$event_type_dummy[tza$event_type == "Violence against civilians"] <- 1
tza$event_type_dummy[tza$event_type == "Protests"] <- 2
tza$event_type_dummy[tza$event_type == "Riots"] <- 3
tza$event_type_dummy[tza$event_type == "Strategic developments"] <- 4
tza$event_type_dummy[tza$event_type == "Battles"] <- 5
tza$event_type_dummy[tza$event_type == "Explosions/Remote violence"] <- 6

## Angola

ago$event_date <- lubridate::ymd(ago$event_date)

ago$year <- as.integer(ago$year)

ago$event_type_dummy <- NA

ago$event_type_dummy[ago$event_type == "Violence against civilians"] <- 1
ago$event_type_dummy[ago$event_type == "Protests"] <- 2
ago$event_type_dummy[ago$event_type == "Riots"] <- 3
ago$event_type_dummy[ago$event_type == "Strategic developments"] <- 4
ago$event_type_dummy[ago$event_type == "Battles"] <- 5
ago$event_type_dummy[ago$event_type == "Explosions/Remote violence"] <- 6

## DRC

cod$event_date <- lubridate::ymd(cod$event_date)

cod$year <- as.integer(cod$year)

cod$event_type_dummy <- NA

cod$event_type_dummy[cod$event_type == "Violence against civilians"] <- 1
cod$event_type_dummy[cod$event_type == "Protests"] <- 2
cod$event_type_dummy[cod$event_type == "Riots"] <- 3
cod$event_type_dummy[cod$event_type == "Strategic developments"] <- 4
cod$event_type_dummy[cod$event_type == "Battles"] <- 5
cod$event_type_dummy[cod$event_type == "Explosions/Remote violence"] <- 6

## Ethiopia 

eth$event_date <- lubridate::ymd(eth$event_date)

eth$year <- as.integer(eth$year)

eth$event_type_dummy <- NA

eth$event_type_dummy[eth$event_type == "Violence against civilians"] <- 1
eth$event_type_dummy[eth$event_type == "Protests"] <- 2
eth$event_type_dummy[eth$event_type == "Riots"] <- 3
eth$event_type_dummy[eth$event_type == "Strategic developments"] <- 4
eth$event_type_dummy[eth$event_type == "Battles"] <- 5
eth$event_type_dummy[eth$event_type == "Explosions/Remote violence"] <- 6

## Mozambique

moz$event_date <- lubridate::ymd(moz$event_date)

moz$year <- as.integer(moz$year)

moz$event_type_dummy <- NA

moz$event_type_dummy[moz$event_type == "Violence against civilians"] <- 1
moz$event_type_dummy[moz$event_type == "Protests"] <- 2
moz$event_type_dummy[moz$event_type == "Riots"] <- 3
moz$event_type_dummy[moz$event_type == "Strategic developments"] <- 4
moz$event_type_dummy[moz$event_type == "Battles"] <- 5
moz$event_type_dummy[moz$event_type == "Explosions/Remote violence"] <- 6

## Uganda 

uga$event_date <- lubridate::ymd(uga$event_date)

uga$year <- as.integer(uga$year)

uga$event_type_dummy <- NA

uga$event_type_dummy[uga$event_type == "Violence against civilians"] <- 1
uga$event_type_dummy[uga$event_type == "Protests"] <- 2
uga$event_type_dummy[uga$event_type == "Riots"] <- 3
uga$event_type_dummy[uga$event_type == "Strategic developments"] <- 4
uga$event_type_dummy[uga$event_type == "Battles"] <- 5
uga$event_type_dummy[uga$event_type == "Explosions/Remote violence"] <- 6

## Zim

zim$event_date <- lubridate::ymd(zim$event_date)

zim$year <- as.integer(zim$year)

zim$event_type_dummy <- NA

zim$event_type_dummy[zim$event_type == "Violence against civilians"] <- 1
zim$event_type_dummy[zim$event_type == "Protests"] <- 2
zim$event_type_dummy[zim$event_type == "Riots"] <- 3
zim$event_type_dummy[zim$event_type == "Strategic developments"] <- 4
zim$event_type_dummy[zim$event_type == "Battles"] <- 5
zim$event_type_dummy[zim$event_type == "Explosions/Remote violence"] <- 6

####### GRAPHICS ########

### TANZANIA

tza %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    #scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Tanzania",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    theme(panel.background = element_blank(),
          text = element_text(family = "Helvetica", size = 13),
          panel.grid.major = element_line(colour = "#f0f0f0"),
          panel.grid.minor = element_blank(),
          axis.ticks = element_blank(),
          strip.background = element_rect(fill = "#f5f5f5"),
          plot.background = element_blank(),
          strip.text.x = element_text(hjust = 0),
          plot.caption = element_text(hjust = 0),
          plot.title = element_text(size = 18),
          legend.position = "bottom") +
    guides(fill = guide_legend(title = "Type of violence"))

### ANGOLA

ago %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    #scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Angola",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    theme(panel.background = element_blank(),
          text = element_text(family = "Helvetica", size = 13),
          panel.grid.major = element_line(colour = "#f0f0f0"),
          panel.grid.minor = element_blank(),
          axis.ticks = element_blank(),
          strip.background = element_rect(fill = "#f5f5f5"),
          plot.background = element_blank(),
          strip.text.x = element_text(hjust = 0),
          plot.caption = element_text(hjust = 0),
          plot.title = element_text(size = 18),
          legend.position = "bottom") +
    guides(fill = guide_legend(title = "Type of violence"))

### ETHIOPIA

eth %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    #scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Ethiopia",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    theme(panel.background = element_blank(),
          text = element_text(family = "Helvetica", size = 13),
          panel.grid.major = element_line(colour = "#f0f0f0"),
          panel.grid.minor = element_blank(),
          axis.ticks = element_blank(),
          strip.background = element_rect(fill = "#f5f5f5"),
          plot.background = element_blank(),
          strip.text.x = element_text(hjust = 0),
          plot.caption = element_text(hjust = 0),
          plot.title = element_text(size = 18),
          legend.position = "bottom") +
    guides(fill = guide_legend(title = "Type of violence"))

### MOZAMBIQUE

moz %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    #scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Mozambique",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    theme(panel.background = element_blank(),
          text = element_text(family = "Helvetica", size = 13),
          panel.grid.major = element_line(colour = "#f0f0f0"),
          panel.grid.minor = element_blank(),
          axis.ticks = element_blank(),
          strip.background = element_rect(fill = "#f5f5f5"),
          plot.background = element_blank(),
          strip.text.x = element_text(hjust = 0),
          plot.caption = element_text(hjust = 0),
          plot.title = element_text(size = 18),
          legend.position = "bottom") +
    guides(fill = guide_legend(title = "Type of violence"))


### Uganda

uga %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    #scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Uganda",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    theme(panel.background = element_blank(),
          text = element_text(family = "Helvetica", size = 13),
          panel.grid.major = element_line(colour = "#f0f0f0"),
          panel.grid.minor = element_blank(),
          axis.ticks = element_blank(),
          strip.background = element_rect(fill = "#f5f5f5"),
          plot.background = element_blank(),
          strip.text.x = element_text(hjust = 0),
          plot.caption = element_text(hjust = 0),
          plot.title = element_text(size = 18),
          legend.position = "bottom") +
    guides(fill = guide_legend(title = "Type of violence"))

### Zimbabwe

zim %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    #scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Zimbabwe",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    theme(panel.background = element_blank(),
          text = element_text(family = "Helvetica", size = 13),
          panel.grid.major = element_line(colour = "#f0f0f0"),
          panel.grid.minor = element_blank(),
          axis.ticks = element_blank(),
          strip.background = element_rect(fill = "#f5f5f5"),
          plot.background = element_blank(),
          strip.text.x = element_text(hjust = 0),
          plot.caption = element_text(hjust = 0),
          plot.title = element_text(size = 18),
          legend.position = "bottom") +
    guides(fill = guide_legend(title = "Type of violence"))


