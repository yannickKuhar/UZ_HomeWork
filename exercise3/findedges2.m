function [Ie] = findedges2(I, sigma, theta)
    Ig = I;
    
    [Imag, Idir] = gradient_magnitude(Ig, sigma);
    
    Imax = nonmaxima_suppression_line(Imag, Idir);
    
    Ie = Imax >= theta;