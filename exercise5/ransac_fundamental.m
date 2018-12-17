function [F, e1, e2, x1in, x2in] = ransac_fundamental(x1input, x2input, eps, k, len)
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

for i = 1:k
     idx = randperm(n, 8);
    
    % select sub elements.
   
    x1sub = x1input(idx, :);
    x2sub = x2input(idx, :);
    
    % Get F, e1 and e2
    [F, e1, e2] = fundamental_matrix(x1sub, x2sub);
    
    % Get inliners.
    [x1in, x2in] = get_inliers(F, x1input, x2input, eps);
    
    if(length(x1in) >= len)
        [F, e1, e2] = fundamental_matrix(x1in, x2in);
        return
    end
end