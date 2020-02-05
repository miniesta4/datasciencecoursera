
library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(forcats)

# d <-read_csv2("./Data/estadistica.csv", na = c("-", ""), skip = 1)
# saveRDS(d, "./Data/d.rds")

d <- readRDS("./Data/d.rds")

d1 <- pivot_longer(d, cols = -c(Pais, Area) , names_to = "Fecha", 
                   values_to = "Num_habit")

d2 <- d1[complete.cases(d1), ]
d2$fecha2 <- as.Date(d2$Fecha, format = "%d/%m/%y")
d2$Num_habit <- as.integer(d2$Num_habit)

areas <- sort(unique(d2$Area))
fechas <- sort(unique(d2$fecha2))

d2_byCF <- d2 %>% 
  group_by(Area, fecha2) %>% 
  summarise(num_habit_area = sum(Num_habit))

g <- ggplot(d2_byCF, aes(fecha2, num_habit_area, 
                    color = fct_reorder2(Area, fecha2, num_habit_area))) +
  geom_line() +
  scale_color_discrete(name="Area") +
  labs(x = "Date", 
       y = "Number of residents",
       title = "Number of Foreign Residents by Geographic Area"
       )
