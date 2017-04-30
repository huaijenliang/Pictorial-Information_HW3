function [ representation ] = GetClassRepresentation( data, eigen_faces, K )
%UNTITLED5 Summary of this function goes here
%   data: dim x N
%   eigen_faces: dim x M
%   K:average every K samples
M = size(eigen_faces, 2);
temp_representation = data' * eigen_faces;
temp_representation = temp_representation';
temp_representation = reshape(temp_representation, M, K, []);
temp_representation = mean(temp_representation, 2);
representation = reshape(temp_representation, M, []);

end

