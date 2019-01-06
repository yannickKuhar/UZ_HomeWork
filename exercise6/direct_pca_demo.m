function direct_pca_demo()
 
figure(1); clf;
P = load('points.txt') ;

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

% (4.) calculate C matrix
C = (Xd * Xd') / (w - 1);

% (5.) compute SVD(C)
[U,S, V] = svd(C);

subplot(1,2,1);
plot(P(1,:),P(2,:),'+'); hold on;
for i = 1 : size(P,2)
   text( P(1,i)-0.5, P(2,i), num2str(i)); 
end
xlabel('x_1'); ylabel('x_2');
xlim([-10 10]);
ylim([-10 10]);

% (1.a)
draw_gauss2d(mi', C, 'r', 1);

plot(3,6,'xb')

% (1.b)
ev1 = U(:, 1) .* S(1, 1);
ev2 = U(:, 2) .* S(2, 2);

plot([mi(1), ev1(1) + mi(1)], [mi(2), ev1(2) + mi(2)], 'red');
plot([mi(1), ev2(1) + mi(1)], [mi(2), ev2(2) + mi(2)], 'green');
% plot(mi, ev2 + mi', 'green');

% (1.c)

maxeval = max(S(1, 1), S(2, 2));
% evals = [S(1, 1) / maxeval, S(2, 2) / maxeval]

evals = cumsum(S) / max(S(:));

procent_variance = 1 - evals(2, 2);

% figure(2); clf; plot(evals(:));

% (1.d)
% S(2, 2) = 0;
U(:, 2) = 0;
newC = U * S * V';

[Un, Sn, Vn] = svd(newC);

y = [];
xq = [];

% (6.)
for i = 1:w
    y = [y, U' * (P(:, i) - mi')];
end

% (7.)
for i = 1:w
    tmp =(Un * y(:, i)) + mi';
    xq = [xq; tmp'];
end

xq = xq';

subplot(1,2,2);

% (1.e)
q = [3, 6]';

closest = [];
cdist = 1000;
cidx = 1000;

for i = 1:w
    
    tmp = P(:, i);
    
    dist = sqrt( (tmp(1) - q(1))^2 + (tmp(2) - q(2))^2 );
    
    if(dist < cdist)
       closest = tmp;
       cdist = dist;
       cidx = i;
    end
end

cidx

yq = U' * (q - mi');
yq = (Un * yq) + mi'

closest2 = [];
cdist2 = 1000;
cidx2 = 1000;

for i = 1:w
    
    tmp = y(:, i);
    
    dist = sqrt( (tmp(1) - yq(1))^2 + (tmp(2) - yq(2))^2 );
    
    if(dist < cdist2)
       closest2 = tmp;
       cdist2 = dist;
       cidx2 = i;
    end
end
cidx2

draw_reconstructions(P, xq)
