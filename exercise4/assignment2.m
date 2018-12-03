% b => c
I1 = rgb2gray(imread('graf/graf1_small.png'));
I2 = rgb2gray(imread('graf/graf2_small.png'));

I1 = double(I1);
I2 = double(I2);

M = find_matches(I1, I2);

displaymatches(I1, M(:, 1), M(:, 2), I2, M(:, 3), M(:, 4));






