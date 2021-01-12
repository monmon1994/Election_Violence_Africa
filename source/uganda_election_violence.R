#### Uganda Election Violence ####

library(readr)
library(readxl)
library(tidyverse)
library(extrafont)
# for windows
windowsFonts(sans="Helvetica")
loadfonts(device="win")
loadfonts(device="postscript")

uga1 <- read_csv(url("https://data.humdata.org/dataset/e71f2e33-b7ea-48ee-86e2-fce72dc17eaa/resource/40037563-3ded-4ac9-8822-895465731c9a/download/conflict_data_uga.csv"))
#uga <- uga[-1,]

uga <- read_excel("~/Election_Violence_Africa-master/data/uganda_acled2021.xlsx")

### Recoding

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


#### Uganda Elections 2021

cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73")

uga %>% 
  filter(event_date > "2020-11-01") %>% 
  filter(event_type_dummy %in% c(1, 2, 3, 4)) %>% 
  ggplot(aes(x = event_date, y = event_type_dummy, fill = event_type)) +
  geom_bar(stat = "identity") +
  scale_x_date(date_labels = "%b-%d",
               date_breaks = "1 week",  expand = c(0,0)) +
  scale_fill_manual(values=cbPalette) +
  labs(title = "Frequency of violence against citizens in during Uganda's 2021 Election Campaign",
       y = "Number of events", x = "Days of the week", 
       caption = "Source: ACLED Conflict Data, 8 January 2020. 
Graphic: Monique Bennett at Good Governance Africa") +
  
  ## NUP support
  annotate("text", x = as.Date("2020-11-11"), y = 45, 
           label = paste(strwrap("NUP supporters clashed with security forces after Bobi Wine was arrested.", 30), collapse = "\n")) + 
  annotate("curve", x = as.Date("2020-11-12"), y = 42, xend = as.Date("2020-11-17"), yend = 39,
           arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  ## FDC support
  annotate("text", x = as.Date("2020-11-11"), y = 35, 
           label = paste(strwrap("FDC supporters also clashed with police as they attempted to attend a campaign rally.", 30), collapse = "\n")) + 
  annotate("curve", x = as.Date("2020-11-12"), y = 32, xend = as.Date("2020-11-17"), yend = 29,
           arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  ## Killed
  annotate("text", x = as.Date("2020-11-26"), y = 30, 
           label = paste(strwrap("49 NUP supporters killed and over 100 wounded with clashes with police over Bobi Wine's arrest.", 30), collapse = "\n")) + 
  annotate("segment", x = as.Date("2020-11-25"), y = 26, xend = as.Date("2020-11-20"), yend = 22,
           arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  
  ## Campaigns cancelled 
  annotate("text", x = as.Date("2020-11-30"), y = 10, 
           label = paste(strwrap("Opposition campaigns suspended.", 30), collapse = "\n")) + 
  annotate("segment", x = as.Date("2020-11-30"), y = 8.5, xend = as.Date("2020-12-01"), yend = 5,
           arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  ## FDC spike
  annotate("text", x = as.Date("2020-12-04"), y = 20, 
           label = paste(strwrap("FDC supporters unable to attend rallies due to police blockades.", 30), collapse = "\n")) + 
  annotate("segment", x = as.Date("2020-12-04"), y = 17, xend = as.Date("2020-12-10"), yend = 13,
           arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  
  ## Campaigns resume
  annotate("text", x = as.Date("2020-12-18"), y = 25, 
           label = paste(strwrap("After campaigns resumed, tension between opposition supporters and the police increased. Riots and protests continued.", 30), collapse = "\n")) + 
  annotate("curve", x = as.Date("2020-12-19"), y = 18.5, xend = as.Date("2020-12-22"), yend = 10,
           arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  ## NRM protesters
  annotate("text", x = as.Date("2021-01-01"), y = 20, 
           label = paste(strwrap("NRM youth protested against violence by other NRM supporters.", 30), collapse = "\n")) + 
  annotate("segment", x = as.Date("2021-01-02"), y = 16, xend = as.Date("2021-01-05"), yend = 11,
           arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  ##
  annotate("text", x = as.Date("2020-12-30"), y = 45, 
           label = paste(strwrap("*Strategic Developments refer to arrests or other developments that could trigger future political violence and/or demonstrations.", 35), collapse = "\n")) + 
  ##
  annotate("text", x = as.Date("2020-12-07"), y = 20, 
           label = paste(strwrap(".", 30), collapse = "\n")) + 
  annotate("segment", x = as.Date("2021-01-02"), y = 16, xend = as.Date("2021-01-05"), yend = 11,
           arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  theme(panel.background = element_blank(),
        text = element_text(family = "Helvetica", size = 14),
        panel.grid.major = element_line(colour = "#f0f0f0"),
        panel.grid.minor = element_blank(),
        #axis.ticks = element_blank(),
        strip.background = element_rect(fill = "#f5f5f5"),
        plot.background = element_blank(),
        strip.text.x = element_text(hjust = 0),
        plot.caption = element_text(hjust = 0),
        plot.title = element_text(size = 20),
        legend.position = "bottom") +
  guides(fill = guide_legend(title = "Type of violence"))


ggsave("uganda_election_violence2021.png", width = 11, height = 9)
