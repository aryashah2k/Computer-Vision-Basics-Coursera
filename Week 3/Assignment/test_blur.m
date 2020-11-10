clc;
clear;
close all;

I = imread('lenna.png');
w = 5;
W = pixellated(I, w);
U = pixellated2(I, w);
subplot(1, 2, 1); imshow(I);
subplot(1, 2, 2); imshow(U);

function W = pixellated(I, w)
    [n, m, c] = size(I);
    U = uint8(ones(n + 2 * w, m + 2 * w, c));
    U(w + 1 : n + w, w + 1 : m + w, :) = I;
    W = I;
    
    for row = w + 1 : 2 * w + 1 : n + w
        for column = w + 1 : 2 * w + 1 : m + w
            sub_image = U(row - w : row + w, column - w : column + w, :);
            average = mean(mean(sub_image));
            W(row - w : row + w, column - w : column + w, :) = average .* ...
                ones(2 * w + 1, 2 * w + 1, 3);
        end
    end
end

function W = pixellated2(I, w)
    [n, m, ~] = size(I);
    W = I;
    
    for row = w + 1 : 2 * w + 1 : n + w
        for column = w + 1 : 2 * w + 1 : m + w
            row_upper = upper(row + w, n, n);
            column_upper = upper(column + w, m, m);
            sub_image = I(row - w : row_upper, column - w : column_upper, :);
            average = mean(mean(sub_image));
            W(row - w : row_upper, column - w : column_upper, :) = average .* ...
                ones(row_upper - row + w + 1, column_upper - column + w + 1, 3);
        end
    end
end

function value = upper(value, threshold, default)
    if value > threshold
        value = default;
    end
end