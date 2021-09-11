%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% Implementation of SIFT (Scale Invarient Feature Extraction) DETECTOR
% 1. Space Scales and Difference-of-Gaussians (DoGs) calculation.
% 2. Salient Keypoints detection.
%   a) Filtering of salient keypoints

% Demo 1: Space Scales and Difference-of-Gaussians 
%% Clearing
clear all;
close all;
clc;

%% Clock
tic;        % For code evaluation
%% Initiallizing 
load dip_hw_3.mat
sigma = sqrt(2);
K = 7;
levels11 = 5;
octaves11 = 3;
levels12 = 3;
octaves12 = 7;


%% Images
% im1 = imread('lenna.jpg');
% im1 = im2double(im1);
% im1 = imresize(im1,0.5);
im1 = mountains;
% im1 = imresize(im1,4);
im2 = roofs;
% im2 = imresize(im1,4);

%% Experiment 1.1 - Image 1: Mountains
[ssm11,DoGsm11] = myDoGs2(im1,K,sigma,levels11,octaves11);
% Plots
scene = figure;
tam=get(0,'ScreenSize');
set(scene,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen
c = 1;

% Spacescales
for o = 1:octaves11
    for l = 1:levels11
        subplot(octaves11,levels11,c)
        imshow(ssm11{o}(:,:,l),[min(min(ssm11{o}(:,:,l))) max(max(ssm11{o}(:,:,l)))]);
        title(strcat("Octave ",num2str(o),", Scale ",num2str(l)))
        c = c+1;
    end
end

% DoGs
c = 1;
scene2 = figure;
tam=get(0,'ScreenSize');
set(scene2,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen
for o = 1:octaves11
    for l = 1:levels11-1
        subplot(octaves11,levels11-1,c)
        imshow(DoGsm11{o}(:,:,l),[min(min(DoGsm11{o}(:,:,l))) max(max(DoGsm11{o}(:,:,l)))]);
%         imshow(uint8(255*mat2gray(DoGsm11{o}(:,:,l))));
        title(strcat("Octave ",num2str(o),", DoG",num2str(o),num2str(l)))
        c = c+1;
    end
end

%% Experiment 1.1 - Image 2: Roofs
[ssr11,DoGsr11] = myDoGs2(im2,K,sigma,levels11,octaves11);

% Plots

% Spacescales
scene3 = figure;
tam=get(0,'ScreenSize');
set(scene3,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen

c = 1;
for o = 1:octaves11
    for l = 1:levels11
        subplot(octaves11,levels11,c)
        imshow(ssr11{o}(:,:,l),[min(min(ssr11{o}(:,:,l))) max(max(ssr11{o}(:,:,l)))]);
        title(strcat("Octave ",num2str(o),", Scale ",num2str(l)))
        c = c+1;
    end
end

% DoGs
scene4 = figure;
tam=get(0,'ScreenSize');
set(scene4,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen
c = 1;
for o = 1:octaves11
    for l = 1:levels11-1
        subplot(octaves11,levels11-1,c)
        imshow(DoGsr11{o}(:,:,l),[min(min(DoGsr11{o}(:,:,l))) max(max(DoGsr11{o}(:,:,l)))]);
        title(strcat("Octave ",num2str(o),", DoG",num2str(o),num2str(l)))
        c = c+1;
    end
end

%% Experiment 1.2 - Image 1: Mountains
[ssm12,DoGsm12] = myDoGs2(im1,K,sigma,levels12,octaves12);
% Plots
% Spacescales
scene5 = figure;
tam=get(0,'ScreenSize');
set(scene5,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen

c = 1;
for o = 1:octaves12
    for l = 1:levels12
        subplot(levels12,octaves12,c)
        imshow(ssm12{o}(:,:,l),[min(min(ssm12{o}(:,:,l))) max(max(ssm12{o}(:,:,l)))]);
        title(strcat("Octave ",num2str(o),", Scale ",num2str(l)))
        c = c+1;
    end
end

% DoGs
scene6 = figure;
tam=get(0,'ScreenSize');
set(scene6,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen
c = 1;
for o = 1:octaves12
    for l = 1:levels12-1
        subplot(levels12-1,octaves12,c)
        imshow(DoGsm12{o}(:,:,l),[min(min(DoGsm12{o}(:,:,l))) max(max(DoGsm12{o}(:,:,l)))]);
        title(strcat("Octave ",num2str(o),", DoG",num2str(o),num2str(l)))
        c = c+1;
    end
end

%% Experiment 1.2 - Image 2: Roofs
[ssr12,DoGsr12] = myDoGs2(im2,K,sigma,levels12,octaves12);
% Plots

% Spacescales
scene7 = figure;
tam=get(0,'ScreenSize');
set(scene7,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen

c = 1;
for o = 1:octaves12
    for l = 1:levels12
        subplot(levels12,octaves12,c)
        imshow(ssr12{o}(:,:,l),[min(min(ssr12{o}(:,:,l))) max(max(ssr12{o}(:,:,l)))]);
        title(strcat("Octave ",num2str(o),", Scale ",num2str(l)))
        c = c+1;
    end
end

% DoGs
scene8 = figure;
tam=get(0,'ScreenSize');
set(scene8,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen
c = 1;
for o = 1:octaves12
    for l = 1:levels12-1
        subplot(levels12-1,octaves12,c)
        imshow(DoGsr12{o}(:,:,l),[min(min(DoGsr12{o}(:,:,l))) max(max(DoGsr12{o}(:,:,l)))]);
        title(strcat("Octave ",num2str(o),", DoG",num2str(o),num2str(l)))
        c = c+1;
    end
end
toc;    % Stop clock
%% -------------------------- End of Demo 1 -------------------------------