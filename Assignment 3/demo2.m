%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

% Description:
% The topics of this assignment are:
% Implementation of SIFT (Scale Invarient Feature Extraction) DETECTOR
% 1. Space Scales and Difference-of-Gaussians (DoGs) calculation.
% 2. Salient Keypoints detection.
%   a) Filtering of salient keypoints

% Demo 2: Space Scales and Difference-of-Gaussians 
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
levels21 = 5;
octaves21 = 3;
nspo = levels21-2;
t = (2^(1/nspo)-1)*0.015/(2^(1/3)-1);
p = 0.8 ;

%% Image preparation
% Here we decide the image of the experiment as well as its pre processing.

%%%% List of test images %%%%
im1 = imread('lenna.jpg');             % Monaxh ths
% im1 = imread('cameraman.tif');         % Parea me to imresize(im1,2)
% im1 = imread('rice.png');              % Parea me to sharpen (2)
% im1 = mountains;                        % Parea me resize sharpen adjust
% im1 = roofs;                                % Parea me to sharpen(3)- high p
                                             % kai resize

% im1 = imread('coins.png');                                            
% Image resize test
% im1 = imresize(im1,2);
imor = im1;                             % Keeping the original image

im1 = im2double(im1);

% % Test with Sharpening the edges of the image first
im1 = imsharpen(im1,'Radius',6,'Amount',3);

% % % Increase the contrast
im1 = imadjust(im1);
% % 

% % Edge-Detector Filter
% h1 = [0 -1 0;-1 4 -1;0 -1 0];
% 
% % High-Pass Filtering
% im1 = conv2(h1,im1);
% 
% % % Test for sharpening after the HPF
% im1 = imsharpen(im1,'Radius',2,'Amount',3);

figure
imshow(im1)
title('Original Image')


%% Experiment 2.1
% DoGs
[ssm11,DoGsm11] = myDoGs2(im1,K,sigma,levels21,octaves21);
% Non-Filtered keypoints
[kpM,kpMCell] = myKeypoints(DoGsm11);
mx = max(kpM,[],1);         % Getting the maximum octave on which we have 
                            % keypoints

% Filtered keypoints
[kpMfilt,kpMfiltCell] = discardLowContrasted(DoGsm11,kpM,kpMCell , t, p);
                            
c = 1;  % Counter set
% Non filtered keypoints presentation
if mx ~= zeros(size(mx)) % Check if there are any keypoints.
    figure               % If there are keypoints show the DoG along with 
                         % Space Scale on witch the keypoints are spotted
    suptitle('Non Filtered Keypoints')
    for o = 1:mx(1)
        for s = 2:mx(2)
            subplot(mx(1),mx(2)-1,c)
            % Show the image
            imshow(DoGsm11{o}(:,:,s),[min(min(DoGsm11{o}(:,:,s))) max(max(DoGsm11{o}(:,:,s)))]);
            hold on
            % Plot Keypoints
            if (kpMCell{o,s} ~= zeros(size(kpMCell{o,s})))
                plot(kpMCell{o,s}(:,2),kpMCell{o,s}(:,1),'r+')
            end
            hold off
            c = c+1;
            title(['Octave ',num2str(o),' Scale ',num2str(s)])
        end
    end
else
    fprintf("No Keypoints Found\n")
end

c = 1; % Reset counter
% Filtered keypoints presentation
if mx ~= zeros(size(mx)) % Check if there are any keypoints.
    figure               % If there are keypoints show the DoG along with 
                         % Space Scale on witch the keypoints are spotted
     suptitle('Filtered Keypoints')
     for o = 1:mx(1)
        for s = 2:mx(2)
            subplot(mx(1),mx(2)-1,c)
            % Show the image
            imshow(DoGsm11{o}(:,:,s),[min(min(DoGsm11{o}(:,:,s))) max(max(DoGsm11{o}(:,:,s)))]);
            hold on
            % Plot Keypoints
            if (kpMfiltCell{o,s} ~= zeros(size(kpMfiltCell{o,s})))
                plot(kpMfiltCell{o,s}(:,2),kpMfiltCell{o,s}(:,1),'bx')
            end
            hold off
            c = c+1;
            title(['Octave ',num2str(o),' Scale ',num2str(s)])
        end
    end
else
    fprintf("No Keypoints Found\n")
end

%% Print filtered keypoints from the first (and most important)
%% octave in the original image
figure;
imshow(imor)
hold on
for s = 2:levels21-1
    plot(kpMfiltCell{1,s}(:,2),kpMfiltCell{1,s}(:,1),'gx')
end
title('Filtered keypoints on the original image')
hold off

%% ---------------------------- End of Demo 2 -----------------------------