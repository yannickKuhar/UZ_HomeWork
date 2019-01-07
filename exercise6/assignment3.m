% (3.a)
D = deskriptor_nabora(1);
% D = deskriptor_nabora(2);

% (3.b)
[mi, Ub] = get_eigenvectors(D);

% 96 * 84

% I0 = (Ub(:, 1));
% I1 = (Ub(:, 2));
% I2 = (Ub(:, 3));
% I3 = (Ub(:, 4));
% I4 = (Ub(:, 5));
% 
% I0 = reshape(I0, [96, 84]);
% I1 = reshape(I1, [96, 84]);
% I2 = reshape(I2, [96, 84]);
% I3 = reshape(I3, [96, 84]);
% I4 = reshape(I4, [96, 84]);

% figure(1); subplot(1, 5, 1); imagesc(I0); colormap gray
% figure(1); subplot(1, 5, 2); imagesc(I1); colormap gray
% figure(1); subplot(1, 5, 3); imagesc(I2); colormap gray
% figure(1); subplot(1, 5, 4); imagesc(I3); colormap gray
% figure(1); subplot(1, 5, 5); imagesc(I4); colormap gray


% % TEST
% y = [];
% xq = [];
% 
% [h, w] = size(I0);
% 
% [mi, Ub] = get_eigenvectors(I0);
% 
% % (6.)
% for i = 1:w
%     y = [y, Ub' * (I0(:, i) - mi')];
% end
% 
% % (7.)
% for i = 1:w
%     tmp =(Ub * y(:, i)) + mi';
%     xq = [xq; tmp'];
% end
% 
% xq = xq';
% 
% figure(2); imagesc(xq); colormap gray

% % (3.b)
% D0 = reshape(D(:, 1), [96, 84]);
% 
% tmp = D(:, 1);
% tmp(4074) = 0;
% 
% % en pixel se spremeni v popolnoma crnega
% D1 = reshape(tmp, [96, 84]);
% 
% D = deskriptor_nabora(1);
% [mi, Ub] = get_eigenvectors(D);
% 
% D3 = D(:, 1);
% D3 = double(D3);
% 
% y = [Ub' * (D3 - mi')];
% 
% Ub(:, 2) = 0;
% 
% xq = (Ub * y) + mi';
% 
% D3 = reshape(xq, [96, 84]);
% 
% % Sprememba med originalno sliko in transformirani
% D4 = double(D1) - double(D0);
% D5 = D3 - double(D0);
% 
% figure(2); subplot(1, 5, 1); imshow(uint8(D0)); colormap gray;
% figure(2); subplot(1, 5, 2); imshow(uint8(D1));
% figure(2); subplot(1, 5, 3); imshow(uint8(D3));
% figure(2); subplot(1, 5, 4); imagesc(D4); 
% figure(2); subplot(1, 5, 5); imagesc(D5); 

% % (3.c)
% Im0 = imread('faces/2/024.png');
% I = Im0(:);
% I = double(I);
% 
% % V PCA space
% y = [Ub' * (I - mi')];
%  
% % y0 = y;
% % y1 = y;
% % y2 = y;
% % y3 = y;
% % y4 = y;
% % 
% % y0(33:64) = 0;
% % y1(17:64) = 0;
% % y2(9:64) = 0;
% % y3(5:64) = 0;
% % y4(3:64) = 0;
% 
% Ubtmp = Ub;
% 
% Ub1 = Ubtmp;
% Ub2 = Ubtmp;
% Ub3 = Ubtmp;
% Ub4 = Ubtmp;
% Ub5 = Ubtmp;
% 
% Ub1(:, 33:64) = 0;
% Ub2(:, 17:64) = 0;
% Ub3(:, 9:64) = 0;
% Ub4(:, 5:64) = 0;
% Ub5(:, 3:64) = 0;
% Ub6(:, 2:64) = 0;
% 
% xq0 = (Ub1 * y) + mi';
% xq1 = (Ub2 * y) + mi';
% xq2 = (Ub3 * y) + mi';
% xq3 = (Ub4 * y) + mi';
% xq4 = (Ub5 * y) + mi';
% xq5 = (Ub6 * y) + mi';
% 
% Im1 = reshape(xq0, [96, 84]);
% Im2 = reshape(xq1, [96, 84]);
% Im3 = reshape(xq2, [96, 84]);
% Im4 = reshape(xq3, [96, 84]);
% Im5 = reshape(xq4, [96, 84]);
% Im6 = reshape(xq5, [96, 84]);
% 
% figure(2); subplot(1, 7, 1); imshow(uint8(Im0)); title('original'); colormap gray;
% figure(2); subplot(1, 7, 2); imshow(uint8(Im1)); title('32');
% figure(2); subplot(1, 7, 3); imshow(uint8(Im2)); title('16');
% figure(2); subplot(1, 7, 4); imshow(uint8(Im3)); title('8');
% figure(2); subplot(1, 7, 5); imshow(uint8(Im4)); title('4');
% figure(2); subplot(1, 7, 6); imshow(uint8(Im5)); title('2');
% figure(2); subplot(1, 7, 7); imshow(uint8(Im5)); title('1');

% (3.e)
E = rgb2gray(imread('elephant.jpg'));

Ed = double(E(:));

y = [Ub' * (Ed - mi')];
xq = (Ub * y) + mi';

Et = reshape(xq, [96, 84]);

figure(2); subplot(1, 2, 1); imshow(E); title('Slon');
figure(2); subplot(1, 2, 2); imagesc(Et); title('Slon');