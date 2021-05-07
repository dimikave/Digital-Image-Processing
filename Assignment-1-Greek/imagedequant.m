%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function x = imagedequant(q,w1,w2,w3)
%% Uses mydequant.m function to dequantize values of colors on an image
    x(:,:,1) = mydequant(q(:,:,1),w1);
    x(:,:,2) = mydequant(q(:,:,2),w2);
    x(:,:,3) = mydequant(q(:,:,3),w3);
end