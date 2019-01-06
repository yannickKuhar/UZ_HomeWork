P = load('points.txt');

[h, w] = size(P);

% (1.) Make x
X = P;

% (2.) calculate mi
mi = mean(X');

% (3.) Center data
Xd = X;
for i = 1:w
    Xd(:, i) = X(:, i) - mi';
end

m = h;

% (4.) Compute C
C = Xd' * Xd / (m - 1);

% (5.) compute SVD(C)
[U, S, V] = svd(C);

% (2.a)
Ubasis = Xd * U * ((m - 1) * S)^(-1/2);


% Xq1 =[0.5324 1.1824; 5.5402 3.1627; 5.3594 3.0912; 1.5583 1.5881; 0.0096 0.9756]';

U1 = [-0.9299 -0.3677; -0.3677    0.9299];

y = [];
xq = [];

% (6.)
for i = 1:w
    y = [y, U1' * (P(:, i) - mi')];
end

yhack = [];

for i = 1:w
    tmp = [y(:, i)', 0, 0, 0];
    tmp(1) = tmp(1) * -1;
    yhack = [yhack; tmp];
end

y = yhack';

% (7.)
for i = 1:w
    tmp =(Ubasis * y(:, i)) + mi';
    xq = [xq; tmp'];
end

xq = xq';


