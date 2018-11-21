%{
% (b)
impulse = zeros(25,25); 
impulse(13,13) = 255;
impulse = double(impulse);

sigma = 6.0;
G = gauss(sigma);
D = gaussdx(sigma);

% convolution with G and then convolution with Gt
ggt = conv2(impulse, G);
ggt = conv2(ggt, G');

%  convolution with G and then convolution with Dt
gdt = conv2(impulse, G);
gdt = conv2(gdt, D');

%  convolution with D and then convolution with Gt
dgt = conv2(impulse, D);
dgt = conv2(dgt, G');

% First convolution with GT and then convolution with D
gtd = conv2(impulse, G');
gtd = conv2(gtd, D);

% First convolution with DT and then convolution with G
dtg = conv2(impulse, D');
dtg = conv2(dtg, G);

figure(1); subplot(2, 3, 1); imagesc(impulse); title('Impulse'); colormap gray;
figure(1); subplot(2, 3, 4); imagesc(ggt); title('G, Gt'); 
figure(1); subplot(2, 3, 2); imagesc(gdt); title('G, Dt');
figure(1); subplot(2, 3, 3); imagesc(dgt); title('D, Gt');
figure(1); subplot(2, 3, 5); imagesc(gtd); title('Gt, D');
figure(1); subplot(2, 3, 6); imagesc(dtg); title('Dt, G');
%}

% (c)
A = rgb2gray(imread('museum.jpg'));
A = double(A);

[Ix, Iy] = image_derivatives(A, 2);
[Ixx, Iyy, Ixy] = image_derivatives2(A, 2);
[Imag, Idir] = gradient_magnitude(A, 2);

figure(1); subplot(2, 4, 1); imagesc(A); title('Original'); colormap gray;
figure(1); subplot(2, 4, 2); imagesc(Ix); title('Ix'); colormap gray;
figure(1); subplot(2, 4, 3); imagesc(Iy); title('Iy'); colormap gray;
figure(1); subplot(2, 4, 5); imagesc(Ixx); title('Ixx'); colormap gray;
figure(1); subplot(2, 4, 6); imagesc(Iyy); title('Iyy'); colormap gray;
figure(1); subplot(2, 4, 7); imagesc(Ixy); title('Ixy'); colormap gray;
figure(1); subplot(2, 4, 4); imagesc(Imag); title('Imag'); colormap gray;
figure(1); subplot(2, 4, 8); imagesc(Idir); title('Idir'); colormap gray;


