%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function q = myquant(x, w)
%% Mid Riser / Quantizer
% https://en.wikipedia.org/wiki/Quantization_(signal_processing)
    q = floor(x./w);
end