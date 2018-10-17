
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (a) Read image.
A = imread('umbrellas.jpg'); % Image A is in 8-bit format (uint8)

% figure(1); clf; imagesc(A); % open figure window, clear, draw
% figure(2); clf; imshow(A); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (b) Greyscale.

Ad = double(A); % division operation not defined for uint8
[h,w,d] = size(A); % output the size of the image (notice the absence of semicolon at the end of ?-the line)
A_gray = uint8((Ad(:,:,1) + Ad(:,:,2) + Ad(:,:,3)) / 3.0);
% figure(3); imshow(A_gray); % change image to 8-bit
% figure(4); imshow(A_gray); colormap jet

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (c) Cut.

A1 = A;
A1(130:260,240:450,3) = 0 ;
% figure(5);
% subplot(1,2,1);
% imshow(A1);
A2 = A(130:260,240:450, 1);
% subplot(1,2,2);
% imshow(A2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (d) Invert small square.

A3 = A_gray;
A3(130:260,240:450) = 255 - A3(130:260,240:450) ;
% figure(6); imshow(A3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (e) Lowest grayscale.

B = A;
Bd = double(B);
[ hb, wb, db ] = size(B);

B_grey = uint8((Bd(:,:,1) + Bd(:,:,2) + Bd(:,:,3)) / 3.0);
B_grey2 = uint8(round(B_grey * (63 / 255)));

% figure(7); clf; imagesc(B_grey);
% figure(8); clf; imshow(B_grey);

figure(9); clf; imshow(B_grey2);
figure(10); clf; imagesc(B_grey2);

% Razlaga iz lastnega opazanja:
% imgshow() kaze sliko v crno-belem medtem ko imagesc() v modro-rumenem
% imagesc() kaze koordinatni sistem imshow pa ne

% Razlaga iz dokumentacije:
% imagesec() ~ displays the data in array C as an image that uses the full range of
% colors in the colormap.
% imshow() ~ displays image I in a preeset figure.

