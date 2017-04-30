function [ output_img ] = SeamCarving( input_img, iter, v, h )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

img = input_img;

for i = 1:iter
    for j = 1:v
        cost = GetCost(img);
        indexs = GetVerticalSeam(cost);
        [img, seam] = RemoveSeam(img, indexs, 1);
%         imshow(seam)
%         keyboard
    end
    for k = 1:h
        cost = GetCost(img);
        indexs = GetVerticalSeam(cost');
        [img, seam] = RemoveSeam(img, indexs, 0);
%         imshow(seam)
%         keyboard
    end
end

output_img = img;

end

