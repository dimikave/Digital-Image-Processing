%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% 1. Representation of Images as graphs
% 2. Image segmentation using Spectral Clustering
% 3. Image segmetentation using Normalized-cuts

%% Demo 3b - Recursive n-cut demonstration for 1 step
   % Image segmentation with recursive n-cut for 1 step and comparison with
   % mySpectralClustering for k = 2.

%% Clearing
clear all;
close all;
clc;

%% Import data
load dip_hw_2.mat

%% Settings
% Setting seed for for reproducibility 
rng(1)
metric = 1;
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

% Threshold values:
T1 = 5;
T2 = 0.2;  % Choosing this value with tria and error to force only one step
%% Image2Graph
W1 = Image2Graph(d2a);
W2 = Image2Graph(d2b);

%% Clustering with recursive n-cut / 1 step & Comparison with SC
% d2a
[label1,Ncut1,Level1] = myNCutsRecursive(W1,T1,T2);
rng(1)
labSC1 = mySpectralClustering(W1,2,metric);
% d2b
rng(1)
[label2,Ncut2,Level2] = myNCutsRecursive(W2,T1,T2);
labSC2 = mySpectralClustering(W2,2,metric);

%% Comparison on d2a
[M,N,~] = size(d2a);

figure

subplot(2,3,1)
imshow(d2a)
title('Original Image - d2a')

label1 = Lab2Im(label1,M,N);        % Reshape Flip Rotate
subplot(2,3,2)
imshow(label1)
title(['d2a/ Rec. N-Cuts / 1 Step / N-cut value:' num2str(Ncut1{1})])

labSC1 = Lab2Im(labSC1,M,N);        % Reshape Flip Rotate
subplot(2,3,3)
imshow(labSC1)
title('d2a / Spectral Clustering / k = 2')

%% Comparison on d2b

[M,N,~] = size(d2b);

subplot(2,3,4)
imshow(d2b)
title('Original Image')

label2 = Lab2Im(label2,M,N);        % Reshape Flip Rotate
subplot(2,3,5)
imshow(label2)
title(['d2b / Rec. N-Cuts / 1 / N-cut value:' num2str(Ncut2{1})])

labSC2 = Lab2Im(labSC2,M,N);        % Reshape Flip Rotate
subplot(2,3,6)
imshow(labSC2)
title('d2b / Spectral Clustering / k = 2')

%% -------------------------- End of demo3b.m -----------------------------