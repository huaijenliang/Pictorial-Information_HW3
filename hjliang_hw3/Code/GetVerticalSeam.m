function [ indexs ] = GetVerticalSeam( cost )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[rows, cols] = size(cost);
least_sum = cost;
for r = 1:(rows -1)
    temp_row = least_sum(r, :);
    left = temp_row(1:(end - 1)) < temp_row(2:end);
    temp_row([false, left]) = temp_row(left);
    right = temp_row(2:end) < temp_row(1:(end - 1));
    temp_row(right) = temp_row([false, right]);
    least_sum(r + 1, :) = least_sum(r + 1, :) + temp_row;
end

% find path
indexs = zeros(rows, 1);
min_values = min(least_sum(rows, :));
temp_index = find(least_sum(rows, :) == min_values);
indexs(rows) = temp_index(randi(numel(temp_index)));

for r = (rows - 1):-1:1
    next_indexs = max(indexs(r + 1) - 1, 1):min(indexs(r + 1) + 1, cols);
    min_values = min(least_sum(r, next_indexs));
    temp_index = find(least_sum(r, next_indexs) == min_values);
    indexs(r) = next_indexs(temp_index(randi(numel(temp_index))));
end

end

