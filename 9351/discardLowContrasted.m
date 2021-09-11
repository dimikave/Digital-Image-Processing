%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function [keypointsHighC,kpfiltCell] = discardLowContrasted(DoGs,keypoints ,keypointsCell,t, p)
%   discardLowContrasted  : Function to discard low contrasted keypoints
%
%   Inputs  :
%   1) DoGs      : Differences-of-Gaussians
%   2) keypoints : List of keypoints and their information of oct,scale,pos
%   3) t         : Threshold of rejection
%   4) p         : Percentage of "strictness"
%
%   Outputs :
%   1) keypointsHighC : High contrasted keypoints /filtered keypoints list
%
    keypointsHighC = [];
    kpfiltCell = cell(size(DoGs,2),size(DoGs{1},3));
    for i = 1:size(keypoints,1)
        kp = keypoints(i,:);
        if DoGs{kp(1)}(kp(3),kp(4),kp(2))>=t*p
            keypointsHighC = [keypointsHighC;keypoints(i,:)];
        end
    end
    
    for o = 1:length(DoGs)
        [N,M,levels] = size(DoGs{o});
        for s = 2:levels-1
            A = [];
            for i = 1:size(keypointsCell{o,s},1)
                if DoGs{o}(keypointsCell{o,s}(i,1),keypointsCell{o,s}(i,2),s)>=t*p
                    A = [A;keypointsCell{o,s}(i,1) keypointsCell{o,s}(i,2)];
                end
            end
            kpfiltCell(o,s) = {A};
        end
    end
end