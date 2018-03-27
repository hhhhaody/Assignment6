library(ggmap)
library(tidyverse)
library(magick)

bude <- geocode("Bude, England") 
beach1 <- geocode("Summerleaze Beach") #blue
beach2 <- geocode("Crooklets Beach") #green
club <- geocode("Bude North Cornwall Cricket Club") #red
pub <- geocode("The Barrel at Bude") #purple

# Route from cricket grounds to pub
from <- "Bude North Cornwall Cricket Club"
to <- "The Barrel at Bude"
r <- route(from, to, structure = "route")

roadmap <- get_map('Bude', zoom = 14)
ggmap(roadmap) +
  geom_point(
    aes(x = -4.551349 , y = 50.83054),
    color = "blue", size = 2) +
  geom_point(
    aes(x = -4.553962 , y = 50.83587),
    color = "green", size = 2) +
  geom_point(
    aes(x =  -4.552814 , y = 50.83347),
    color = "red", size = 2) +
  geom_point(
    aes(x = -4.543023, y = 50.83007),
    color = "purple", size = 2) + 
  geom_path(aes(x = lon, y = lat), color = "blue", size = 1, data = r, lineend = "round")
dev.copy(png,'roadmap.png')
dev.off()


watermap <- get_map('Bude', zoom = 14, maptype = 'watercolor')
ggmap(watermap) +
  geom_point(
    aes(x = -4.551349 , y = 50.83054),
    color = "blue", size = 2) +
  geom_point(
    aes(x = -4.553962 , y = 50.83587),
    color = "green", size = 2) +
  geom_point(
    aes(x =  -4.552814 , y = 50.83347),
    color = "red", size = 2) +
  geom_point(
    aes(x = -4.543023, y = 50.83007),
    color = "purple", size = 2) + 
  geom_path(aes(x = lon, y = lat), color = "red", size = 1, data = r, lineend = "round")
dev.copy(png,'watermap.png')
dev.off()

BudeBeaches <- image_scale(image_read('https://www.visitbude.info/wp-content/uploads/2015/04/Black-Rock-Beach.jpg'))
print(BudeBeaches)
image_write(BudeBeaches, path = "BudeBeaches.jpg", format = "jpg")

SummerleazeBeach <- image_scale(image_read('https://upload.wikimedia.org/wikipedia/commons/9/99/Beach_huts_on_Summerleaze_Beach.jpg'))
print(SummerleazeBeach)
image_write(SummerleazeBeach, "SummerleazeBeach.jpg", format="jpg")

CrookletsBeach <- image_scale(image_read('https://www.cornwall-beaches.co.uk/public/photos/crooklets.jpg'))
print(CrookletsBeach)
image_write(CrookletsBeach, "CrookletsBeach.jpg", format="jpg")

BudeNorthCornwallCricketClub <- image_scale(image_read('http://s3.amazonaws.com/medias.photodeck.com/7278c145-1d03-4086-a9d8-54e83280973b/SAB6155_xlarge.jpg'))
print(BudeNorthCornwallCricketClub)
image_write(BudeNorthCornwallCricketClub, "BudeNorthCornwallCricketClub.jpg", format="jpg")

TheBarrelatBude <- image_scale(image_read('http://www.micropubassociation.co.uk/wp-content/uploads/barrel-800x800.jpg'))
print(TheBarrelatBude)
image_write(TheBarrelatBude, "TheBarrelatBude.jpg", format="jpg")

