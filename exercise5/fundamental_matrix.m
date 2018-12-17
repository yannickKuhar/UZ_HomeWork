function [F, e1, e2] = fundamental_matrix(x1, x2)
% Input: x1, x2 : 3xN N homogeneous points in 2D
% Output:
% F : 3x3 fundamental matrix: x2' * F * x1 = 0
% e1 : epipol in the first image: F * e1 = 0
% e2 : epipol in the second image: F' * e2 = 0

x1 = x1';
x2 = x2';

[nx1, T1] = normalize_points(x1); 
[nx2, T2] = normalize_points(x2);

N = length(nx1);
A = zeros(N, 9);

for i = 1:N
    
    un = nx1(1, i);
    vn = nx1(2, i);
    
    unc = nx2(1, i);
    vnc = nx2(2, i);
    
    A(i, 1) = un * unc;
    A(i, 2) = un * vnc;
    A(i, 3) = un;
    A(i, 4) = vn * unc;
    A(i, 5) = vn * vnc;
    A(i, 6) = vn;
    A(i, 7) = unc;
    A(i, 8) = vnc;
    A(i, 9) = 1;
end
 
[U, S, V] = svd(A);
 
% Ac = U * S * V'
% [h, w] = size(V);
 
Fs = V(:, 9);
Fs = reshape(Fs, 3, 3);

[Us, Ss, Vs] = svd(Fs);
Ss(3, 3) = 0;

Fs = Us * Ss * Vs';

F = T2' * Fs * T1;
 
[Uf, Sf, Vf] = svd(F);
 
e1 = [Vf(1,1) Vf(2,2) Vf(3,3)] / Vf(3,3);
e2 = [Uf(1,1) Uf(2,2) Uf(3,3)] / Uf(3,3);
 