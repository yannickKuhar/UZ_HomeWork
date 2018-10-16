%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (a) Manually set threshold, 96.875
% A = rgb2gray(imread('bird.jpg'));
% M = A > 51; % all elements with value > 150 are changed to 1, others are changed to 0
% figure;
% imagesc(M);
% imshow(M);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (c) Predefined Hist.

I = double(rgb2gray(imread('umbrellas.jpg')));
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

