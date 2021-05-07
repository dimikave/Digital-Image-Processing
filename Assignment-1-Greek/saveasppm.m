%% DIGITAL IMAGE PROCESSING 
% Assignment 1 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function saveasppm(x, filename, K)
%% Saves an image in the ppm format - .ppm file
    % Getting the dimensions
    [m n d] = size(x);
    % Open/Create file
    fileID = fopen(filename,'w');
    % Write header on the first lines
    fprintf(fileID,'P6\n%i %i\n%i\n',n,m,K-1);
    % Check how many bytes are required
    if K > 255          % 2 bytes
        for i = 1:m
            for j = 1:n
                % 2 bytes for each color, big-endian
                % Writing triplets of colors inthe file
                fwrite(fileID, x(i,j,1), 'uint16', 'ieee-be')
                fwrite(fileID, x(i,j,2), 'uint16', 'ieee-be')
                fwrite(fileID, x(i,j,3), 'uint16', 'ieee-be')
            end
        end
    else                % 1 byte
        for i = 1:size(x,1)
            for j = 1:size(x,2) 
                % Writing triplets of colors in the file
                fwrite(fileID, x(i,j,1),'uint8');
                fwrite(fileID, x(i,j,2),'uint8');
                fwrite(fileID, x(i,j,3),'uint8');
            end
        end
    end
    % Close file
    fclose(fileID);
end