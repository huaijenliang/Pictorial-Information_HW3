function [ cost ] = GetCost( img )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

f = [0.5 1 0.5; ...
     1 -6 1; ...
     0.5 1 0.5];
cost = imfilter(img, f, 'conv', 'symmetric') ;
cost = abs(sum(cost, 3));

end

