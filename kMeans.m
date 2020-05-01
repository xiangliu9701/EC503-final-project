function [M, obj, iterations] = kMeans(X, k, T)
    % Run kmeans on n-dim feature array, features. Assumes each row is a
    % point and each column is a dimension.
    % Returns an n-by-1 vector containing cluster labels for each point.
    
    % get starting means/centroids by guessing with initMeans:
    means = initMeans(X, k);
    iterations = 0;
    oldMeans = [];
    obj = zeros(T, 1);
    
    while not(stopNow(means, oldMeans, iterations, T))
        oldMeans = means;
        
        iterations = iterations + 1;
        
        M = getLabels(X, k, means);
        
        means = getMeans(X, k, M);
        
        loss = computeObjectiveFunc(X, k, means, M);
        %disp('Value of objective function')
        %disp(loss)
        obj(iterations) = loss;
    end
    %obj = obj(iterations);
end
function means = initMeans(features, k)
    %initializes starting points by randomly selecting from data
    means = zeros(k,size(features,2)); 
    randIds = randperm(size(features,1));
    means = features(randIds(1:k), :);
end

function boolean = stopNow(means, oldMeans, iterations, maxIterations)
    if isequal(means, oldMeans)
        boolean = true;
    else
        boolean = iterations > maxIterations;
    end
end

function distance = getEucDist(v1, v2)
    distance = sqrt(sum((v1 - v2).^ 2));
end


function labels = getLabels(features, k, means)
    % gets labels for kmeans. Assumes features is a matrix with
    % observations as rows
    
    labels = zeros(size(features, 1), 1);
    
    % loop through all observations:
    for i = 1:size(features, 1)
        p = features(i, :);
        minDist = Inf;
        % for each observation, find closest centroid:
        ks = 1:k;
        for k_i = ks
            % compute distance from p to k:
            dist_k = getEucDist(p, means(k_i, :));
            if dist_k < minDist
                label = k_i;
                minDist = dist_k;
            end
        end
        labels(i) = label;
    end
end

%function distance = getEucDist(v1, v2)
    %distance = sqrt(sum((v1 - v2).^ 2));
%end

function means = getMeans(features, k, labels)
    % gets means/centroid for kmeans
    means = zeros(k, size(features, 2));
    for k_i = 1:k
        means(k_i, :) = double(sum(features(labels == k_i,:)))/double(sum(labels == k_i));
        %length(find(labels == k_i));
    end
end

function loss = computeObjectiveFunc(features, k, means, labels)
    % computes loss for kmeans
    loss = 0;
    for k_i = 1:k
        loss_k = sum((pdist2(features(labels == k_i, :), means(k_i,:))).^2.0);
        loss = loss + loss_k;
    end
end




% Utility function to swap columns in a matrix
function A = swapcols(A,i,j)
    assert( i > 0 && i < size(A,2) && j > 0 && j < size(A,2) );
    A(:,[i j]) = A(:,[j i]);
end

