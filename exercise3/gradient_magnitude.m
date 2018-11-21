function [Imag, Idir] = gradient_magnitude(I, sigma)
    Ig = I;
    [Ix, Iy] = image_derivatives(Ig, sigma);
    
    Imag = sqrt(Ix.^2 + Iy.^2);
    Idir = atan2(Iy, Ix);
    