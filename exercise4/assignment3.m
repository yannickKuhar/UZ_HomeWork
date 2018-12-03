% a
I1 = rgb2gray(imread('graf/graf1_small.png'));
I2 = rgb2gray(imread('graf/graf2_small.png'));

I1 = double(I1);
I2 = double(I2);

[px1, py1] = hessian_points2(I1, 3, 50);
[px2, py2] = hessian_points2(I2, 3, 50);

H = estimate_homography(px1, py1, px2, py2);

% b
Ny1 = double(imread('newyork/newyork1.png'));
Ny2 = double(imread('newyork/newyork2.png'));
M = load('newyork/newyork.txt');

% M = find_matches(Ny1, Ny2);

% Rezultat prvega dela b.
% displaymatches(Ny1, M(:, 1), M(:, 2), Ny2, M(:, 3), M(:, 4));

HNy = estimate_homography(M(:, 1), M(:, 2), M(:, 3), M(:, 4));
HNy = HNy';
NyH = readtable('newyork/H.txt');
NyT = transform_homography(Ny1, HNy);

% Rezultat drugega dela b.
% figure(1); subplot(1, 3, 1); imagesc(uint8(Ny1)); colormap gray; title('Ny1');
% figure(1); subplot(1, 3, 2); imagesc(uint8(Ny2)); colormap gray; title('Ny2');
% figure(1); subplot(1, 3, 3); imagesc(uint8(NyT)); colormap gray; title('NyTransform from Ny1 to Ny2');

% c