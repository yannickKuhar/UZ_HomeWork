% a

% I = rgb2gray(imread('test_points.png'));
I = rgb2gray(imread('graf/graf1.png'));
I = double(I);

Ih1 = hessian_points(I, 3);
Ih2 = hessian_points(I, 6);
Ih3 = hessian_points(I, 9);

Ip1 = I;
Ip2 = I;
Ip3 = I;

[px1, py1] = hessian_points2(I, 3, 100);
[px2, py2] = hessian_points2(I, 6, 100);
[px3, py3] = hessian_points2(I, 9, 100);

pos1 = [py1(:) px1(:)];
pos2 = [py2(:) px2(:)];
pos3 = [py3(:) px3(:)];

Ip1 = uint8(Ip1);
Ip2 = uint8(Ip2);
Ip3 = uint8(Ip3);

Ip1 = insertMarker(Ip1, pos1,'x','color','red', 'size',5);
Ip2 = insertMarker(Ip2, pos2,'x','color','red', 'size',5);
Ip3 = insertMarker(Ip3, pos3,'x','color','red', 'size',5);

figure(1); subplot(2, 3, 1); imagesc(Ih1); colormap gray; title('Hessian, sigma = 3'); 
figure(1); subplot(2, 3, 2); imagesc(Ih2); colormap gray; title('Hessian, sigma = 6');
figure(1); subplot(2, 3, 3); imagesc(Ih3); colormap gray; title('Hessian, sigma = 9');
figure(1); subplot(2, 3, 4); imshow(Ip1); colormap gray; 
figure(1); subplot(2, 3, 5); imshow(Ip2); colormap gray; 
figure(1); subplot(2, 3, 6); imshow(Ip3); colormap gray; 

% b

Ihar1 = I;
Ihar2 = I;
Ihar3 = I;

[pxh1, pyh1] = harris_points(Ihar1, 3, 100);
[pxh2, pyh2] = harris_points(Ihar2, 6, 100);
[pxh3, pyh3] = harris_points(Ihar3, 9, 100);

pos1 = [pyh1(:) pxh1(:)];
pos2 = [pyh2(:) pxh2(:)];
pos3 = [pyh3(:) pxh3(:)];

Ihar1 = uint8(Ihar1);
Ihar2 = uint8(Ihar2);
Ihar3 = uint8(Ihar3);

Ihar1 = insertMarker(Ihar1, pos1,'x','color','red', 'size',5);
Ihar2 = insertMarker(Ihar2, pos2,'x','color','red', 'size',5);
Ihar3 = insertMarker(Ihar3, pos3,'x','color','red', 'size',5);

figure(1); subplot(2, 3, 4); imshow(Ihar1);
figure(1); subplot(2, 3, 5); imshow(Ihar2);
figure(1); subplot(2, 3, 6); imshow(Ihar3);



