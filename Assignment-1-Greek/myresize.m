%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function xrgbres = myresize(xrgb, N, M, method)
%% (re)Scales an image 
% xrgb    - the input image
% N       - new x-dimension
% M       - new y-dimension
% Method  - interpolation method used
    switch method
  %% Nearest Neighbor Interpolation
        case 'nearest'
            tic             % Start clock - Measure time for the method
            % Ratio : New size / Old size
            rtX = N/size(xrgb,1);           % Ratio of rows
            rtY = M/size(xrgb,2);           % Ratio of cols
            % Interpolation indexes
            IR = ceil([1:(size(xrgb,1)*rtX)]./(rtX));
            IC = ceil([1:(size(xrgb,2)*rtY)]./(rtY));

            % Red channel
            r = xrgb(:,:,1);
            % Interpolation of rows
            R = r(IR,:);
            % Interpolation of columns
            R = R(:,IC);

            % Green Channel
            g = xrgb(:,:,2);
            % Interpolation of rows
            G = g(IR,:);
            % Interpolation of columns
            G = G(:,IC);


            % Blue Channel
            b = xrgb(:,:,3);
            % Interpolation of rows
            B = b(IR,:);
            % Interpolation of columns
            B = B(:,IC);

            xrgbres = zeros([N,M,3]);
            xrgbres(:,:,1) = R;
            xrgbres(:,:,2) = G;
            xrgbres(:,:,3) = B;
            toc                             % Stop clock
%% Bilinear Intepolation
        case 'linear'
            tic            % Start clock - Measure time for the method
            % Ratio : New size / Old size
            rtX = N/size(xrgb,1);               % Ratio of rows
            rtY = M/size(xrgb,2);               % Ratio of cols
            [row, col, color] = size(xrgb);
            row = round(rtX * row);             % New no. of rows
            col = round(rtY * col);             % New no. of cols

            % Scaled Image
            xrgbres = zeros(row, col, color, class(xrgb));
            % https://en.wikipedia.org/wiki/Bilinear_interpolation
            for i = 1 : row
                for j = 1 : col
                    x = i / rtX;
                    y = j / rtY;
                    x1 = ceil(x);          
                    y1 = ceil(y);
                    x2 = ceil(x) + 1;
                    y2 = ceil(y) + 1;
                    % Dealing with the edges
                    if x2 >= size(xrgb, 1)           
                        x2 = x2 - 1;
                    end
                    if y2 >= size(xrgb, 2)
                        y2 = y2 - 1;
                    end
                    du = (x+1) - x1;
                    dv = (y+1) - y1;
                    % Formula for square of pixels
                    xrgbres(i, j, :) = (1-du)*(1-dv)*xrgb(x1, y1, :) + (1-du)*dv*xrgb(x1, y2, :) + du*(1-dv)*xrgb(x2, y1, :) + du*dv*xrgb(x2, y2, :);
                end
            end
            toc                          % Stop clock
    end
end

