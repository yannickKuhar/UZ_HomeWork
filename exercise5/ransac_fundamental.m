function [F, e1, e2, x1, x2] = ransac_fundamental(x1input, x2input, eps, k)
% Input:
% x1, x2 : 3xN matrix of N homogeneous points v 2D space
% eps : threshold for inliers
% k : number of iterations
% Output:
% F : 3x3 fundamental matrix: x2' * F * x1 = 0
% e1 : Epipol in image 1: F * e1 = 0
% e2 : Epipol in image 2: F' * e2 = 0
% x1, x2

n = length(x1input);

F = []; e1 = []; e2 = []; x1 = []; x2 = [];

for i = 1:k
    
    % select sub elements.
    x1idx = randperm(n, 8);
    x2idx = randperm(n, 8);
    
    x1sub = x1input(x1idx, :);
    x2sub = x2input(x2idx, :);
    
    % Get F, e1 and e2
    [Ft, et1, et2] = fundamental_matrix(x1sub, x2sub);
    
    % Get inliners.
    [x1in, x2in] = get_inliers(Ft, x1sub, x2sub, eps);
    
    if(length(x1in) > length(x1) && length(x2in) > length(x2))
        F = Ft;
        e1 = et1;
        e2 = et2;
        x1 = x1in;
        x2 = x2in;
    end
end