%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function [keypoints,keyPcell] = myKeypoints(DoGs)
%       myKeypoints: Function calculating the initial keypoints using DoGs
%
%       Inputs  : 1) DoGs      : Cell array with size NxMx(levels-1) 
%       
%       Outputs : 1) keypoints : Spoted keypoints (cell array (o,s,m,n) )
    
    keypoints = [];
    keyPcell = cell(size(DoGs,2),size(DoGs{1},3));
    oct = [];
    scal = [];
    xcord = [];
    ycord = [];
    c = 1;
    for o = 1:length(DoGs)
        [N,M,levels] = size(DoGs{o});
        for s = 2:levels-1
            X = [];
            Y = [];
            for x = 2:N-1
                for y = 2:M-1
                    if DoGs{o}(x,y,s) == min(min(min(DoGs{o}(x-1:x+1,y-1:y+1,s-1:s+1))))
%                     sub = DoGs{o}(x-1:x+1,y-1:y+1,s-1:s+1);
%                     if sub(2,2,2) > max([sub(1:13),sub(15:end)]) || sub(2,2,2) < min([sub(1:13),sub(15:end)])
                        oct = [oct;o];
                        scal = [scal;s];
                        xcord = [xcord;x];
                        ycord = [ycord;y];
                        X = [X;x];
                        Y = [Y;y];
                    elseif DoGs{o}(x,y,s) == max(max(max(DoGs{o}(x-1:x+1,y-1:y+1,s-1:s+1))))
                        oct = [oct;o];
                        scal = [scal;s];
                        xcord = [xcord;x];
                        ycord = [ycord;y];
                        X = [X;x];
                        Y = [Y;y];
                    end
                end
            end
            A = [X Y];
            keyPcell(o,s) = {A};
        end
    end
    keypoints = [oct scal xcord ycord];

end