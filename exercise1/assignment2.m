%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (a) Manually set threshold, 96.875
% A = rgb2gray(imread('bird.jpg'));
% M = A > 51; % all elements with value > 150 are changed to 1, others are changed to 0
% figure;
% imagesc(M);
% imshow(M);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (c) Predefined Hist.
%{
I = imread('umbrellas.jpg');
I = double(I);
I = uint8((I(:,:,1) + I(:,:,2) + I(:,:,3)) / 3.0);
I = double(I);

P = I(:); % A handy way to turn 2D matrix into a vector of numbers

figure(1); clf;
bins = 10 ;
H = hist(P, bins);
subplot(1,3,1); bar(H, 'b');
bins = 20 ;
H = hist(P, bins);
subplot(1,3,2); bar(H, 'b');
bins = 40 ;
H = hist(P, bins);
subplot(1,3,3); bar(H, 'b');
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% (d) Visualise other images.
A = imread('bird.jpg');
B = imread('candy.jpg');
C = imread('eagle.jpg');

% Grayscale A, B and C.
A = double(A);
A = uint8((A(:,:,1) + A(:,:,2) + A(:,:,3)) / 3.0);
A = double(A);

B = double(B);
B = uint8((B(:,:,1) + B(:,:,2) + B(:,:,3)) / 3.0);
B = double(B);

C = double(C);
C = uint8((C(:,:,1) + C(:,:,2) + C(:,:,3)) / 3.0);
C = double(C);

% Create histograms.

nbins = 128;

h1 = hist(A, nbins);
h2 = hist(B, nbins);
h3 = hist(C, nbins);

myh1 = myhist(A, nbins);
myh2 = myhist(B, nbins);
myh3 = myhist(C, nbins);
%}
% figure(1); clf;
% subplot(2, 3, 1); bar(h1);
% subplot(2, 3, 2); bar(h2);
% subplot(2, 3, 3); bar(h3);
% subplot(2, 3, 4); bar(myh1);
% subplot(2, 3, 5); bar(myh2);
% subplot(2, 3, 6); bar(myh3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (e) My pictures.

%{
brez = imread('brez_senc.jpg');
notranji = imread('notranji_sencnik.jpg');
zunanji = imread('zunanji_sencnik.jpg');

brez = double(brez);
brez = uint8((brez(:,:,1) + brez(:,:,2) + brez(:,:,3)) / 3.0);
brez = double(brez);

notranji = double(notranji);
notranji = uint8((notranji(:,:,1) + notranji(:,:,2) + notranji(:,:,3)) / 3.0);
notranji = double(notranji);

zunanji = double(zunanji);
zunanji = uint8((zunanji(:,:,1) + zunanji(:,:,2) + zunanji(:,:,3)) / 3.0);
zunanji = double(zunanji);

nbins = 64;
nbins2 = 128;

h1 = myhist(brez, nbins);
h2 = myhist(notranji, nbins);
h3 = myhist(zunanji, nbins);

myh1 = myhist(brez, nbins2);
myh2 = myhist(notranji, nbins2);
myh3 = myhist(zunanji, nbins2);

figure(1); clf;
subplot(2, 3, 1); bar(h1);
subplot(2, 3, 2); bar(h2);
subplot(2, 3, 3); bar(h3);
subplot(2, 3, 4); bar(myh1);
subplot(2, 3, 5); bar(myh2);
subplot(2, 3, 6); bar(myh3);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (f)

A = rgb2gray(imread('bird.jpg'));
M = A > otsu(A); 
figure(1); clf;
imshow(M);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%