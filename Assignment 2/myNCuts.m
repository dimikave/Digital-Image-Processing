%% DIGITAL IMAGE PROCESSING - Aristotle University of Thessaloniki
% Assignment 2 - Summer Semester 2020/2021
% Kavelidis Frantzis Dimitrios - AEM 9351 - kavelids@ece.auth.gr - ECE AUTH

function clusterIdx = myNCuts(anAffinityMat,k)
    % It segments the input graph using the non recursive
    % N-cuts method and returns the labels of the pixels for each cluster.

    % 
    % Implementation of N-cuts Method:
    % 1. Getting Affinity Matrix
    % 2. Given the Affinity Matrix, calculate the Laplacian Matrix L = D-W
    % 3. Generalized problem of k smallest eigenvalues/eigenvectors
    % 4. Creating U matrix with eigenvectors as columns.
    % 5. Grouping with k-means algorithm
    
    % Inputs:
    % 1) anAffinityMat : The Aff. Matrix desctribing the graph of the image
    % 2) k             : k-means parameter / Number of clusters forming
    
    % Outputs
    % 1) clusterIdx    : label showing on which cluster each node belongs
     
    % Clock for code evaluation
    tic;                                            % Start Clock
    
    % 2. Laplacian
    degs = sum(anAffinityMat,2);              % Vector with sum of each row
    D = sparse(1:size(anAffinityMat, 1), 1:size(anAffinityMat, 2), degs);
    
    % ^^^ Same as:
%     len = size(anAffinityMat,1);
%     D = zeros(len);                                 % Metric 1 of report
%     for i=1:len                                     %
%         D(i,i) = sum(anAffinityMat(i,:));           %
%     end  
    
    L = D - anAffinityMat;

    % 3-4. Generalized problem of k smallest eigenvalues/eigenvectors
    diff = eps;
    [U,~] = eigs(L,D,k,diff);                          
    
    % 5. Grouping with k-means algorithm
    clusterIdx = kmeans(U,k);
    
    fprintf(['Time for myNCuts to run with k = ' num2str(k) ' : '])
    toc;                                            % Stop Clock
end