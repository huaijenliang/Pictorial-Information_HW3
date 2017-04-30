function [ output_I ] = AnisotropicDiffusion( img, iter, lambda, k, variant )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I = double(img);
f_nw = [1, 0, 0; 0, -1, 0; 0, 0, 0];
f_n = [0, 1, 0; 0, -1, 0; 0, 0, 0];
f_ne = [0, 0, 1; 0, -1, 0; 0, 0, 0];
f_e = [0, 0, 0; 0, -1, 1; 0, 0, 0];
f_se = [0, 0, 0; 0, -1, 0; 0, 0, 1];
f_s = [0, 0, 0; 0, -1, 0; 0, 1, 0];
f_sw = [0, 0, 0; 0, -1, 0; 1, 0, 0];
f_w = [0, 0, 0; 1, -1, 0; 0, 0, 0];
for i = 1:iter
    g_nw = imfilter(I, f_nw, 'symmetric', 'conv');
    g_n = imfilter(I, f_n, 'symmetric', 'conv');
    g_ne = imfilter(I, f_ne, 'symmetric', 'conv');
    g_e = imfilter(I, f_e, 'symmetric', 'conv');
    g_se = imfilter(I, f_se, 'symmetric', 'conv');
    g_s = imfilter(I, f_s, 'symmetric', 'conv');
    g_sw = imfilter(I, f_se, 'symmetric', 'conv');
    g_w = imfilter(I, f_w, 'symmetric', 'conv');
    if variant == 1
        c_nw = exp(- (g_nw ./ k) .^ 2);
        c_n = exp(- (g_n ./ k) .^ 2);
        c_ne = exp(- (g_ne ./ k) .^ 2);
        c_e = exp(- (g_e ./ k) .^ 2);
        c_se = exp(- (g_se ./ k) .^ 2);
        c_s = exp(- (g_s ./ k) .^ 2);
        c_sw = exp(- (g_se ./ k) .^ 2);
        c_w = exp(- (g_w ./ k) .^ 2);
    else
        c_nw = 1.0 ./ (1.0 + (g_nw ./ k) .^ 2);
        c_n = 1.0 ./ (1.0 + (g_n ./ k) .^ 2);
        c_ne = 1.0 ./ (1.0 + (g_ne ./ k) .^ 2);
        c_e = 1.0 ./ (1.0 + (g_e ./ k) .^ 2);
        c_se = 1.0 ./ (1.0 + (g_se ./ k) .^ 2);
        c_s = 1.0 ./ (1.0 + (g_s ./ k) .^ 2);
        c_sw = 1.0 ./ (1.0 + (g_se ./ k) .^ 2);
        c_w = 1.0 ./ (1.0 + (g_w ./ k) .^ 2);
    end
    I = I + lambda * (c_nw .* g_nw + c_n .* g_n + c_ne .* g_ne + c_e .* g_e ...
                    + c_se .* g_se + c_s .* g_s + c_sw .* g_sw + c_w .* g_w);
end
output_I = I;
end

