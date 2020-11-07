img = imread('cameraman.tif');
subimg1 = img(1:50, 1:50);
subimg2 = img(end - 49 : end,  end - 49 : end);
SSD = sum(sum(((subimg1) - (subimg2)) .^ 2));
