hp = load('epipolar/house_points.txt');

[h, w] = size(hp);

enke = ones(h, 1);

p1 = [hp(:, 1), hp(:, 2), enke]';
p2 = [hp(:, 3), hp(:, 4), enke]';

clbmtx1 = load('epipolar/house1_camera.txt');
clbmtx2 = load('epipolar/house2_camera.txt');

X = triangulate(p1, p2, clbmtx1, clbmtx2);

show_triangulation(X);