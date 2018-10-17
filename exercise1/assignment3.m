%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (a) Erode and Dialate.

% 0 ~ temno
% 1 ~ svetlo

% M = logical(imread('mask.png')); % Load a synthetic mask
SE = ones(5); % 3x3 structuring element (also try out different sizes and shapes)
%{
figure;
subplot(1, 4, 1);
imagesc(imerode(M, SE)); axis equal; axis tight; title('Erode');
subplot(1, 4, 2);
imagesc(imdilate(M, SE)); axis equal; axis tight; title('Dilate');
subplot(1, 4, 3);
imagesc(imerode(imdilate(M, SE), SE)); axis equal; axis tight; title('Dilate & Erode');
subplot(1, 4, 4);
imagesc(imdilate(imerode(M, SE), SE)); axis equal; axis tight; title('Erode & Dilate');
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (b)
%{
SE = ones(15);
A = rgb2gray(imread('bird.jpg'));
M = A > otsu(A);
figure(1); clf;
imshow(imerode(imdilate(M, SE), SE)); axis equal; axis tight; title('Dilate & Erode');
%}
% figure(1); clf;
% imshow(M);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (c) immask.m
%{
I = imread('bird.jpg');

figure(1); clf;
imshow(immask(A));
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% (d) Eagle.
I = imread('eagle.jpg');

M = double(rgb2gray(I));
SE = ones(10);

M = M < otsu(M);
M = imerode(imdilate(M, SE), SE);

figure(7); clf;
imshow(immask(I, M));
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (e)

I = imread('coins.jpg'); % Load a synthetic mask
% Compute mask M

M = double(rgb2gray(I));

SE = ones(20);

M = M < otsu(M);
M = imerode(imdilate(M, SE), SE);

L = bwlabel(M); % Use connected components algorithm to label all components
label_max = max(L(:)); % A trick to get all values present in matrix L
for i = 1:label_max
    if sum(L(:) == i) > 700 % Only process labels that have more than 700 pixels
        L(L == i) = 0;
    end;
end;
subplot(1, 2, 1);
imshow(I); title('Original');
subplot(1, 2, 2);
imshow(immask(I, L > 0)); title('Processed'); % Display the result (if you have not written immask?-
% function then simply display the mask)
colormap gray;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%