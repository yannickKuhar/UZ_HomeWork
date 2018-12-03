% a
I1 = rgb2gray(imread('graf/graf1_small.png'));
I2 = rgb2gray(imread('graf/graf2_small.png'));

I1 = double(I1);
I2 = double(I2);

[px1, py1] = hessian_points2(I1, 3, 50);
[px2, py2] = hessian_points2(I2, 3, 50);

H = estimate_homography(px1, py1, px2, py2)