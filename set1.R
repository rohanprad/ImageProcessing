library(imager)
library(magick)

# Reading and plotting the image with imager
japan <- load.image("https://raw.githubusercontent.com/rohanprad/ImageProcessing/main/japan.jpg")
plot(japan)

# Getting some basic info
japan

# Reading and viewing the image with magick
japan <- image_read("https://raw.githubusercontent.com/rohanprad/ImageProcessing/main/japan.jpg")

# Displaying the actual size of the image
print(japan)

# Resizing the image
resize <- image_scale(japan, "300") # setting the width to 300px
print(resize)
resize <- image_scale(japan, "x100") #setting the height to 100px
print(resize)

# Converting the image to grayscale
japan.grayscale <- image_convert(japan, type = 'grayscale')
plot(japan.grayscale)

# Converting the image to black & white
japan.bnw <- image_convert(japan, type = 'bilevel')
plot(japan.bnw)

# Splitting the image into three separate RGB channels
japan <- load.image("https://raw.githubusercontent.com/rohanprad/ImageProcessing/main/japan.jpg")

# Red Channel
japan.red <- japan
G(japan.red) <- 0
B(japan.red) <- 0
plot(japan.red)

# Green Channel
japan.green <- japan
R(japan.green) <- 0
B(japan.green) <- 0
plot(japan.green)

# Blue Channel
japan.blue <- japan
R(japan.blue) <- 0
G(japan.blue) <- 0
plot(japan.blue)

# Creating colour image using R, G and B three separate planes 
japan <- image_read("https://raw.githubusercontent.com/rohanprad/ImageProcessing/main/japan.jpg")
japan <- image_quantize(japan ,max = 10, colorspace = "rgb")
layers <- image_split(japan)
japan.RGB <- image_flatten(layers)
plot(japan.RGB)

# Displaying 2D image data
japan <- load.image("https://raw.githubusercontent.com/rohanprad/ImageProcessing/main/japan.jpg")
japan.2D.data <- as.array(japan)
japan.2D.data
write.table(japan.2D.data, file = 'japan2D.txt')

# Printing General Information for the image
japan <- image_read("https://raw.githubusercontent.com/rohanprad/ImageProcessing/main/japan.jpg")
print(japan)
image_info(japan)
japan

# Exploring the imsplit() function
japan <- load.image("https://raw.githubusercontent.com/rohanprad/ImageProcessing/main/japan.jpg")
imsplit(japan, "x", 6) %>% plot

im <- as.cimg(function(x,y,z) x+y+z, 10, 10, 5)

imsplit(im, "z") # Splitting along the z axis into a list with 5 elements

imsplit(im, "z", 2) # Splitting along the z axis into two groups

imsplit(im, "x",-200) %>% plot # Blocks of 200 pix. along x

imsplit(im, "z", 2) %>% imappend("z") # Splitting and reshaping into a single image

imsplit(japan > .5, "c") %>% plot # We can also split pixsets

# Exploring channels() function
channels(japan)
channels(japan, 1:3)
channels(japan, 1:3, drop = TRUE) %>% str # a list of 2D arrays

