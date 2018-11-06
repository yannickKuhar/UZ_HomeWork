
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
%{ 
%TODO: Odgovori na vpr.
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
%}

% (f)
%{
[histograms, files] = load_histogram_database('images', 8);

% A = imread(files{20});
% hist = myhist3(A, 8);
% hist1d = reshape(hist, 1, numel(hist));

distances = zeros(length(files), 1);

for i = 1:length(files)
    dist = compare_histograms(histograms(20,:), histograms(i,:), 'hellinger');
    distances(i) = dist;
end

[vals,idxs] = sort(distances);

A = imread(files{idxs(1)});
B = imread(files{idxs(2)});
C = imread(files{idxs(3)});
D = imread(files{idxs(4)});
E = imread(files{idxs(5)});
F = imread(files{idxs(6)});
 
figure(1); subplot(2, 6, 1); imshow(A);
figure(1); subplot(2, 6, 2); imshow(B); 
figure(1); subplot(2, 6, 3); imshow(C); 
figure(1); subplot(2, 6, 4); imshow(D); 
figure(1); subplot(2, 6, 5); imshow(E); 
figure(1); subplot(2, 6, 6); imshow(F);

figure(1); subplot(2, 6, 7); bar(histograms(idxs(1),:)); title(['hellinger= ' num2str(vals(1))]);
figure(1); subplot(2, 6, 8); bar(histograms(idxs(2),:)); title(['hellinger= ' num2str(vals(2))]);
figure(1); subplot(2, 6, 9); bar(histograms(idxs(3),:)); title(['hellinger= ' num2str(vals(3))]);
figure(1); subplot(2, 6, 10); bar(histograms(idxs(4),:)); title(['hellinger= ' num2str(vals(4))]);
figure(1); subplot(2, 6, 11); bar(histograms(idxs(5),:)); title(['hellinger= ' num2str(vals(5))]);
figure(1); subplot(2, 6, 12); bar(histograms(idxs(6),:)); title(['hellinger= ' num2str(vals(6))]);
%}

% (g)
[histograms, files] = load_histogram_database('images', 8);

distances = zeros(length(files), 1);

for i = 1:length(files)
    dist = compare_histograms(histograms(20,:), histograms(i,:), 'hellinger');
    distances(i) = dist;
end

[vals,idxs] = sort(distances);

x1 = idxs(1)
x2 = idxs(2)
x3 = idxs(3)
x4 = idxs(4)
x5 = idxs(5)

y1 = vals(1)
y2 = vals(2)
y3 = vals(3)
y4 = vals(4)
y5 = vals(5)

figure(1); subplot(1, 2, 1);
plot(distances)
hold on
plot(x1, y1, 'ro')
hold on
plot(x2, y2, 'ro')
hold on
plot(x3, y3, 'ro')
hold on
plot(x4, y4, 'ro')
hold on
plot(x5, y5, 'ro')
title('Unsorted');

x1 = 1;
x2 = 2;
x3 = 3;
x4 = 4;
x5 = 5;

y1 = vals(1);
y2 = vals(2);
y3 = vals(3);
y4 = vals(4);
y5 = vals(5);

figure(1); subplot(1, 2, 2);
plot(vals)
hold on
plot(x1, y1, 'ro')
hold on
plot(x2, y2, 'ro')
hold on
plot(x3, y3, 'ro')
hold on
plot(x4, y4, 'ro')
hold on
plot(x5, y5, 'ro')
title('Sorted');



