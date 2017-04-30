function [ eigen_faces ] = EigenFaceTraining( x, M )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[U, S, ~] = svd(x);
eigen_values = diag(S);
[eigen_values, index] = sort(eigen_values, 'descending');
total = sum(eigen_values);
n = numel(eigen_values);
eigen_values = eigen_values .^ 2 / n;
summation = 0;

if M == -1
    for i = 1:n
        summation = summation + eigen_values(i);
        if (summation / total) > 0.95
            k = i;
            break;
        end
    end
else
    k = M;
end
eigen_faces = U(:, index(1:k));
end

