clc;
clear;
close all;

I = imread('lenna.png');
J = rgb2hsv(I);

H = J(:,:,1); 
S = J(:,:,2); 
V = J(:,:,3); 

subplot(2, 2, 1); imshow(J);
subplot(2, 2, 2); imshow(H);
subplot(2, 2, 3); imshow(S);
subplot(2, 2, 4); imshow(V);
