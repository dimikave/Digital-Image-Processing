%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function lab = Lab2Im(label,M,N)
% Helper function for transforming (Reshape-Flip-Rotate) the clustered
% indiced to form the new clustered image
    label = label/max(label);
    label = reshape(label,[M N]);
    lab = label';
end