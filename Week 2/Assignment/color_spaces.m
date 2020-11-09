clc;
clear;
close all;

I = imread('lenna.png');
[W, channels] = splitChannels(I);
subplot(1, 2, 1); imshow(I);
subplot(1, 2, 2); imshow(W);

function [W, channels] = splitChannels(I)
    [n, m, channels] = size(I);
    W = uint8(zeros(n, m * channels, 3));
    for i = 1:channels
        W(:, m * (i - 1) + 1 : m * i, :) = channel(I, i);
    end
end

function W = channel(I, channel_num)
    W = I;
    [~, ~, channels] = size(I);
    for i = 1:channels
        if i == channel_num
            continue;
        end
        W(:, :, i) = 0;
    end
end
