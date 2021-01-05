### Show the patterns of electoral violence for the last 20 years in Zimbabwe, Zambia, Tanzania, Angola, Mozambique, Uganda, 
### the DRC and zimiopia using the tza data sets available from humdata exchange website. Data sets updated 11 Nov 2020

library(readr)
library(tidyverse)
library(extrafont)
loadfonts(quiet = T)

### Read in data

tza <- read_csv("data/conflict_data_tza.csv")
tza <- tza[-1,]

ago <- read_csv("data/conflict_data_ago.csv")
ago <- ago[-1,]

cod <- read_csv("data/conflict_data_cod.csv")
cod <- cod[-1,]

eth <- read_csv("data/conflict_data_eth.csv")
eth <- eth[-1,]

zim <- read_csv("data/conflict_data_zwe.csv")
zim <- zim[-1,]

moz <- read_csv("data/conflict_data_moz.csv")
moz <- moz[-1,]

uga <- read_csv("data/conflict_data_uga.csv")
uga <- uga[-1,]

uga <- read_csv(url("https://data.humdata.org/dataset/e71f2e33-b7ea-48ee-86e2-fce72dc17eaa/resource/40037563-3ded-4ac9-8822-895465731c9a/download/conflict_data_uga.csv"))
uga <- uga[-1,]

zmb <- read_csv("data/conflict_data_zmb.csv")
zmb <- zmb[-1,]

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

## Zambia

zmb$event_date <- lubridate::ymd(zmb$event_date)

zmb$year <- as.integer(zmb$year)

zmb$event_type_dummy <- NA

zmb$event_type_dummy[zmb$event_type == "Violence against civilians"] <- 1
zmb$event_type_dummy[zmb$event_type == "Protests"] <- 2
zmb$event_type_dummy[zmb$event_type == "Riots"] <- 3
zmb$event_type_dummy[zmb$event_type == "Strategic developments"] <- 4
zmb$event_type_dummy[zmb$event_type == "Battles"] <- 5
zmb$event_type_dummy[zmb$event_type == "Explosions/Remote violence"] <- 6

## Zimbabwe

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

breaks <- c(1998, 2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018, 2020)

### TANZANIA

tza %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_x_continuous(breaks = breaks, labels = breaks) +
    expand_limits(y = c(0, 35), x = c(1997, 2021)) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Tanzania",
         subtitle = "1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    annotate("text", x = 1999, y = 15, label = paste(strwrap("Benjamin Mkapa elected for 2nd term.", 20), collapse = "\n")) + # 2nd election
    annotate("segment", x = 1999, y = 12, xend = 2000, yend = 7,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2002, y = 26, 
             label = paste(strwrap("Political violence in Zanzibar, CCM re-elected.", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2002, y = 24, xend = 2004.5, yend = 20,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2011, y = 30, 
             label = paste(strwrap("Civil unrest over issues of corruption, human rights abuses and misuse of revenue funds.", 40), collapse = "\n")) + # 2nd election
    annotate("curve", x = 2011, y = 27, xend = 2011.5, yend = 21,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2015, y = 16, 
             label = paste(strwrap("John Magufuli elected", 20), collapse = "\n")) + # Magufuli 2015
    annotate("segment", x = 2015, y = 14.5, xend = 2015, yend = 7,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2019, y = 28, 
             label = paste(strwrap("Magufuli re-elected amidst supression of the media and anti-gay laws", 35), collapse = "\n")) + # Magufuli 2020
    annotate("segment", x = 2019, y = 25, xend = 2020, yend = 21,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
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

ggsave("tza_violence_plot.png", dpi = 600)

### ANGOLA

ago %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Angola",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    annotate("text", x = 2005.2, y = 97, 
             label = paste(strwrap("In 1997 a unified government is inaugrated but tensions mount soon after and civil war breaks out in 1998.", 40), collapse = "\n")) + # 2nd election
    annotate("curve", x = 2005, y = 105, xend = 1998, yend = 105,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2006, y = 35, 
             label = paste(strwrap("First parlimentary elections for 16 years", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2006, y = 28, xend = 2008, yend = 15,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2010, y = 55, 
             label = paste(strwrap("Parliament approves new constitution strengthening the presidency and abolishing direct elections for the post.", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2010, y = 41, xend = 2010, yend = 11,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2017, y = 75, 
             label = paste(strwrap("Legislative elections held, MPLA confrimed as winners, Joao Lourenco becomes president", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2017, y = 67, xend = 2017, yend = 22,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
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

ggsave("ago_violence_plot.png", dpi = 600)

### ETHIOPIA

eth %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    expand_limits(y = c(0, 390), x = c(1997, 2021)) +
    labs(title = "Frequency of violence against citizens in Ethiopia",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    annotate("text", x = 1999, y = 50, 
             label = paste(strwrap("Ethiopian-Eritrean border war begins", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 1999, y = 45, xend = 1999, yend = 18,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2009, y = 120, 
             label = paste(strwrap("General elections held, EPRDF win. Some observers noted supression of media freedom", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2009, y = 95, xend = 2010, yend = 55,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2014, y = 180, 
             label = paste(strwrap("Government declares state of emergency following months of violent anti-government protests.", 40), collapse = "\n")) + # 2nd election
    annotate("curve", x = 2014, y = 154, xend = 2015.5, yend = 120,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2017, y = 345, 
                 label = paste(strwrap("Anti-gov protests escaltes, Abiy Ahmed becomes priminster. War between Eritrea ends.", 40), collapse = "\n")) + # 2nd election
    annotate("curve", x = 2017, y = 300, xend = 2017.5, yend = 220,
                 arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
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

ggsave("eth_violence_plot.png", dpi = 600)

### MOZAMBIQUE

moz %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Mozambique",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    annotate("text", x = 2004, y = 60, 
             label = paste(strwrap("Frelimo's Armando Guebuza inaugurated as president.", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2004, y = 45, xend = 2005, yend = 15,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2009, y = 100, 
             label = paste(strwrap("President Guebuza is re-elected as president.", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2009, y = 85, xend = 2009, yend = 25,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2013, y = 150, 
             label = paste(strwrap("Renewed fighting between government forces and Renamo rebels in the south district of Homoine. Frelimo party candidate Filipe Nyusi wins election ", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2013, y = 120, xend = 2014, yend = 31,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2015.5, y = 250, 
             label = paste(strwrap("Jihadist insurgency begins in 2017 in Cabo Delgado. State security forces struggle to respond.", 40), collapse = "\n")) + # 2nd election
    annotate("curve", x = 2016, y = 230, xend = 2018.5, yend = 200,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2015.5, y = 310, 
             label = paste(strwrap("President Nyusi re-elected for final five-year term.", 40), collapse = "\n")) + # 2nd election
    annotate("segment", x = 2016, y = 298, xend = 2020, yend = 280,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
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

ggsave("moz_violence_plot.png", dpi = 600)

### Uganda

uga %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Uganda",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 30 December 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    annotate("text", x = 1998.5, y = 190, 
             label = paste(strwrap("Ugandans vote to reject multi-party politics continuing Museveni's `no-party` system.", 35), collapse = "\n")) + 
    annotate("segment", x = 1999, y = 165, xend = 2000, yend = 105,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 1999, y = 260, 
             label = paste(strwrap("400,000 civilians caught up in fight against LRA rebels which attacks villages.", 35), collapse = "\n")) + 
    annotate("segment", x = 2001, y = 247, xend = 2002, yend = 213,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2007.8, y = 265, 
             label = paste(strwrap("President Museveni wins multi-party elections, observers highlight intimidation of opposition and media bias.", 45), collapse = "\n")) + 
    annotate("segment", x = 2007, y = 250, xend = 2006, yend = 152,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2008.5, y = 200, 
             label = paste(strwrap("Parliament approves amendment which scraps presidential term limits.", 45), collapse = "\n")) + 
    annotate("curve", x = 2006, y = 190, xend = 2005, yend = 90,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed"), curvature = 0.2) +
    annotate("text", x = 2016, y = 160, 
             label = paste(strwrap("President Museveni wins re-election against Kizza Besigye.", 45), collapse = "\n")) + 
    annotate("curve", x = 2016, y = 145, xend = 2016, yend = 35,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed"), curvature = 0.2) +
    annotate("text", x = 2018, y = 220, 
             label = paste(strwrap("Museveni will be running for sixth term in 2021 after amending the constitution twice.", 40), collapse = "\n")) + 
    annotate("segment", x = 2018, y = 195, xend = 2020, yend = 150,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed"), curvature = 0.2) +
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

ggsave("uga_violence_plot.png", dpi = 600)

### only 2020

uga %>% 
    filter(event_type_dummy == 1,
           year == 2020) %>% 
    ggplot(aes(x = event_date, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    scale_fill_viridis_d(option = "E") +
    labs(title = "Frequency of violence against citizens in Uganda",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 30 December 2020. 
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


### Zambia

zmb %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    scale_x_continuous(breaks = breaks, labels = breaks) +
    scale_fill_viridis_d(option = "E") +
    expand_limits(y = c(0, 40), x = c(1997, 2021)) +
    labs(title = "Frequency of violence against citizens in Zambia",
         subtitle = "The ACLED dataset 1997-2020",
         y = "", x = "", 
         caption = "Source: ACLED Conflict Data, 11 November 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
    annotate("text", x = 1998, y = 17, 
             label = paste(strwrap("Fighting between Angolan forces and UNITA rebels spills over into Zambian.", 35), collapse = "\n")) + 
    annotate("curve", x = 1998, y = 13, xend = 1999.5, yend = 8,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2001, y = 25, 
             label= paste(strwrap("MMD candidate Levy Mwanawasa wins presidential elections", 35), collapse = "\n")) + 
    annotate("segment", x = 2001, y = 23, xend = 2001, yend = 10.5,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2006, y = 30, 
             label= paste(strwrap("President Mwanawasa wins a second term.", 30), collapse = "\n")) + 
    annotate("segment", x = 2006, y = 28, xend = 2006, yend = 20.5,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2010, y = 13, 
             label= paste(strwrap("PF candidate Michael Sata is elected", 35), collapse = "\n")) + 
    annotate("segment", x = 2010, y = 10.5, xend = 2010.7, yend = 7.5,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2014, y = 32, 
             label= paste(strwrap("President Sata dies, Edgar Lungu becomes president after 2015 election.", 35), collapse = "\n")) + 
    annotate("segment", x = 2014, y = 28, xend = 2014, yend = 25,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
    annotate("text", x = 2018, y = 37, 
             label= paste(strwrap("President Lungu is re-elected", 35), collapse = "\n")) + 
    annotate("curve", x = 2018.5, y = 35, xend = 2016.5, yend = 25,
             arrow = arrow(length = unit(0.2, "cm"), type = "closed"), curvature = -0.2) +
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

ggsave("zmb_violence_plot.png", dpi = 600)

## Zimbabwe


zim %>% 
    filter(event_type_dummy == 1) %>% 
    ggplot(aes(x = year, y = event_type_dummy, fill = sub_event_type)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    scale_x_continuous(breaks = breaks, labels = breaks) +
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

ggsave("zim_violence_plot.png", dpi = 600)
