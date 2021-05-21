make_hex <- function(){
library(hexSticker)

fish_curve <- function(colour='black', size = 5){
  library(ggplot2)
  library(dplyr)
  library(nmfspalette)
  data.frame(
    x = cos(1:10000) - sin(1:10000)^2 / sqrt(2),
    y = cos(1:10000) * sin(1:10000), color_ran=(-500):499
  ) %>%
    ggplot(., aes(x, y, colour=color_ran)) +
    geom_point(size = size) +
    geom_jitter(width=0.1,height=0.1) +
    scale_color_nmfs(discrete=FALSE, palette="oceans")+
    theme_void() + theme_transparent(legend.position="none") 
}

p1 <- fish_curve(size=0.001)

s <- sticker(p1,
             package="nmfspalette", p_size=16, 
             p_color=nmfspalette::nmfs_cols("darkblue"),
             s_x=1, s_y=.8, s_width=.8, s_height=.8,
             h_fill = nmfspalette::nmfs_cols("lightteal"), 
             h_color = nmfspalette::nmfs_cols("darkblue"),
             filename="man/figures/baseplot.png",
             url="http://nmfs-general-modeling-tools.github.io/nmfspalette/",
             u_size=1.9,
             u_color=nmfspalette::nmfs_cols("darkblue"))
print(s)
}
