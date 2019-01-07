
% mydisparity(2.5, 12)

% x1 = [1 2 1; 2 2 1; 5 7 1; 1 8 1; 5 0 1; 8 4 1; 7 7 1; 1 5 1];
% x2 = [1 1 1; 4 2 1; 3 6 1; 6 4 1; 9 7 1; 5 6 1; 7 6 1; 5 8 1];

% [F, e1, e2] = fundamental_matrix(x1, x2)

% hp = load('epipolar/house_points.txt');
hp = load('epipolar/house_matches.txt');

num_ones = ones(length(hp), 1);

x1 = [hp(:, 1) hp(:, 2) num_ones];
x2 = [hp(:, 3) hp(:, 4) num_ones];

F = fundamental_matrix(x1, x2);

house1 = rgb2gray(imread('epipolar/house1.jpg'));
house2 = rgb2gray(imread('epipolar/house2.jpg'));
%{
pos1 = [hp(:, 1) hp(:, 2)];
pos2 = [hp(:, 3) hp(:, 4)];

house1 = insertMarker(house1, pos1,'o','color','red', 'size', 2);
house2 = insertMarker(house2, pos2,'o','color','red', 'size', 2);

house1 = insertMarker(house1, [85, 233],'x','color','green', 'size', 2);
house2 = insertMarker(house2, [67, 219],'x','color','green', 'size', 2);

[h, w] = size(house2);

l2 = F * [85, 233, 1]';

figure(1); subplot(1, 2, 1); imshow(house1);
figure(1); subplot(1, 2, 2); imshow(house2);
hold on;
draw_line(l2, w, h, 'g');
hold off;

% c
[d, d1, d2] = reprojection_error(x1', x2', F);
dh = mean(d)

ds = reprojection_error([85 233 1]', [67, 219 1]', F)
%}


% e
[F, e1, e2, x1t, x2t] = ransac_fundamental(x1, x2, 5, 100, 119);

all1 = [hp(:, 1), hp(:, 2)];
all2 = [hp(:, 3), hp(:, 4)];

house1 = insertMarker(house1, all1,'o','color','red', 'size', 2);
house2 = insertMarker(house2, all2,'o','color','red', 'size', 2);

pos1 = [x1t(:, 1) x1t(:, 2)];
pos2 = [x2t(:, 1) x2t(:, 2)];

house1 = insertMarker(house1, pos1,'o','color','blue', 'size', 2);
house2 = insertMarker(house2, pos2,'o','color','blue', 'size', 2);

% id = randperm(length(x1t), 1);
p1=x1t(1, 1:2);
p2=x2t(1, 1:2);

house1 = insertMarker(house1, p1, 'o','color','green', 'size', 2);
house2 = insertMarker(house2, p2, 'o','color','green', 'size', 2);

[h, w] = size(house2);

inl = length(x2t) / length(all2);
[d, ~, ~] = reprojection_error(x1t', x2t', F);
err = mean(d)

figure(1); subplot(1, 2, 1); imshow(house1);
figure(1); subplot(1, 2, 2); imshow(house2);
hold on;
draw_line(F * [p1(1), p1(2), 1]', w, h, 'g');
hold off; title("inliers: " + inl + "Error: " + err);
