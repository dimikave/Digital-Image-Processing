%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% 1. RGB Image reconstruction from Bayer Image
% 2. Downsampling of the RGB image
% 3. Quantization
% 4. Saving quantized values in binary form

% demo3.m represents the image coming from the quantization using
% imagequant.m and imagedequant.m functions from the 3rd topic of 
% the assignment.
%% Clearing
clear all
close all
clc
%% Import Data
load march.mat
%% Bayer to RGB
Im = bayer2rgb(x);
%% Quantization and Dequantization of the image
% we want 3 bits so we can use max of 2^bits 
bits = 3;
levels = 2^bits;
% r = range(Im);                % That's the typical range
r = 1;                          % That's max-min = 1 - 0 = 1 in our case
w1 = r/levels;
w2 = r/levels;
w3 = r/levels;
newIm = imagedequant(imagequant(Im,w1,w2,w3),w1,w2,w3);
figure()
imshow(newIm)
title(['Image after quantization / ',num2str(levels),' Levels per color'])
%% ------------------------- End of Demo 3 -------------------------------