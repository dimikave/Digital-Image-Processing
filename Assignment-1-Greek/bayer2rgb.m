%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function xrgb = bayer2rgb(xb)
%% RGB Image reconstruction from Bayer Pattern encoded image. 
% where xb is a M*N matrix with bayer values
% and returns an image xrgb of dimension (M,N,3) in rgb 
BayerIm = xb;
% Create CFA filter for each colour in GBRG alignment
Rcfa = repmat([0 0;1 0],size(BayerIm)/2);
Gcfa = repmat([1 0;0 1],size(BayerIm)/2);
Bcfa = repmat([0 1;0 0],size(BayerIm)/2);
% Split values of original image into 'hat' color channel variables
Rh = BayerIm.*Rcfa;
Gh = BayerIm.*Gcfa;
Bh = BayerIm.*Bcfa;

% Now we want to interpolate the rest of the unknown pixels 
% by calculating average of neighbors

% Applying convolution / Bilinear Interpolation kernels
kernelR = [1 2 1;2 4 2;1 2 1]/4
kernelG = [0 1 0;1 4 1;0 1 0]/4
kernelB = [1 2 1;2 4 2;1 2 1]/4
R = conv2(Rh,kernelR,'same');
G = conv2(Gh,kernelG,'same');
B = conv2(Bh,kernelB,'same');

% Copying the 2 level inner perimeter to deal with artifacts
% while keeping the bayer pattern.
% Red Matrix Perimeter Handling
R(1,:) = R(3,:);
R(:,1) = R(:,3);
R(end,:) = R(end-2,:);
R(:,end) = R(:,end-2);
% Green Matrix Perimeter Handling
G(1,1:end-1) = G(2,2:end);
G(1:end-1,1) = G(2:end,2);
G(end,1:end-1) = G(end-1,2:end);
G(1:end-1,end) = G(2:end,end-1);
% Blue Matrix Perimeter Handling
B(1,:) = B(3,:);
B(:,1) = B(:,3);
B(end,:) = B(end-2,:);
B(:,end) = B(:,end-2);

% RGB Image
xrgb(:,:,1)=R; xrgb(:,:,2)=G; xrgb(:,:,3)=B;
end