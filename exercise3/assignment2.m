% (a)
A = rgb2gray(imread('museum.jpg'));
A = double(A);

Ie1 = findedges(A, 1, 13);
Ie2 = findedges(A, 1, 20);
Ie3 = findedges(A, 1, 30);
Ie4 = findedges(A, 1, 40);
Ie5 = findedges(A, 1, 50);

% poskusil sem [5, 13] 
figure(1); subplot(1, 5, 1); imagesc(Ie1); title('t=13'); colormap gray;
figure(1); subplot(1, 5, 2); imagesc(Ie2); title('t=20'); colormap gray;
figure(1); subplot(1, 5, 3); imagesc(Ie3); title('t=30'); colormap gray;
figure(1); subplot(1, 5, 4); imagesc(Ie4); title('t=40'); colormap gray;
figure(1); subplot(1, 5, 5); imagesc(Ie5); title('t=50'); colormap gray;

% (b)
Ie1 = findedges2(A, 2, 13);
Ie2 = findedges2(A, 2, 20);
Ie3 = findedges2(A, 2, 30);
Ie4 = findedges2(A, 2, 40);
Ie5 = findedges2(A, 2, 50);

% poskusil sem [5, 13] 
figure(1); subplot(1, 5, 1); imagesc(Ie1); title('t=13'); colormap gray;
figure(1); subplot(1, 5, 2); imagesc(Ie2); title('t=20'); colormap gray;
figure(1); subplot(1, 5, 3); imagesc(Ie3); title('t=30'); colormap gray;
figure(1); subplot(1, 5, 4); imagesc(Ie4); title('t=40'); colormap gray;
figure(1); subplot(1, 5, 5); imagesc(Ie5); title('t=50'); colormap gray;