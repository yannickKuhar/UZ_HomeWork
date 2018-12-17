function [F, e1, e2, x1, x2] = ransac_fundamental(x1, x2, eps, k)
% Input:
% x1, x2 : 3xN matrix of N homogeneous points v 2D space
% eps : threshold for inliers
% k : number of iterations
% Output:
% F : 3x3 fundamental matrix: x2' * F * x1 = 0
% e1 : Epipol in image 1: F * e1 = 0
% e2 : Epipol in image 2: F' * e2 = 0
% x1, x2