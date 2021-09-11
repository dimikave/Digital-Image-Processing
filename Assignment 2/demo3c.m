%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% 1. Representation of Images as graphs
% 2. Image segmentation using Spectral Clustering
% 3. Image segmetentation using Normalized-cuts

%% Demo 3c - Recursive n-cut demonstration and comparison of all methods.
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

% Threshold values:
T1 = 5;
T2 = 0.2;  % Choosing this value with tria and error to force only one step
T3 = 5;
T4 = 0.95;
%% Image2Graph
W1 = Image2Graph(d2a);
W2 = Image2Graph(d2b);

%% Clustering with different methods, k = 2
% d2a
labSCa2_1 = mySpectralClustering(W1,2,1);      % SC , k = 2, metric 1
labSCa3_1 = mySpectralClustering(W1,3,1);      % SC , k = 3, metric 1

labSCa2_2 = mySpectralClustering(W1,2,2);      % SC , k = 2, metric 2
labSCa3_2 = mySpectralClustering(W1,3,2);      % SC , k = 3, metric 2

labNRNCa2 = myNCuts(W1,2);                     % Non Recursive NCuts, k = 2
labNRNCa3 = myNCuts(W1,3);                     % Non Recursive NCuts, k = 3

[labRNC1a,Ncut1a,Level1a] = myNCutsRecursive(W1,T1,T2); % Recursive Ncuts
[labRNC2a,Ncut2a,Level2a] = myNCutsRecursive(W1,T3,T4); % Recursive Ncuts


% d2b

labSCb2_1 = mySpectralClustering(W2,2,1);      % SC , k = 2, metric 1
labSCb3_1 = mySpectralClustering(W2,3,1);      % SC , k = 3, metric 1
labSCb4_1 = mySpectralClustering(W2,4,1);      % SC , k = 4, metric 1

labSCb2_2 = mySpectralClustering(W2,2,2);      % SC , k = 2, metric 2
labSCb3_2 = mySpectralClustering(W2,3,2);      % SC , k = 3, metric 2
labSCb4_2 = mySpectralClustering(W2,4,2);      % SC , k = 4, metric 2

labNRNCb2 = myNCuts(W2,2);                     % Non Recursive NCuts, k = 2
labNRNCb3 = myNCuts(W2,3);                     % Non Recursive NCuts, k = 3
labNRNCb4 = myNCuts(W2,3);                     % Non Recursive NCuts, k = 4

[labRNC1b,Ncut1b,Level1b] = myNCutsRecursive(W2,T1,T2);
[labRNC2b,Ncut2b,Level2b] = myNCutsRecursive(W2,T3,T4);


%% Comparison on d2a
[M,N,~] = size(d2a);

figure

% Original Image
subplot(331); imshow(d2a); title('Original Image - d2a');

% Spectral Clustering / k = 2 / Metric 1
labSCa2_1 = Lab2Im(labSCa2_1,M,N);
subplot(332);imshow(labSCa2_1);
title('SC / k = 2 / Metric 1')

% Spectral Clustering / k = 3 / Metric 1
labSCa3_1 = Lab2Im(labSCa3_1,M,N);
subplot(333);imshow(labSCa3_1);
title('SC / k = 3 / Metric 1')

% Recursive N-cuts , T1 T2
labRNC1a = Lab2Im(labRNC1a,M,N);
subplot(334);imshow(labRNC1a);
title(['Rec. N-cuts / T1 = ' num2str(T1) ' , T2 = ' num2str(T2) ' / N-cut value:' num2str(Ncut1a{1})])

% Spectral Clustering / k = 2 / Metric 2
labSCa2_2 = Lab2Im(labSCa2_2,M,N);
subplot(335);imshow(labSCa2_2);
title('SC / k = 2 / Metric 2')

% Spectral Clustering / k = 3 / Metric 2
labSCa3_2 = Lab2Im(labSCa3_2,M,N);
subplot(336);imshow(labSCa3_2);
title('SC / k = 3 / Metric 2')

% Recursive N-cuts , T3 T4
labRNC2a = Lab2Im(labRNC2a,M,N);
subplot(337);imshow(labRNC2a);
title(['Rec. N-cuts / T1 = ' num2str(T3) ' , T2 = ' num2str(T4) ' / N-cut value:' num2str(Ncut2a{1})])

% Non Recursive N-Cuts , k = 2
labNRNCa2 = Lab2Im(labNRNCa2,M,N);
subplot(338);imshow(labNRNCa2);
title('Non Recursive N-cuts / k = 2')

% Non Recursive N-Cuts , k = 3
labNRNCa3 = Lab2Im(labNRNCa3,M,N);
subplot(339);imshow(labNRNCa3);
title('Non Recursive N-cuts / k = 3')

%% Comparison on d2b
[M,N,~] = size(d2b);

figure

% Original Image
subplot(341); imshow(d2b); title('Original Image - d2b');

% Spectral Clustering / k = 2 / Metric 1
labSCb2_1 = Lab2Im(labSCb2_1,M,N);
subplot(342);imshow(labSCb2_1);
title('SC / k = 2 / Metric 1')

% Spectral Clustering / k = 3 / Metric 1
labSCb3_1 = Lab2Im(labSCb3_1,M,N);
subplot(343);imshow(labSCb3_1);
title('SC / k = 3 / Metric 1')

% Spectral Clustering / k = 3 / Metric 1
labSCb4_1 = Lab2Im(labSCb4_1,M,N);
subplot(344);imshow(labSCb4_1);
title('SC / k = 4 / Metric 1')

% Recursive N-cuts , T1 T2
labRNC1b = Lab2Im(labRNC1b,M,N);
subplot(345);imshow(labRNC1b);
title(['Rec. N-cuts / T1 = ' num2str(T1) ' , T2 = ' num2str(T2) ' / N-cut value:' num2str(Ncut1b{1})])

% Spectral Clustering / k = 2 / Metric 2
labSCb2_2 = Lab2Im(labSCb2_2,M,N);
subplot(346);imshow(labSCb2_2);
title('SC / k = 2 / Metric 2')

% Spectral Clustering / k = 3 / Metric 2
labSCb3_2 = Lab2Im(labSCb3_2,M,N);
subplot(347);imshow(labSCb3_2);
title('SC / k = 3 / Metric 2')

% Spectral Clustering / k = 4 / Metric 2
labSCb4_2 = Lab2Im(labSCb4_2,M,N);
subplot(348);imshow(labSCb4_2);
title('SC / k = 4 / Metric 2')

% Recursive N-cuts , T3 T4
labRNC2b = Lab2Im(labRNC2b,M,N);
subplot(349);imshow(labRNC2b);
title(['Rec. N-cuts / T1 = ' num2str(T3) ' , T2 = ' num2str(T4) ' / N-cut value:' num2str(Ncut2b{1})])

% Non Recursive N-Cuts , k = 2
labNRNCb2 = Lab2Im(labNRNCb2,M,N);
subplot(3,4,10);imshow(labNRNCb2);
title('Non Recursive N-cuts / k = 2')

% Non Recursive N-Cuts , k = 3
labNRNCb3 = Lab2Im(labNRNCb3,M,N);
subplot(3,4,11);imshow(labNRNCb3);
title('Non Recursive N-cuts / k = 3')

% Non Recursive N-Cuts , k = 4
labNRNCb4 = Lab2Im(labNRNCb4,M,N);
subplot(3,4,12);imshow(labNRNCb4);
title('Non Recursive N-cuts / k = 4')

%% Displaying Tree Leaves for Recursive N-Cuts
fprintf('Tree of recursion for d2a - T1 = 5, T2 = 0.2: ')
Level1a
fprintf('Tree of recursion for d2a - T1 = 5, T2 = 0.95: ')
Level2a
fprintf('Tree of recursion for d2b - T1 = 5, T2 = 0.2: ')
Level1b
fprintf('Tree of recursion for d2b - T1 = 5, T2 = 0.95: ')
Level2b
%% -------------------------- End of demo3c.m -----------------------------