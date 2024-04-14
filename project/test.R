install.packages("tidyverse")
install.packages("plotly")
library(tidyverse)
library(plotly)
unicef_indicator_1 <- read_csv("unicef_indicator_1.csv")  

# World Map 1

map_world <- map_data("world")
map_data_join <-full_join(unicef_indicator_1,map_world, by = c("country" = "region"))
ggplot(map_data_join) +
  aes(x = long, y = lat, group = group, fill = obs_value) +
  geom_polygon()
   
# Timeseries 1 

timeseries_plot_1 <- unicef_indicator_1 %>%
  ggplot() +
  aes(obs_value, country, group = country, color = country) +
  geom_line()
  
ggplotly(timeseries_plot_1)

# Scatterplot 1

scatter_plot_1 <- unicef_indicator_1 %>%
ggplot() +
  aes(time_period, obs_value, color = country) +
  geom_point()
    
ggplotly(scatter_plot_1)

# Bar Chart 

bar_chart_1 <- unicef_indicator_1 %>%
group_by(country, time_period) %>%
ggplot() +
  aes(sex, obs_value, fill = country) +
  geom_col()

ggplotly(bar_chart_1)
  