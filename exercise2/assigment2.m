% 2.(b)
fp = fopen('signal.txt','r');
kp = fopen('kernel.txt','r');

f = fscanf(fp,'%f');
k = fscanf(kp,'%f');

Ig = simple_convolution(f, k);
Ig_matlab = conv(f, k, 'same');

% 2.(c)
% figure(1); subplot(1,2,1); plot(Ig); title('simple\_conv');
% figure(1); subplot(1,2,2); plot(Ig_matlab); title('matlab\_conv');

% 2.(d)
%{
gk1 = gauss(0.5);
gk2 = gauss(1);
gk3 = gauss(2);
gk4 = gauss(3);
gk5 = gauss(4);

length(gk1) - 1
length(gk2) - 1
length(gk3) - 1
length(gk4) - 1
length(gk5) - 1

s1 = (0:length(gk1) - 1);
s2 = (0:length(gk2) - 1);
s3 = (0:length(gk3) - 1);
s4 = (0:length(gk4) - 1);
s5 = (0:length(gk5) - 1);

s1 = s1 - median(s1);
s2 = s2 - median(s2);
s3 = s3 - median(s3);
s4 = s4 - median(s4);
s5 = s5 - median(s5);

figure(1); clf;
hold on
plot(s1, gk1, s2, gk2, s3, gk3, s4, gk4, s5, gk5);
legend('sigma=0.5','sigma=1','sigma=2', 'sigma=3', 'sigma=4')
%}

% 2.(e)

k1 = gauss(2);
k2 = [0.1, 0.6, 0.4];

Ig1 = conv(f, k1, 'same');
Ig1 = conv(Ig1, k2, 'same');

Ig2 = conv(f, k2, 'same');
Ig2 = conv(Ig2, k1, 'same');

k3 = conv(k1, k2, 'same');
Ig3 = conv(f, k3, 'same');

figure(1); subplot(1, 4, 1); plot(f); title('s');
figure(1); subplot(1, 4, 2); plot(Ig1); title('(s * k1) * k2');
figure(1); subplot(1, 4, 3); plot(Ig2); title('(s * k2) * k1');
figure(1); subplot(1, 4, 4); plot(Ig3); title('s(k2 * k1)');








