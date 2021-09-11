%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function [spacescales , DoGs] = myDoGs2(img, K, sigma , levels , octaves)
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
    temp_img = img;
    s = sigmas(octaves,levels,sigma);
    [row,colum] = size(temp_img);


    % Calculation of Spacescales and Differences-of-Gaussians
    for o = 1:octaves
        [N,M] = size(temp_img);
        temp = zeros(N,M,levels);
        temp_DoGs = zeros(N,M,levels);
        for l = 1:levels
            
            scale=sigma*sqrt(2)^(1/levels)^((o-1)*levels+l);
%             filt=fspecial('gaussian',[1,floor(6*scale)],scale);
%             filt = filt'*filt;
            
            filt = my2DGaussianFilter2(K,scale);

            A1 = temp_img;
            if(o==1&&l==1)
                B1 = conv2(temp_img,filt,'same');
                temp(:,:,l) = B1;
                temp_DoGs(:,:,l)= B1-A1;
                A1 = B1;
            else
                B1 = conv2(temp_img,filt,'same');
                temp(:,:,l) = B1;
                temp_DoGs(:,:,l)= B1-A1;
                A1 = B1;
%                 if(l == levels)
%                     temp_img = A1;
%                 end
                if(l == 3)
                    A2 = A1;
                end
            end
        end
        temp_img = A2;
        spacescales(o) = {temp};
        DoGs(o) = {temp_DoGs};
        temp_img = imresize(temp_img,0.5);
    end
end
                
