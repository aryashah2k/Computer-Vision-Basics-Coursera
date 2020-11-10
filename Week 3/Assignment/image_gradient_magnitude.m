img = imread('cameraman.tif');
[Gx,Gy] = imgradientxy(img,'sobel');
[Gmag,Gdir] = imgradient(Gx,Gy);
imshowpair(Gx,Gy,'montage');
imshowpair(Gmag,Gdir,'montage');
