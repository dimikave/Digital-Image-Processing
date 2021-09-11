%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function [Nodes,Ncut,Level] = PartitionNCuts(nodes,anAffinityMat,T1,T2,level)
    % Helper function - Implementation of the myNCutsRecursive Partition
    % Segments the input graph using T1,T2 thresholds.
    
    % Inputs:   
    % 1) nodes         : Indeces of clusters in the input graph
    % 2) anAffinityMat : The Aff. Matrix desctribing the graph of the image
    % 3,4) T1, T2      : Thresholds, values we use to control the recursion
    %                    T2 is for the ncut maximum value
    %                    T1 is for the minimum number of nodes to be
    %                    partitioned
    % 5) level         : variable to show how the graph was partitioned
    
    % Outputs
    % 1) nodes         : label showing on which cluster each node belongs
    % 2) ncut          : n-cut values of the cuts of the graph
    % 3) level         : variable to show how the graph was partitioned
     
    % Steps 1-5 of the non recursive version
    clusterIdx = myNCuts(anAffinityMat,2); % Initial partition - two clusters
    % Estimation of N-cut vaue
    ncut = calculateNcut(anAffinityMat,clusterIdx);   
    
    % Indeces of labels
    inA = find(clusterIdx == 1);
    inB = find(clusterIdx == 2);               
    
    % Number of nodes 
    nA = length(inA);
    nB = length(inB);
    
    % Checking thresholds to continue or stop the algorithm
    if (ncut > T2 || nA < T1 || nB < T1)
        Nodes{1} = nodes;
        Level{1} = level;
        Ncut{1} = ncut;
        return
    end
    
    % If the function reaches this point, it moves on to next partition
    
    % Child A partition
    [nodesA, ncutA, levelA] = PartitionNCuts(nodes(inA),anAffinityMat(inA,inA),T1,T2,[level '-A']);
    
    % Child B partition
    [nodesB, ncutB, levelB] = PartitionNCuts(nodes(inB),anAffinityMat(inB,inB),T1,T2,[level '-B']);
    
    % Merge
    Nodes = [nodesA nodesB];
    Level = [levelA levelB];
    Ncut = [ncutA ncutB];
end
        