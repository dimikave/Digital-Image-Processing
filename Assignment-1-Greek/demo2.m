%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% 1. RGB Image reconstruction from Bayer Image
% 2. Downsampling of the RGB image
% 3. Quantization
% 4. Saving quantized values in binary form

% demo2.m represents the results coming from myresize.m function
% from the 2nd topic of the assignment.
%% Clearing
clear all
close all
clc
%% Import Data
load march.mat
%% Bayer to RGB
Im = bayer2rgb(x);
%% Resizing
% Nearest Neighbor Method
nnIm = myresize(Im,240,320,'nearest');
figure()
imshow(nnIm)
title(['Resized Image / Nearest Neighbor Method / Size : ',num2str(size(nnIm,1)),'*',num2str(size(nnIm,2))])
% Bilinear Interpolation Method
biIm = myresize(Im,200,300,'linear');
figure()
imshow(biIm)
title(['Resized Image / Bilinear Interpolation Method / Size : ',num2str(size(biIm,1)),'*',num2str(size(biIm,2))])
%% ------------------------- End of Demo 2 -------------------------------