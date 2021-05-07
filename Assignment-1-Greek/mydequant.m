%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function x = mydequant(q, w)
%% Mid Riser / Dequantizer
% https://en.wikipedia.org/wiki/Quantization_(signal_processing)
    x = w.*(q+1/2);
end