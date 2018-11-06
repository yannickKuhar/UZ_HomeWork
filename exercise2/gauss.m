function [g, x] = gauss(sigma)
x = -round(3.0*sigma):round(3.0*sigma);
pi = 3.14159265359;
g = (1 / sqrt(2 * pi) * sigma) * exp(- (x.^2 / (2 * sigma^2))); % <-- !!! TODO: calculate Gaussian kernel for values of x (in one line)
g = g / sum(g) ; % normalisation