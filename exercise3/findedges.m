function [Ie] = findedges(I, sigma, theta)
    Ig = I;
    
    [Imag, Idir] = gradient_magnitude(Ig, sigma);
    
    % Imax = nonmaxima_suppression_line(Imag, Idir);
    
    Ie = Imag >= theta;