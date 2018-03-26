library(ggmap)
library(tidyverse)

bude <- geocode("Bude, England") 
beach1 <- geocode("Summerleaze Beach") #blue
beach2 <- geocode("Crooklets Beach") #green
club <- geocode("Bude and North Cornwall Cricket Club") #red
pub <- geocode("The Barrel at Bude") #purple

roadmap <- get_map('Bude', zoom = 14)
ggmap(roadmap) +
  geom_point(
    aes(x = -4.551312 , y = 50.83074),
    color = "blue", size = 2) +
  geom_point(
    aes(x = -4.553962 , y = 50.83587),
    color = "green", size = 2) +
  geom_point(
    aes(x =  -4.552314 , y = 50.835289),
    color = "red", size = 2) +
  geom_point(
    aes(x = -4.543023, y = 50.830066),
    color = "purple", size = 2)


watermap <- get_map('Bude', zoom = 14, maptype = 'watercolor')
ggmap(watermap) +
  geom_point(
    aes(x = -4.551312 , y = 50.83074),
    color = "blue", size = 2) +
  geom_point(
    aes(x = -4.553962 , y = 50.83587),
    color = "green", size = 2) +
  geom_point(
    aes(x =  -4.552314 , y = 50.835289),
    color = "red", size = 2) +
  geom_point(
    aes(x = -4.543023, y = 50.830066),
    color = "purple", size = 2)


# Route from cricket grounds to pub
from <- "Bude North Cornwall Cricket Club"
to <- "The Barrel at Bude"
r <- route(from, to, structure = "route")
ggmap(roadmap) + 
  geom_path(aes(x = lon, y = lat), color = "blue", size = 1, data = r, lineend = "round")
ggmap(watermap) + 
  geom_path(aes(x = lon, y = lat), color = "red", size = 1, data = r, lineend = "round")
