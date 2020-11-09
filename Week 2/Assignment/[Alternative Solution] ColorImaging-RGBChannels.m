%Read the image
img = imread('image.jpg');

%Get the size (rows and columns) of the image 
[r,c] = size(img);

%Wrire code to split the image into three equal parts and store them in B, G, R channels
B = img(1:341,1:1200);
G = img(342:682,1:1200);
R = img(683:1023,1:1200);

%concatenate R,G,B channels and assign the RGB image to ColorImg variable
ColorImg = cat(3, R, G, B);
