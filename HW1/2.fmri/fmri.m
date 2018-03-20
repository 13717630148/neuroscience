clc
clear all

%% Add search path
addpath('perisample', 'NIfTI_20140122');

%% Load data
load('./perisample/L_TAP.txt');
load('./perisample/R_TAP.txt');
my_image = load_nii('./perisample/filtered_func_data.nii.gz');
img = my_image.img;

%% Set parameters
TR = 3; % TR = 3 seconds
[X, Y, Z, N] = size(img); % X = 64, Y = 64, Z = 36, N = 118 TR
t = 0:TR*N;

%% TAP
figure('Name', 'L_TAP');
ref_left = trigger_reference(t, TR, L_TAP);
figure('Name', 'R_TAP');
ref_right = trigger_reference(t, TR, R_TAP);

%% Calculate rsquare
corr_left = rsquare(img, ref_left);
corr_right = rsquare(img, ref_right);

%% Find the max correlation indice
max_left = find(corr_left == max(corr_left(:)));
max_left = [mod(mod(max_left, X*Y), X), ceil(mod(max_left, X*Y)/X), ceil(max_left/(X*Y))]
max_right = find(corr_right == max(corr_right(:)));
max_right = [mod(mod(max_right, X*Y), X), ceil(mod(max_right, X*Y)/X), ceil(max_right/(X*Y))]

%% Find ROI
roi_left = (corr_left > 0.35);
roi_right = (corr_right > 0.41);

%% Mark brain ROI
res = mark_brain_roi(img, roi_left, roi_right);

%% Plot
figure('Name', 'Brain ROI');
for i = 1:36
    subplot(6, 6, i);
    imshow(squeeze(res(:,:,i,:)));
end
figure('Name', 'Brain ROI 28')
imshow(squeeze(res(:,:,28,:)));
title('Brain ROI 28')

%% View nii
view_nii(my_image); % You can explore all voxels in the 4-D data containing 118 volumes