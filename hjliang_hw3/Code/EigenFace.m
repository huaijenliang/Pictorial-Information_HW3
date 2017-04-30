function [ accuracy ] = EigenFace( training, testing, M, class_num, training_num, testing_num )
%UNTITLED4 Summary of this function goes here
%   training: dim x N
N = size(training, 2);
train_mean = mean(training, 2);
train_sub = training - repmat(train_mean, 1, N);
eigen_faces = EigenFaceTraining(train_sub, M);
train_representation = GetClassRepresentation(train_sub, eigen_faces, training_num); % M x (N / 4)

test_sub = testing - repmat(train_mean, 1, size(testing, 2));
test_representation = GetClassRepresentation(test_sub, eigen_faces, 1);

dist = pdist2(train_representation', test_representation');
[~, estimate_label] = max(dist); % 1 x ...
c = 1:class_num;
groundtruth = reshape(repmat(c, testing_num, 1), [], 1); % ... x 1
correct = (estimate_label' == groundtruth);
accuracy = sum(correct) / size(correct, 1); 

end

