% (3.a)
D = deskriptor_nabora(1);

% (3.b)
[mi, Ub] = get_eigenvectors(D);

% 96 * 84

I0 = (Ub(:, 1));
I1 = (Ub(:, 2));
I2 = (Ub(:, 3));
I3 = (Ub(:, 4));
I4 = (Ub(:, 5));

I0 = reshape(I0, [96, 84]);
I1 = reshape(I1, [96, 84]);
I2 = reshape(I2, [96, 84]);
I3 = reshape(I3, [96, 84]);
I4 = reshape(I4, [96, 84]);

% figure(1); subplot(1, 5, 1); imagesc(I0); colormap gray
% figure(1); subplot(1, 5, 2); imagesc(I1); colormap gray
% figure(1); subplot(1, 5, 3); imagesc(I2); colormap gray
% figure(1); subplot(1, 5, 4); imagesc(I3); colormap gray
% figure(1); subplot(1, 5, 5); imagesc(I4); colormap gray

%{ 
% TEST
y = [];
xq = [];

[h, w] = size(I0);

[mi, Ub] = get_eigenvectors(I0);

% (6.)
for i = 1:w
    y = [y, Ub' * (I0(:, i) - mi')];
end

% (7.)
for i = 1:w
    tmp =(Ub * y(:, i)) + mi';
    xq = [xq; tmp'];
end

xq = xq';

figure(2); imagesc(xq); colormap gray
%}

D0 = reshape(D(:, 1), [96, 84]);

tmp = D(:, 1);
tmp(4074) = 0;

% en pixel se spremeni v popolnoma crnega
D1 = reshape(tmp, [96, 84]);

D = deskriptor_nabora(1);
[mi, Ub] = get_eigenvectors(D);

D3 = D(:, 1);
D3 = double(D3);

y = [Ub' * (D3 - mi')];
y(1) = 0;
y(2) = 0;
y(3) = 0;
y(4) = 0;
y(5) = 0;

xq = (Ub * y) + mi';

D3 = reshape(D3, [96, 84]);

figure(2); subplot(1, 3, 1); imagesc(D0); colormap gray;
figure(2); subplot(1, 3, 2); imagesc(D1);
figure(2); subplot(1, 3, 3); imagesc(D3);


