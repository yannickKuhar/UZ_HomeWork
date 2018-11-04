A = imread('umbrellas.jpg');
B = imread('bird.jpg');

hist = myhist3(A, 8);

% (b)
hr = squeeze(sum(hist, 1));
hg = squeeze(sum(hist, 2));
hb = squeeze(sum(hist, 3));

% figure(1); clf; imshow(A);
% figure(2); clf; bar3(hr); title('Red'); colormap('jet'); 
% figure(3); clf; bar3(hg); title('Green'); colormap('jet'); 
% figure(4); clf; bar3(hb); title('Blue'); colormap('jet'); 

% (c) Skip for now

% (d)
hist1 = myhist3(A, 8);
hist2 = myhist3(B, 8);

% compare1 = compare_histograms(hist1, hist2, 'l2');
% compare2 = compare_histograms(hist1, hist2, 'chi2');
% compare3 = compare_histograms(hist1, hist2, 'hellinger');
% compare4 = compare_histograms(hist1, hist2, 'intersect');

% (e)
