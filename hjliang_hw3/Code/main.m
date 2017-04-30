img = imread('../Images/Brain.jpg');
img = rgb2gray(img);
% subplot(2, 3, 1)
% imshow(img)
k = [0.01, 0.03, 0.06, 0.1, 0.3, 0.6, 1, 10, 30, 60, 100, 300];
lambda = [0.001, 0.005, 0.01, 0.05, 0.1, 0.15, 0.2, 0.25];
rows = 2;
cols = 4;
n = numel(lambda);
output = cell(n, 1);
for i = 1:n
    output{i} = AnisotropicDiffusion(img, 100, lambda(i), k(7), 2);
    subplot('Position', [mod(i - 1, cols) / cols, 1 - ceil(i / cols) / rows, 1 / cols, 1 / rows])
    imshow(uint8(output{i}))
end
[h, w] = size(img);
p = get(gcf,'Position');
ratio = [w, h]/(w + h);
set(gcf,'Position',[p(1), p(2), (p(3) + p(4)) .* ratio]) %// adjust figure x and y size
% training = 0;
% testing = 0;
% accuracy_test = EigenFace(training, testing, -1, 40, 4, 6);
% accuracy_train = EigenFace(training, training, -1, 40, 4, 4);
% 
% img = imread('../Images/SeamCarving.jpg');
% output_seam = SeamCarving(img, 100, 2, 1);
% subplot(1, 2, 1)
% imshow(img)
% subplot(1, 2, 2)
% imshow(output_seam)