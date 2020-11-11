%Read the image
img = imread('course1image.jpg');

[height, width] = size(img);
oneThird = floor(height/3);

B = img(1:(oneThird), :);
G = img((oneThird+1):(2*oneThird), :);
R = img((2*oneThird+1):(3*oneThird), :);

c_x = (341/2-25);
c_y = (400/2-25);
ref_img_region = double(G(c_x:c_x + 50, c_y:c_y + 50));

red_offset = offset(double(R(c_x:c_x + 50, c_y:c_y + 50)), ref_img_region);
shifted_red = circshift(R, red_offset);

blue_offset = offset(double(B(c_x:c_x + 50, c_y:c_y + 50)), ref_img_region);
shifted_blue = circshift(B, blue_offset);

ColorImg_aligned = cat(3, shifted_red, G, shifted_blue);
%ColorImg_aligned = cat(3, G, shifted_red, shifted_blue);
%ColorImg_aligned = cat(3, G, shifted_blue, shifted_red);
%ColorImg_aligned = cat(3, G, shifted_blue, shifted_red);
imshow(ColorImg_aligned);

% Find the minimun offset by ssd
function [output] = offset(img1, img2)
    MIN = inf; 
    for x = -10:10
        for y = -10:10
            temp = circshift(img1, [x, y]);
            ssd = sum((img2 - temp).^2, 'all');
            if ssd < MIN
                MIN = ssd;
                output = [x, y];
            end
        end
    end
end
