function [ output_img, output_seam ] = RemoveSeam( img, indexs, vertical )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

[rows, cols, ~] = size(img);
output_seam = img;
if vertical == 1
    for r = 1:rows
        img(r, indexs(r):(cols - 1), :) = img(r, (indexs(r) + 1):cols, :);
        output_seam(r, indexs(r), :) = [255, 0, 0];
    end
    output_img = img(:, 1:(cols - 1), :);
else
    for c = 1:cols
        img(indexs(c):(rows - 1), c, :) = img((indexs(c) + 1):rows, c, :);
        output_seam(c, indexs(c), :) = [255, 0, 0];
    end
    output_img = img(1:(rows - 1), :, :);
end

end

