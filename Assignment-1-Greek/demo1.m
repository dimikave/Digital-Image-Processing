%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% 1. RGB Image reconstruction from Bayer Image
% 2. Downsampling of the RGB image
% 3. Quantization
% 4. Saving quantized values in binary form

% demo1.m represents the results coming from bayer2rgb.m function
% from the 1st topic of the assignment.
%% Clearing
clear all
close all
clc

%% Import data
load march.mat
%% Grayscale Image
figure()
imshow(x)
title('Bayer pattern encoded image that was photographed by a camera with a sensor alignment of GBRG')
%% Bayer to RGB
Im = bayer2rgb(x);
%% Result
figure()
imshow(Im)
title('RGB Reconstructed Image')
%% ------------------ End of Demo 1 -------------------------