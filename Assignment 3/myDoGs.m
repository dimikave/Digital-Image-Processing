%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function [spacescales , DoGs] = myDoGs(img, K, sigma , levels , octaves)
%   myDoGs: Function that calculates the spacescales and the differences of
%           gaussians for use in the sift algorithm.
%
%   Inputs: 1) img         :    Input Image
%           2) K           :    Gaussian Filter size (KxK)
%           3) sigma       :    Standard Deviation for the gaussian kernel
%           4) levels      :    Number of spacescales per octave
%           5) octaves     :    Number of octaves in the algorithm.
% 
%  Outputs: 1) spacescales :    Cell array containing NxMx(levels) arrays
%                               representing the spacescales of the image
%           2) DoGs        :    Cell array containing NxMx(levels-1) arrays
%                               representing the differences-of-gaussians
%                               of the image.


    % Initiallizing
    spacescales = cell(1,octaves);
    DoGs = cell(1,octaves);
%     aGaussianFilter = my2DGaussianFilter(K,sigma);
%     L1 = conv2(img,aGaussianFIlter,'same');
%     
    inputIm = img;
    s = sigmas(octaves,levels,sigma);
    % Gaussians
    for i = 1:octaves
        [N,M] = size(inputIm);
        temp = zeros(N,M,levels);
        for l = 1:levels
            filt = my2DGaussianFilter2(K,s(i,l));
            temp(:,:,l) = conv2(inputIm,filt,'same');
            inputIm = temp(:,:,l);
        end
        spacescales(i) = {temp};
%         inputIm = spacescales{i}(:,:,3);
        inputIm = img;
        inputIm = imresize(inputIm,0.5);        % Downsampling
%         inputIm = inputIm(2:2:end,2:2:end);
        img = inputIm;
    end
    
    % Differences-of-Gaussians
    for i = 1:octaves
        images = cell2mat(spacescales(i));
        [N,M,levels] = size(images);
        temp = zeros([N,M,levels-1]);
        for l = 1:levels-1
%             temp(:,:,l) = abs(images(:,:,l+1)-images(:,:,l));
        temp(:,:,l) = images(:,:,l+1)-images(:,:,l);
        end
        DoGs(i) = {temp};
    end
end