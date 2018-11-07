% 3.(a)
%{
A = rgb2gray(imread('lena.png'));
Icg = imnoise(A,'gaussian', 0, 0.01); % Gaussian noise
figure;
subplot(2,2,1); imshow(Icg); colormap gray;
axis equal; axis tight; title('Gaussian noise');
Ics = imnoise(A,'salt & pepper', 0.1); % Salt & pepper noise
subplot(2,2,2) ; imshow(uint8(Ics)); colormap gray;
axis equal; axis tight; title('Salt and pepper');

Icg_b = gaussfilter(double(Icg), 1);
Ics_b = gaussfilter(double(Ics), 1);

subplot(2,2,3) ; imshow(uint8(Icg_b)); colormap gray;
axis equal; axis tight; title('Filtered') ;
subplot(2,2,4) ; imshow(uint8(Ics_b)); colormap gray;
axis equal; axis tight; title('Filtered');

% Odg: Gaussian noise becouse Gaussian filtering is the inverse operation
%      of adding the noise.
%}

% 3.(b)
%{
two = zeros(3,3); two(2,2) = 2;
minis = ones(3, 3) .* 1/9;
f = two - minis;

A = imread('museum.jpg');
sharpening = conv2(double(rgb2gray(A)), f, 'same');
sharpening = conv2(sharpening, f', 'same');

figure(1); subplot(1, 2, 1); imshow(rgb2gray(A));
figure(1); subplot(1, 2, 2); imshow(uint8(sharpening));
%}

% 3.(c)
%{
x = [zeros(1, 14), ones(1, 11), zeros(1, 15)]; % Input signal
xc =x;xc(11)=5;xc(18) = 5; % Corrupted signal

figure;

subplot(1, 4, 1); plot(x); axis([1, 40, 0, 7]); title('Input');
subplot(1, 4, 2); plot(xc); axis([1, 40, 0, 7]); title('Corrupted');
g = gauss(1);
x_g = conv(xc, g, 'same');
x_m = simple_median(xc, 5);

subplot(1, 4, 3); plot(x_g); axis([1, 40, 0, 7]); title('Gauss');
subplot(1, 4, 4); plot(x_m); axis([1, 40, 0, 7]); title('Median');
%}






