%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% 1. Representation of Images as graphs
% 2. Image segmentation using Spectral Clustering
% 3. Image segmetentation using Normalized-cuts

%% Demo 3a - Demonstration of the Non Recursive version of N-Cuts

%% Clearing
clear all;
close all;
clc;

%% Import data
load dip_hw_2.mat

%% Settings
% Setting seed for for reproducibility 
rng(1)

% List with images for running tests
images = ["apple.png","cars.jpg","owl.png","pika.png","mario.jpg"];

% Choosing image for running tests as d2b image
im = 0;                                         % Zero for default images

if im == 6
    load march.mat
    Im = bayer2rgb(x);
    d2b = myresize(Im,100,100,'linear');
elseif (im<=5)&&(im>=1)
    Im = imread(images{im});             
    Im = im2double(Im);
    d2b = myresize(Im,100,100,'linear');      
end

% d2b = myFilter(d2b);                          % Uncomment for filter use

%% Image2Graph
W1 = Image2Graph(d2a);
W2 = Image2Graph(d2b);

%% Clustering (N-Cuts) & Visualization
k = 2;
lbla_2 = myNCuts(W1,k);
lblb_2 = myNCuts(W2,k);

k = 3;
lbla_3 = myNCuts(W1,k);
lblb_3 = myNCuts(W2,k);

k = 4;
lbla_4 = myNCuts(W1,k);
lblb_4 = myNCuts(W2,k);

[M,N,~] = size(d2a);

figure
suptitle('Effects of clustering d2a / N-Cuts:')

subplot(2,2,1)
imshow(d2a)
title('Original Image')

lbla_2 = Lab2Im(lbla_2,M,N);        % Reshape Flip Rotate
subplot(2,2,2)
imshow(lbla_2)
title('Clustering / k = 2')

lbla_3 = Lab2Im(lbla_3,M,N);        % Reshape Flip Rotate
subplot(2,2,3)
imshow(lbla_3)
title('Clustering / k = 3')

lbla_4 = Lab2Im(lbla_4,M,N);        % Reshape Flip Rotate
subplot(2,2,4)
imshow(lbla_4)
title('Clustering / k = 4')

figure
suptitle('Effects of clustering d2b / N-Cuts:')

subplot(2,2,1)
imshow(d2b)
title('Original Image')

[M,N,~] = size(d2b);

lblb_2 = Lab2Im(lblb_2,M,N);        % Reshape Flip Rotate
subplot(2,2,2)
imshow(lblb_2)
title('Clustering / k = 2')

lblb_3 = Lab2Im(lblb_3,M,N);        % Reshape Flip Rotate
subplot(2,2,3)
imshow(lblb_3)
title('Clustering / k = 3')

lblb_4 = Lab2Im(lblb_4,M,N);        % Reshape Flip Rotate
subplot(2,2,4)
imshow(lblb_4)
title('Clustering / k = 4')

%% ------------------------- End of demo3a.m ------------------------------