%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% 1. RGB Image reconstruction from Bayer Image
% 2. Downsampling of the RGB image
% 3. Quantization
% 4. Saving quantized values in binary form

% In demo4.m we take a Bayer image, reconstruct it to rgb
% Downsampling it, quantizing its color values and then
% saving it as a .ppm file 
% Also, we represent the saved image.
%% Clearing
clear all
close all
clc

%% Import Data
load march.mat
%% Bayer to RGB
Im = bayer2rgb(x);
%% Downsampling
dIm = myresize(Im,150,200,'linear');
%% Quantization
bits = 3;
levels = 2^bits;
w1 = 1/levels;
w2 = 1/levels;
w3 = 1/levels;
q = imagequant(dIm,w1,w2,w3);
saveasppm(q,'dip_is_fun.ppm',levels);
imshow('dip_is_fun.ppm')
title('Saved Image / .ppm file ')
%% ------------------------- End of Demo 4 -------------------------------