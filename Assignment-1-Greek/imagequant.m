%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function q = imagequant(x,w1,w2,w3)
%% Uses myquant.m function to quantize values of colors on an image
    q(:,:,1) = myquant(x(:,:,1),w1);
    q(:,:,2) = myquant(x(:,:,2),w2);
    q(:,:,3) = myquant(x(:,:,3),w3);
end