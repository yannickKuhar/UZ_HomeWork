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

% Rezultat prvega dela b.
% displaymatches(Ny1, M(:, 1), M(:, 2), Ny2, M(:, 3), M(:, 4));

HNy = estimate_homography(M(:, 1), M(:, 2), M(:, 3), M(:, 4));
HNy = HNy';
% NyH = load('newyork/H.txt');
NyT = transform_homography(Ny1, HNy);

% Rezultat drugega dela b.
% figure(1); subplot(1, 3, 1); imagesc(uint8(Ny1)); colormap gray; title('Ny1');
% figure(1); subplot(1, 3, 2); imagesc(uint8(Ny2)); colormap gray; title('Ny2');
% figure(1); subplot(1, 3, 3); imagesc(uint8(NyT)); colormap gray; title('Transform from Ny1 to Ny2');

% c
MyM = find_matches(I1, I1);

% Sort array and select top 10.
MyMsorted = sort(MyM);
[h, w] = size(MyMsorted);
Best = MyMsorted(h - 10:h, :);

displaymatches(I1, Best(:, 1), Best(:, 2), I2, Best(:, 3), Best(:, 4));
MyH = estimate_homography(Best(:, 1), Best(:, 2), Best(:, 3), Best(:, 4));
MyH = MyH';
% NyH = load('newyork/H.txt');
IT = transform_homography(I1, MyH);

% figure(1); subplot(1, 3, 1); imagesc(uint8(I1)); colormap gray; title('I1');
% figure(1); subplot(1, 3, 2); imagesc(uint8(I2)); colormap gray; title('I2');
% figure(1); subplot(1, 3, 3); imagesc(uint8(IT)); colormap gray; title('Transform from I1 to I2');