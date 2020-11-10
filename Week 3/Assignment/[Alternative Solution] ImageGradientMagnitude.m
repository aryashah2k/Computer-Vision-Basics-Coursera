img = imread('cameraman.tif');
[Gx, Gy] = imgradientxy(img);
[Gmag, Gdir] = imgradient(Gx, Gy);
%Uncomment the code below to visualize Gx and Gy 
%imshowpair(Gx,Gy,'montage')

%Uncomment the code below to visualize Gmag and Gdir 
%imshowpair(Gmag,Gdir,'montage')
