% Read the image
img = imread('image.jpg');

% Get the size (rows and columns) of the image 
[r, c] = size(img);

% Getting channels from the image
B = img(1 : r / 3, :, :);
G = img(r / 3 + 1 : 2 * r / 3, :, :);
R = img(2 * r / 3 + 1 : r, :, :);

% Concatenate R,G,B channels and assign the RGB image to ColorImg variable
ColorImg(:,:,1) = R;
ColorImg(:,:,2) = G;
ColorImg(:,:,3) = B;
imshow(ColorImg)
