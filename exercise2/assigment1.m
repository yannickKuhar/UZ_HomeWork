
% A = imread('umbrellas.jpg');
% B = imread('bird.jpg');

% hist = myhist3(A, 8);

% (b)
% hr = squeeze(sum(hist, 1));
% hg = squeeze(sum(hist, 2));
% hb = squeeze(sum(hist, 3));

% figure(1); clf; imshow(A);
% figure(2); clf; bar3(hr); title('Red'); colormap('jet'); 
% figure(3); clf; bar3(hg); title('Green'); colormap('jet'); 
% figure(4); clf; bar3(hb); title('Blue'); colormap('jet'); 

% (c) Skip for now

% (d)
% hist1 = myhist3(A, 8);
% hist2 = myhist3(B, 8);

% compare1 = compare_histograms(hist1, hist2, 'l2');
% compare2 = compare_histograms(hist1, hist2, 'chi2');
% compare3 = compare_histograms(hist1, hist2, 'hellinger');
% compare4 = compare_histograms(hist1, hist2, 'intersect');

% (e)
A = imread('images/object_01_1.png');
B = imread('images/object_02_1.png');
C = imread('images/object_03_1.png');

histA = myhist3(A, 8);
histB = myhist3(B, 8);
histC = myhist3(C, 8);

histA1d = reshape(histA, 1, numel(histA));
histB1d = reshape(histB, 1, numel(histB));
histC1d = reshape(histC, 1, numel(histC));

dist1in1 = compare_histograms( histA1d, histA1d, 'l2' );
dist1in2 = compare_histograms( histA1d, histB1d, 'l2' );
dist1in3 = compare_histograms( histA1d, histC1d, 'l2' );

figure(1); subplot(2, 3, 1); imshow(A); 
figure(1); subplot(2, 3, 2); imshow(B);
figure(1); subplot(2, 3, 3); imshow(C);
figure(1); subplot(2, 3, 4); bar(histA1d); title(['l2(h1,h1)= ' num2str(dist1in1)]);
figure(1); subplot(2, 3, 5); bar(histB1d); title(['l2(h1,h2)= ' num2str(dist1in2)]);
figure(1); subplot(2, 3, 6); bar(histC1d); title(['l2(h1,h3)= ' num2str(dist1in3)]);







