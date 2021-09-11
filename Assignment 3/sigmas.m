%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

%% Function to extract Sigma values
function s = sigmas(octave,scale,sigma)
% Function to calculate Sigma values for different Gaussians
    s = zeros(octave,scale);
    k = sqrt(2);
    for i=1:octave
        for j=1:scale
            s(i,j) = i*k^(j-1)*sigma;
        end
    end
end