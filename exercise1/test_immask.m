%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (c) Test immask.

I = imread('bird.jpg');

M = rgb2gray(I);
SE = ones(20);

M = M > otsu(M);
M = imerode(imdilate(M, SE), SE);

figure(2); clf; imshow(immask(I, M));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%