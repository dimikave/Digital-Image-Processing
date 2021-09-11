%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function myGFilter = my2DGaussianFilter(K,sigma)
% my2DGaussianFilter: Creates a 2D Gaussian Filter G, according to formula:
% G(x,y,sigma) = exp(-(x^2+y^2)/(2*sigma^2))/(2*pi*sigma^2)
% The mean value of the filter is (it is center around) (0,0). It is
% normalized -> [0,1].

% Inputs : 1) K         :        size of the kernel
%          2) sigma     :        standard deviation of the Gaussian filter
%
% Outputs: 1) myGFilter :        Gaussian Filter matrix
    
    myGFilter = zeros(K,K);
    sum1 = 0;
    for i=-(K-1)/2:(K-1)/2
        for j=-(K-1)/2:(K-1)/2
            x0=(K+1)/2; % center (to bring center to (0,0) )
            y0=(K+1)/2; % center (to bring center to (0,0) )
            x=i+x0;
            y=j+y0;
            myGFilter(y,x)=exp(-((x-x0)^2+(y-y0)^2)/(2*sigma^2))/(2*pi*sigma^2);
            sum1 = sum1 + myGFilter(y,x);   % Sum of elements to normalize
        end
    end
    % Normalizing -> [0,1]
    myGFilter = myGFilter/sum1;
end