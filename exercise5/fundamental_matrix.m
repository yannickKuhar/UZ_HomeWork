function [F, e1, e2] = fundamental_matrix(x1, x2)
% Input: x1, x2 : 3xN N homogeneous points in 2D
% Output:
% F : 3x3 fundamental matrix: x2' * F * x1 = 0
% e1 : epipol in the first image: F * e1 = 0
% e2 : epipol in the second image: F' * e2 = 0

A = [];

x1 = x1';
x2 = x2';

[nx1, T1] = normalize_points(x1); 
[nx2, T2] = normalize_points(x2);

nx1 = nx1';
nx2 = nx2';

for i = 1:length(nx1)
    A = [A; nx1(i, 1)*nx2(i, 1) nx1(i, 1)*nx2(i, 2) nx1(i, 1) nx1(i, 2)*nx2(i, 1) nx1(i, 2)*nx2(i, 2) nx1(i, 2) nx2(i, 1) nx2(i, 2) 1];
end
 
 [U, S, V] = svd(A);
 
 % Ac = U * S * V'
 
 [h, w] = size(V);
 
 F = V(:, w);
 F = reshape(F, 3, 3);
 
 F = T2' * F * T1;
 
 [Uf, Sf, Vf] = svd(F);
 
 e1 = [Vf(1,1) Vf(2,2) Vf(3,3)] / Vf(3,3);
 e2 = [Uf(1,1) Uf(2,2) Uf(3,3)] / Uf(3,3);
 
 