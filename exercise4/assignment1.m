% a

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
figure(1); subplot(2, 3, 2); imagesc(Ih2); colormap gray; title('Hessian, sigma = 3');
figure(1); subplot(2, 3, 3); imagesc(Ih3); colormap gray; title('Hessian, sigma = 3');
figure(1); subplot(2, 3, 4); imshow(Ip1); colormap gray; 
figure(1); subplot(2, 3, 5); imshow(Ip2); colormap gray; 
figure(1); subplot(2, 3, 6); imshow(Ip3); colormap gray; 


% b
%{
Ihar1 = I;

[pxh, pyh] = harris_points(Ihar1, 1, 100);
pos1 = [pxh(:) pyh(:)];

Ihar1 = uint8(Ihar1);
%}





