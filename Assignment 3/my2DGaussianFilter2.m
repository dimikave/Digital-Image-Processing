%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function myGFilter = my2DGaussianFilter2(K, sigma)
% my2DGaussianFilter2: Creates a 2D Gaussian Filter G, according to formula:
% G(x,y,sigma) = exp(-(x^2+y^2)/(2*sigma^2))/(2*pi*sigma^2)
% The mean value of the filter is (it is center around) (0,0). It is
% normalized -> [0,1].

% Slightly different implementation than my2DGaussianFilter, that suddently
% leads to far better results.


% Inputs : 1) K         :        size of the kernel
%          2) sigma     :        standard deviation of the Gaussian filter
%
% Outputs: 1) myGFilter :        Gaussian Filter matrix

    center = (K + 1)/2;
    myGFilter = exp(-([1:K] - center).^2.0 / (2.0 * sigma^2.0)) / sqrt(2.0*pi*sigma^2.0);
    myGFilter = myGFilter' * myGFilter;
end